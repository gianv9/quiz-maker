# Metabase Analytics Queries for Quiz Platform

## Setup Instructions

1. Start services: `docker-compose up -d`
2. Access Metabase at http://localhost:3000
3. Initial setup:
   - Create admin account
   - Add database connection:
     - Type: PostgreSQL
     - Host: db
     - Port: 5432
     - Database: awsgame
     - Username: postgres
     - Password: password

## Dashboard Queries

### 📊 Core Performance Metrics

#### Average Score by Topic
```sql
SELECT 
    topic,
    ROUND(AVG(score), 1) as avg_score,
    COUNT(*) as attempts,
    ROUND(AVG(correct_answers::float/total_questions * 100), 1) as avg_percentage
FROM scores
GROUP BY topic
ORDER BY avg_score DESC;
```

#### Score Distribution by Difficulty
```sql
SELECT 
    difficulty,
    COUNT(*) as attempts,
    ROUND(AVG(score), 1) as avg_score,
    MIN(score) as min_score,
    MAX(score) as max_score,
    ROUND(STDDEV(score), 1) as score_stddev
FROM scores
GROUP BY difficulty
ORDER BY 
    CASE difficulty 
        WHEN 'easy' THEN 1 
        WHEN 'medium' THEN 2 
        WHEN 'hard' THEN 3 
    END;
```

### 📈 Time Series Analysis

#### Daily Performance Trend
```sql
SELECT 
    DATE(created_at) as quiz_date,
    COUNT(*) as quizzes_taken,
    ROUND(AVG(score), 1) as avg_score,
    ROUND(AVG(correct_answers::float/total_questions * 100), 1) as success_rate
FROM scores
WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY DATE(created_at)
ORDER BY quiz_date;
```

#### Weekly Performance by Topic
```sql
SELECT 
    DATE_TRUNC('week', created_at) as week,
    topic,
    COUNT(*) as attempts,
    ROUND(AVG(score), 1) as avg_score
FROM scores
WHERE created_at >= CURRENT_DATE - INTERVAL '12 weeks'
GROUP BY DATE_TRUNC('week', created_at), topic
ORDER BY week DESC, topic;
```

### 🎯 Topic Analysis

#### Topic Mastery Matrix
```sql
SELECT 
    topic,
    difficulty,
    COUNT(*) as attempts,
    ROUND(AVG(score), 1) as avg_score,
    ROUND(AVG(correct_answers::float/total_questions * 100), 1) as success_rate,
    CASE 
        WHEN AVG(correct_answers::float/total_questions * 100) >= 80 THEN 'Mastered'
        WHEN AVG(correct_answers::float/total_questions * 100) >= 60 THEN 'Proficient'
        ELSE 'Needs Practice'
    END as mastery_level
FROM scores
GROUP BY topic, difficulty
ORDER BY topic, 
    CASE difficulty 
        WHEN 'easy' THEN 1 
        WHEN 'medium' THEN 2 
        WHEN 'hard' THEN 3 
    END;
```

#### Most Challenging Topics
```sql
SELECT 
    topic,
    ROUND(AVG(correct_answers::float/total_questions * 100), 1) as success_rate,
    COUNT(*) as attempts
FROM scores
GROUP BY topic
HAVING COUNT(*) >= 3  -- Only topics with sufficient data
ORDER BY success_rate ASC
LIMIT 5;
```

### 📉 Question Analysis

#### Question Inventory by Type
```sql
SELECT 
    topic,
    question_type,
    difficulty,
    COUNT(*) as question_count
FROM questions
GROUP BY topic, question_type, difficulty
ORDER BY topic, question_type, difficulty;
```

#### Questions with Multiple Correct Answers
```sql
SELECT 
    topic,
    difficulty,
    COUNT(*) as multi_answer_questions,
    ROUND(AVG(jsonb_array_length(correct_answers)), 1) as avg_correct_options
FROM questions
WHERE question_type = 'multiple-choice'
GROUP BY topic, difficulty
ORDER BY topic, difficulty;
```

### 🏆 Leaderboard Queries

#### Top Performers by Topic (Last 30 Days)
```sql
WITH recent_scores AS (
    SELECT 
        topic,
        score,
        correct_answers::float/total_questions * 100 as percentage,
        created_at,
        ROW_NUMBER() OVER (PARTITION BY topic ORDER BY score DESC) as rank
    FROM scores
    WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
)
SELECT 
    topic,
    MAX(score) as top_score,
    ROUND(MAX(percentage), 1) as best_percentage,
    COUNT(DISTINCT DATE(created_at)) as active_days
FROM recent_scores
WHERE rank = 1
GROUP BY topic
ORDER BY top_score DESC;
```

### 📊 Progress Tracking

#### Improvement Over Time (Rolling Average)
```sql
WITH rolling_scores AS (
    SELECT 
        created_at,
        score,
        AVG(score) OVER (
            ORDER BY created_at 
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) as rolling_avg
    FROM scores
    ORDER BY created_at
)
SELECT 
    DATE(created_at) as date,
    ROUND(AVG(rolling_avg), 1) as five_quiz_average
FROM rolling_scores
WHERE created_at >= CURRENT_DATE - INTERVAL '60 days'
GROUP BY DATE(created_at)
ORDER BY date;
```

#### Topic Coverage Heatmap Data
```sql
SELECT 
    topic,
    DATE_TRUNC('day', created_at) as day,
    COUNT(*) as attempts,
    AVG(score) as avg_score
FROM scores
WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY topic, DATE_TRUNC('day', created_at)
ORDER BY day DESC, topic;
```

## Metabase Visualization Tips

1. **Score Distribution**: Use histograms for score ranges
2. **Time Series**: Line charts with date on X-axis
3. **Topic Comparison**: Bar charts or radar charts
4. **Heatmaps**: Use pivot tables for topic/difficulty matrices
5. **Progress**: Use trend lines with rolling averages

## Advanced Filters

Add these as dashboard filters:
- Date range picker
- Topic multi-select
- Difficulty dropdown
- Minimum attempts threshold

## Scheduled Reports

Consider scheduling weekly email reports for:
- Weekly performance summary
- Most challenging topics
- Progress trends