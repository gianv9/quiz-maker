import firebase_admin
from firebase_admin import credentials, firestore
import re
import json
import os

# Get the project ID from the .firebaserc file
project_id = None
try:
    # The script is in firebase-backend, .firebaserc is in the root.
    with open('.firebaserc', 'r') as f:
        firebaserc_data = json.load(f)
        project_id = firebaserc_data.get('projects', {}).get('default')
except (IOError, json.JSONDecodeError) as e:
    print(f"Could not read project ID from .firebaserc: {e}")

if not project_id:
    # Fallback to environment variable if .firebaserc fails
    project_id = os.environ.get('GOOGLE_CLOUD_PROJECT')

if not project_id:
    raise ValueError("Could not determine Project ID. Please set GOOGLE_CLOUD_PROJECT or ensure .firebaserc is correct.")

# Initialize Firebase Admin SDK with the correct project ID
cred = credentials.ApplicationDefault()
firebase_admin.initialize_app(cred, {
    'projectId': project_id,
})

db = firestore.client()

def delete_collection(coll_ref, batch_size):
    """Deletes a collection in batches to avoid out-of-memory errors."""
    docs = coll_ref.limit(batch_size).stream()
    deleted = 0

    for doc in docs:
        print(f'Deleting doc {doc.id} => {doc.to_dict()}')
        doc.reference.delete()
        deleted = deleted + 1

    if deleted >= batch_size:
        return delete_collection(coll_ref, batch_size)
    
    print(f"Deleted {deleted} documents from the collection.")

def parse_sql_value(text, start_pos):
    """Parse a single SQL value (string or array) starting at start_pos"""
    text = text.strip()
    
    if start_pos >= len(text):
        return None, start_pos
    
    # Skip whitespace and commas
    while start_pos < len(text) and text[start_pos] in ' \t\n\r,':
        start_pos += 1
    
    if start_pos >= len(text):
        return None, start_pos
    
    if text[start_pos] == "'":
        # Parse quoted string
        start_pos += 1  # Skip opening quote
        value = ""
        while start_pos < len(text):
            if text[start_pos] == "'":
                # Check if it's an escaped quote
                if start_pos + 1 < len(text) and text[start_pos + 1] == "'":
                    value += "'"
                    start_pos += 2
                else:
                    # End of string
                    start_pos += 1
                    break
            else:
                value += text[start_pos]
                start_pos += 1
        return value, start_pos
    
    elif text[start_pos] == '[':
        # Parse JSON array
        bracket_count = 1
        start_pos += 1
        value = "["
        while start_pos < len(text) and bracket_count > 0:
            char = text[start_pos]
            value += char
            if char == '[':
                bracket_count += 1
            elif char == ']':
                bracket_count -= 1
            start_pos += 1
        return value, start_pos
    
    else:
        # Parse unquoted value (shouldn't happen in our case)
        value = ""
        while start_pos < len(text) and text[start_pos] not in ',)':
            value += text[start_pos]
            start_pos += 1
        return value.strip(), start_pos

def parse_sql_tuple(tuple_content):
    """Parse a SQL tuple into individual values"""
    values = []
    pos = 0
    
    while pos < len(tuple_content):
        value, pos = parse_sql_value(tuple_content, pos)
        if value is not None:
            values.append(value)
        else:
            break
    
    return values

