import firebase_admin
from firebase_admin import credentials, firestore
import re
import json
import os

# --- Start of new code ---
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
# --- End of new code ---

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
    # This regex finds each individual row (tuple) within a VALUES block
    row_pattern = re.compile(r"\\((.*?)\\)", re.DOTALL)
    
    # This regex is designed to parse the fields from a single row
    # It now expects the content *inside* the parentheses
    row_parser = re.compile(r"""
        \s*'([^']*)',  # 1. topic
        \s*'([^']*)',  # 2. difficulty
        \s*'([^']*)',  # 3. question_type
        \s*'([^']*)',  # 4. question_text
        \s*'([^']*)',  # 5. option_a
        \s*'([^']*)',  # 6. option_b
        \s*'([^']*)',  # 7. option_c
        \s*'([^']*)',  # 8. option_d
        \s*(\[[^\]]*\]),   # 9. correct_answers (JSONB, e.g., [0,1,3]) - explicitly match []
        \s*'([^']*)',  # 10. explanation
        \s*'([^']*)'   # 11. study_references (NO trailing comma here, as it's the last field in the tuple)
    """, re.VERBOSE)

    for insert_match in insert_pattern.finditer(content):
        values_block = insert_match.group(1)
        print(f"DEBUG: Full values block (before cleaning): {values_block[:200]}...")

        # Remove single-line comments (-- ...)
        values_block = re.sub(r'--.*\n', '', values_block)
        # Remove multi-line comments (/* ... */)
        values_block = re.sub(r'/\*.*?\*/', '', values_block, flags=re.DOTALL)
        # Remove empty lines and strip leading/trailing whitespace
        values_block = '\n'.join([line.strip() for line in values_block.splitlines() if line.strip()])

        print(f"DEBUG: Full values block (after cleaning): {values_block[:200]}...")

        # Find all individual tuples within the values_block
        # This will capture the content *inside* each parenthesis pair
        tuple_contents = re.findall(r'\\((.*?)\\)', values_block, re.DOTALL)
        print(f"DEBUG: Found {len(tuple_contents)} raw tuples.")

        for row_content in tuple_contents:
            print(f"DEBUG: Processing row content: {row_content[:100]}...") # Debug print
            
            try:
                row_data = row_parser.search(row_content)
                if not row_data:
                    print(f"WARNING: Skipping malformed record (no match): {row_content[:70]}...")
                    continue

                groups = row_data.groups()
                
                topic, difficulty, q_type, q_text, opt_a, opt_b, opt_c, opt_d, correct_answers_str, explanation, refs = groups

                questions.append({
                    'topic': topic,
                    'difficulty': difficulty,
                    'question_type': q_type,
                    'question_text': q_text,
                    'options': [opt_a, opt_b, opt_c, opt_d],
                    'correct_answers': json.loads(correct_answers_str),
                    'explanation': explanation,
                    'study_references': refs.split('|')
                })
            except Exception as e:
                print(f"ERROR parsing a record: {row_content[:70]}... - {e}")

    print(f"Successfully parsed {len(questions)} questions from this file.")
    return questions


def upload_to_firestore(questions):
    questions_ref = db.collection('questions')
    print("\n--- Uploading to Firestore ---")
    for q in questions:
        questions_ref.add(q)
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
    unique_questions = {q['question_text']: q for q in questions1 + questions2}
    
    upload_to_firestore(list(unique_questions.values()))

