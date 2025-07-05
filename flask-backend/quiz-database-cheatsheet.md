# Quiz Database SQL Cheatsheet

## Basic Queries

### Get all questions for a topic
```sql
SELECT * FROM questions WHERE topic = 'services-distinction';
```

### Get questions by difficulty
```sql
SELECT * FROM questions WHERE difficulty = 'medium';
```

### Count questions by topic
```sql
SELECT topic, COUNT(*) as question_count 
FROM questions 
GROUP BY topic 
ORDER BY question_count DESC;
```

## Quiz Generation

### Random 10 questions from any topic
```sql
SELECT * FROM questions ORDER BY RANDOM() LIMIT 10;
```

### Random 5 questions from specific topic and difficulty
```sql
SELECT * FROM questions 
WHERE topic = 'security-services' AND difficulty = 'easy'
ORDER BY RANDOM() LIMIT 5;
```

### Mixed difficulty quiz (2 easy, 2 medium, 1 hard)
```sql
(SELECT * FROM questions WHERE difficulty = 'easy' ORDER BY RANDOM() LIMIT 2)
UNION ALL
(SELECT * FROM questions WHERE difficulty = 'medium' ORDER BY RANDOM() LIMIT 2)
UNION ALL
(SELECT * FROM questions WHERE difficulty = 'hard' ORDER BY RANDOM() LIMIT 1);
```

## Scoring & Validation

### Check if answer is correct (for question ID 1, user answered option 2)
```sql
SELECT 
    id,
    question_text,
    correct_answers,
    CASE WHEN correct_answers @> '[2]' THEN 'Correct' ELSE 'Incorrect' END as result
FROM questions WHERE id = 1;
```

### Multiple choice validation (user selected options 0,2)
```sql
SELECT 
    id,
    question_text,
    correct_answers,
    CASE WHEN correct_answers = '[0,2]' THEN 'Correct' ELSE 'Incorrect' END as result
FROM questions WHERE id = 4;
```

### Calculate penalty scoring formula
```sql
-- Formula: (correct - wrong) / total_correct * base_points
-- Example: User got 3 correct, 2 wrong out of 5 questions, base = 100
SELECT (3.0 - 2.0) / 3.0 * 100 as penalty_score;
```

## Analytics

### Questions distribution by topic and difficulty
```sql
SELECT 
    topic, 
    difficulty, 
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) as percentage
FROM questions 
GROUP BY topic, difficulty 
ORDER BY topic, difficulty;
```

### Find questions with no explanations
```sql
SELECT id, question_text 
FROM questions 
WHERE explanation IS NULL OR explanation = '';
```

### Average scores by topic
```sql
SELECT 
    topic,
    ROUND(AVG(score), 1) as avg_score,
    COUNT(*) as attempts
FROM scores 
GROUP BY topic 
ORDER BY avg_score DESC;
```

### Recent performance trends (last 30 days)
```sql
SELECT 
    DATE(created_at) as quiz_date,
    AVG(score) as avg_score,
    COUNT(*) as quiz_count
FROM scores 
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY DATE(created_at)
ORDER BY quiz_date;
```

## Content Management

### Find duplicate questions (same text)
```sql
SELECT question_text, COUNT(*) 
FROM questions 
GROUP BY question_text 
HAVING COUNT(*) > 1;
```

### Questions missing study references
```sql
SELECT id, topic, question_text 
FROM questions 
WHERE study_references IS NULL OR study_references = '';
```

### Update explanation for a question
```sql
UPDATE questions 
SET explanation = 'Updated explanation text'
WHERE id = 1;
```

### Add new question
```sql
INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references)
VALUES ('security-services', 'medium', 'single-choice', 'What is AWS IAM?', 'Identity Access Management', 'Infrastructure Access Manager', 'Internal Application Monitor', 'Internet Access Module', '[0]', 'IAM stands for Identity and Access Management', 'AWS IAM Documentation');
```

## Search & Filtering

### Search questions by keyword
```sql
SELECT * FROM questions 
WHERE question_text ILIKE '%cloudfront%' 
   OR explanation ILIKE '%cloudfront%';
```

### Questions with multiple correct answers
```sql
SELECT * FROM questions 
WHERE jsonb_array_length(correct_answers) > 1;
```

### Find all multiple-choice questions
```sql
SELECT topic, COUNT(*) 
FROM questions 
WHERE question_type = 'multiple-choice' 
GROUP BY topic;
```

## Performance Queries

### Most missed questions (requires question tracking)
```sql
SELECT 
    q.id,
    q.question_text,
    q.topic,
    q.difficulty,
    COUNT(s.id) as attempts,
    AVG(s.score) as avg_score
FROM questions q
LEFT JOIN scores s ON true  -- This would need actual question tracking
GROUP BY q.id, q.question_text, q.topic, q.difficulty
ORDER BY avg_score ASC;
```

### Topic mastery analysis
```sql
SELECT 
    topic,
    difficulty,
    AVG(score) as mastery_score,
    CASE 
        WHEN AVG(score) >= 80 THEN 'Mastered'
        WHEN AVG(score) >= 60 THEN 'Proficient' 
        ELSE 'Needs Work'
    END as status
FROM scores 
GROUP BY topic, difficulty
ORDER BY topic, difficulty;
```

## Utility Queries

### Database statistics
```sql
SELECT 
    'Total Questions' as metric, COUNT(*)::text as value FROM questions
UNION ALL
SELECT 'Total Quiz Attempts', COUNT(*)::text FROM scores
UNION ALL
SELECT 'Avg Questions per Topic', ROUND(COUNT(*)/COUNT(DISTINCT topic), 1)::text FROM questions;
```

### Check JSONB correct_answers format
```sql
SELECT id, correct_answers, jsonb_typeof(correct_answers) as type
FROM questions 
WHERE jsonb_typeof(correct_answers) != 'array'
   OR jsonb_array_length(correct_answers) = 0;
```

## Topics Reference

- `shared-responsibility` - AWS vs customer responsibilities
- `services-distinction` - Service identification, use cases, differences  
- `storage-classes` - S3 storage tiers, backup, archival
- `security-services` - IAM, encryption, monitoring, compliance
- `well-architected` - 6 pillars, design principles, best practices

## Difficulty Levels

- `easy` - Basic concepts, definitions
- `medium` - Practical scenarios, comparisons
- `hard` - Complex architectures, trade-offs, advanced concepts