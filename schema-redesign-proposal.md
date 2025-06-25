# Database Schema Redesign Proposal

## Overview
Complete schema redesign to support planned features from README roadmap while maintaining current functionality.

## New Schema (init.sql)

```sql
-- Users table for future user management
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quizzes table for multi-topic support
CREATE TABLE quizzes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    topics TEXT[], -- ['aws-security', 'networking', 'kubernetes']
    difficulty VARCHAR(10) CHECK (difficulty IN ('easy', 'medium', 'hard')),
    question_count INTEGER DEFAULT 10,
    is_active BOOLEAN DEFAULT true,
    created_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enhanced questions table
CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    difficulty VARCHAR(10) NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
    question_type VARCHAR(20) DEFAULT 'single-choice' CHECK (question_type IN ('single-choice', 'multiple-choice')),
    question_text TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_answers JSONB NOT NULL CHECK (
        jsonb_typeof(correct_answers) = 'array' AND 
        jsonb_array_length(correct_answers) >= 1 AND
        jsonb_array_length(correct_answers) <= 4
    ),
    explanation TEXT,
    study_references TEXT,
    tags TEXT[], -- ['security', 'storage', 'compute']
    source VARCHAR(50) DEFAULT 'manual', -- 'manual', 'ai-generated', 'imported'
    is_active BOOLEAN DEFAULT true,
    created_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Junction table for quiz-question relationships
CREATE TABLE quiz_questions (
    quiz_id INTEGER REFERENCES quizzes(id) ON DELETE CASCADE,
    question_id INTEGER REFERENCES questions(id) ON DELETE CASCADE,
    order_position INTEGER,
    PRIMARY KEY (quiz_id, question_id)
);

-- Enhanced scores table
CREATE TABLE scores (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    quiz_id INTEGER REFERENCES quizzes(id),
    -- Legacy fields for backward compatibility
    topic VARCHAR(50),
    difficulty VARCHAR(10),
    score INTEGER NOT NULL,
    correct_answers INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Question attempts for detailed analytics
CREATE TABLE question_attempts (
    id SERIAL PRIMARY KEY,
    score_id INTEGER REFERENCES scores(id) ON DELETE CASCADE,
    question_id INTEGER REFERENCES questions(id),
    user_answers JSONB,
    points_earned INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Performance indexes
CREATE INDEX idx_questions_topic_difficulty ON questions(topic, difficulty);
CREATE INDEX idx_questions_type ON questions(question_type);
CREATE INDEX idx_questions_active ON questions(is_active);
CREATE INDEX idx_questions_tags ON questions USING GIN (tags);
CREATE INDEX idx_questions_correct_answers ON questions USING GIN (correct_answers);
CREATE INDEX idx_quizzes_topics ON quizzes USING GIN (topics);
CREATE INDEX idx_scores_user_quiz ON scores(user_id, quiz_id);
CREATE INDEX idx_question_attempts_score ON question_attempts(score_id);

-- Sample data (existing questions + new structure)
INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references, tags) VALUES
-- Single choice questions
('shared-responsibility', 'easy', 'single-choice', 'In the AWS Shared Responsibility Model, who is responsible for patching the EC2 operating system?', 'AWS', 'Customer', 'Both AWS and Customer', 'Third-party vendor', '[1]', 'The customer is responsible for patching the guest operating system on EC2 instances.', 'AWS Shared Responsibility Model Documentation', ARRAY['security', 'ec2']),

-- Multiple choice questions  
('security-services', 'medium', 'multiple-choice', 'Which AWS services can help protect against DDoS attacks? (Select all that apply)', 'AWS Shield', 'AWS WAF', 'Amazon CloudFront', 'Amazon RDS', '[0,1,2]', 'AWS Shield provides DDoS protection, WAF filters malicious traffic, and CloudFront can absorb attacks.', 'AWS DDoS Protection Best Practices', ARRAY['security', 'ddos', 'networking']);

-- Sample quiz
INSERT INTO quizzes (name, description, topics, difficulty, question_count) VALUES
('AWS Security Fundamentals', 'Core security concepts across AWS services', ARRAY['shared-responsibility', 'security-services'], 'medium', 10);
```

## Impact Analysis

### Breaking Changes
- **API endpoints**: `/api/questions/{topic}/{difficulty}` → `/api/quizzes/{quiz_id}/questions`
- **Database structure**: Scores tied to quizzes instead of topic/difficulty
- **Frontend**: Quiz selection replaces topic/difficulty selection

### Backward Compatibility
- Legacy `topic`/`difficulty` fields maintained in scores table
- Current API can coexist during transition period

## Features Supported

### ✅ Current Features Enhanced
- **Multiple Selection Questions**: Native JSONB support with proper validation
- **Progress Tracking**: Detailed per-question analytics via `question_attempts`

### 🔄 Planned Features Enabled

**Multi-Topic Support**
- `quizzes` table supports mixed topics: `['aws', 'kubernetes', 'security']`
- Cross-domain question sets

**Admin Panel**
- CRUD operations on quizzes/questions via foreign keys
- `is_active`, `created_by`, `source` fields for management
- `tags` for question categorization

**User Management**  
- `users` table with foreign key relationships
- Per-user progress tracking

**Analytics Dashboard**
- `question_attempts` enables question-level performance analysis
- Quiz completion rates, difficulty analysis
- Tag-based topic performance

**Question Generator**
- `source` field tracks AI-generated vs manual questions
- `tags` enable topic-based generation

**API Documentation**
- Clean RESTful structure: `/api/quizzes`, `/api/questions`

## Required Code Changes

### Backend (app.py)
```python
# New endpoints
@app.route('/api/quizzes')
@app.route('/api/quizzes/<quiz_id>/questions') 
@app.route('/api/quizzes/<quiz_id>/attempt', methods=['POST'])

# Updated scoring with question_attempts tracking
def save_quiz_attempt(quiz_id, user_answers, detailed_results):
    # Save to scores + question_attempts tables
```

### Frontend 
- Quiz selection UI replacing topic/difficulty
- Updated question fetching from quiz endpoint
- Enhanced analytics dashboard

### Database Migration
```sql
-- For existing deployments
ALTER TABLE scores ADD COLUMN quiz_id INTEGER;
-- Data migration script to create default quizzes from existing topic/difficulty combinations
```

## Implementation Strategy

1. **Phase 1**: Deploy new schema with backward compatibility
2. **Phase 2**: Update API endpoints (maintain old ones)  
3. **Phase 3**: Update frontend to use quizzes
4. **Phase 4**: Remove legacy endpoints/fields

## Benefits

- **Scalable**: Supports unlimited topics/domains
- **Analytics-ready**: Question-level performance tracking
- **Admin-friendly**: Proper CRUD relationships
- **Future-proof**: Extensible for AI generation, user management
- **Performance**: Optimized indexes for common queries