def parse_sql_file(file_path):
    print(f"\n--- Parsing file: {file_path} ---")
    try:
        with open(file_path, 'r') as f:
            content = f.read()
    except IOError as e:
        print(f"ERROR: Could not read file. {e}")
        return []

    questions = []
    # This regex finds all INSERT statements and captures the VALUES block
    insert_pattern = re.compile(r"INSERT INTO questions .*? VALUES\s*(.*?);", re.DOTALL | re.IGNORECASE)
    
    for insert_match in insert_pattern.finditer(content):
        values_block = insert_match.group(1)
        print(f"DEBUG: Raw values block found: {values_block[:200]}...")

        # Remove single-line comments (-- ...)
        values_block = re.sub(r'--.*\n', '', values_block)
        # Remove multi-line comments (/* ... */)
        values_block = re.sub(r'/\*.*?\*/', '', values_block, flags=re.DOTALL)

        print(f"DEBUG: Cleaned values block: {values_block[:200]}...")

        # Find all individual tuples within the values_block
        # More robust tuple finding that handles nested parentheses and quotes
        tuples = []
        pos = 0
        while pos < len(values_block):
            # Skip whitespace
            while pos < len(values_block) and values_block[pos] in ' \t\n\r':
                pos += 1
            
            if pos >= len(values_block):
                break
                
            if values_block[pos] == '(':
                # Found start of tuple
                paren_count = 1
                start_pos = pos + 1
                pos += 1
                
                while pos < len(values_block) and paren_count > 0:
                    char = values_block[pos]
                    if char == '(' and not_in_quotes(values_block, pos):
                        paren_count += 1
                    elif char == ')' and not_in_quotes(values_block, pos):
                        paren_count -= 1
                    pos += 1
                
                if paren_count == 0:
                    tuple_content = values_block[start_pos:pos-1]
                    tuples.append(tuple_content)
                    print(f"DEBUG: Found tuple: {tuple_content[:100]}...")
            else:
                pos += 1

        print(f"Found {len(tuples)} tuples in this INSERT statement.")
        
        for i, tuple_content in enumerate(tuples):
            print(f"DEBUG: Processing tuple {i+1}: {tuple_content[:100]}...")
            
            try:
                values = parse_sql_tuple(tuple_content)
                
                if len(values) != 11:
                    print(f"WARNING: Expected 11 fields, got {len(values)}: {tuple_content[:70]}...")
                    continue
                
                topic, difficulty, q_type, q_text, opt_a, opt_b, opt_c, opt_d, correct_answers_str, explanation, refs = values

                # Parse the JSONB array
                try:
                    correct_answers = json.loads(correct_answers_str)
                except json.JSONDecodeError as e:
                    print(f"ERROR: Invalid JSON in correct_answers: {correct_answers_str} - {e}")
                    continue

                questions.append({
                    'topic': topic,
                    'difficulty': difficulty,
                    'question_type': q_type,
                    'question_text': q_text,
                    'options': [opt_a, opt_b, opt_c, opt_d],
                    'correct_answers': correct_answers,
                    'explanation': explanation,
                    'study_references': refs.split('|') if refs else []
                })
                
                print(f"SUCCESS: Parsed question: {q_text[:50]}...")
                
            except Exception as e:
                print(f"ERROR parsing tuple: {tuple_content[:70]}... - {e}")

    print(f"Successfully parsed {len(questions)} questions from this file.")
    return questions

def not_in_quotes(text, pos):
    """Check if position is not inside a quoted string"""
    quote_count = 0
    for i in range(pos):
        if text[i] == "'" and (i == 0 or text[i-1] != "\\"):
            quote_count += 1
    return quote_count % 2 == 0

def upload_to_firestore(questions):
    questions_ref = db.collection('questions')
    print("\n--- Uploading to Firestore ---")
    for q in questions:
        questions_ref.add(q)
        print(f"Uploaded: {q['question_text'][:50]}...")
    print(f"Uploaded {len(questions)} questions to Firestore.")

if __name__ == '__main__':
    questions_collection_ref = db.collection('questions')
    
    print("--- Deleting existing questions to prevent duplicates ---")
    delete_collection(questions_collection_ref, 50)

    # The script is in firebase-backend, so the path is relative from there
    questions1 = parse_sql_file('../flask-backend/data/01-init.sql')
    questions2 = parse_sql_file('../flask-backend/data/02-sample_questions.sql')
    
    # Combine and remove duplicates that might exist between the two files
    # A simple way to deduplicate is to use a dictionary with question_text as key
    all_questions = questions1 + questions2
    unique_questions = {q['question_text']: q for q in all_questions}
    
    print(f"\n--- Summary ---")
    print(f"Questions from 01-init.sql: {len(questions1)}")
    print(f"Questions from 02-sample_questions.sql: {len(questions2)}")
    print(f"Total unique questions: {len(unique_questions)}")
    
    upload_to_firestore(list(unique_questions.values()))