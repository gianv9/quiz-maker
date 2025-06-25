Practice Exam to SQL Conversion
Convert practice exam questions to SQL inserts for my quiz application.
Context
- Quiz app with single-choice and multiple-choice questions
- Uses penalty scoring: (correct - wrong) / total_correct * base_points
- Topics: shared-responsibility, services-distinction, storage-classes, security-services, well-architected
- PostgreSQL database with JSONB correct_answers field
Critical Requirements
- EXACT REPRODUCTION ONLY
    - Use questions and options EXACTLY as written in the provided files
    - Do NOT modify, rephrase, or make up any content
    - Do NOT add explanations or references not present in source
    - If explanation/references missing, use empty string or 'See AWS Documentation'
- output one exam/sql at a time...ask for confirmation
- SCHEMA CONSTRAINTS
    - Database supports EXACTLY 4 options per question (option_a, option_b, option_c, option_d)
    - If source has 5+ options, keep only the first 4 and adjust answer indices accordingly
    - All INSERT statements must have identical column counts
    - No tags column - remove any tag references
- FORMAT
- careful with comments between rows so the insert into doesn't break

Your Task
1. Parse the provided .md practice exam files
2. Generate SQL INSERT statements matching the schema
3. Categorize questions into appropriate topics/difficulty
4. Determine single-choice vs multiple-choice based on question wording
5. Ensure all questions have exactly 4 options

Output Format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES
-- Single choice example
('services-distinction', 'medium', 'single-choice', 'Which service provides managed relational databases?', 'Amazon RDS', 'Amazon S3', 'AWS Lambda', 'Amazon EC2', '[0]', 'Amazon RDS is AWS managed relational database service.', 'AWS RDS Documentation'),
-- Multiple choice example (exactly 4 options)
('security-services', 'hard', 'multiple-choice', 'Which services help with DDoS protection? (Select all that apply)', 'AWS Shield', 'AWS WAF', 'Amazon S3', 'Amazon CloudFront', '[0,1,3]', 'Shield, WAF, and CloudFront all provide DDoS protection capabilities.', 'AWS Security Best Practices');

Classification Guidelines
Topics:
- shared-responsibility - AWS vs customer responsibilities
- services-distinction - Service identification, use cases, differences
- storage-classes - S3 storage tiers, backup, archival
- security-services - IAM, encryption, monitoring, compliance
- well-architected - 6 pillars, design principles, best practices
Difficulty:
- easy - Basic concepts, definitions
- medium - Practical scenarios, comparisons
- hard - Complex architectures, trade-offs, advanced concepts
Question Type Detection:
- single-choice - "Which", "What", "Select the best"
- multiple-choice - "Select all", "Which of the following" (multiple answers)
Data Validation
- Verify correct_answers indices match actual correct options (0-3)
- Ensure JSONB format: '[0]' for single, '[0,1,2]' for multiple
- Check all required fields are populated
- Critical: All questions must have exactly 4 options
- Maintain original question numbering in comments if present
Files I'll provide:
- init.sql (database schema)
- Practice exam .md files (source questions)
Generate clean, executable SQL ready for database insertion.