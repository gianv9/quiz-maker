
-- # =============================================================================
-- # init.sql - Database initialization
-- # =============================================================================

-- Create questions table
CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    difficulty VARCHAR(10) NOT NULL,
    question_text TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_answer INTEGER NOT NULL,
    explanation TEXT,
    references TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create scores table
CREATE TABLE scores (
    id SERIAL PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    difficulty VARCHAR(10) NOT NULL,
    score INTEGER NOT NULL,
    correct_answers INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample questions
INSERT INTO questions (topic, difficulty, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, references) VALUES
('shared-responsibility', 'easy', 'In the AWS Shared Responsibility Model, who is responsible for patching the EC2 operating system?', 'AWS', 'Customer', 'Both AWS and Customer', 'Third-party vendor', 1, 'The customer is responsible for patching the guest operating system on EC2 instances. AWS manages the underlying hypervisor and physical infrastructure.', 'AWS Shared Responsibility Model Documentation|AWS Well-Architected Security Pillar'),

('shared-responsibility', 'easy', 'Who is responsible for encrypting data at rest in Amazon S3?', 'AWS automatically handles all encryption', 'Customer must configure encryption', 'Both can provide encryption', 'No encryption is needed', 2, 'Both AWS and customers can provide encryption. AWS offers SSE-S3, SSE-KMS, and SSE-C options, while customers can also encrypt before uploading.', 'Amazon S3 Encryption Documentation|AWS KMS User Guide'),

('services-distinction', 'easy', 'Which of these AWS services is primarily a compute service?', 'Amazon S3', 'Amazon RDS', 'AWS Lambda', 'Amazon VPC', 2, 'AWS Lambda is a serverless compute service. S3 is storage, RDS is database, and VPC is networking.', 'AWS Compute Services Overview|AWS Lambda Documentation'),

('services-distinction', 'easy', 'Amazon S3 is categorized as which type of service?', 'Compute', 'Storage', 'Database', 'Networking', 1, 'Amazon S3 (Simple Storage Service) is an object storage service, not a compute service.', 'Amazon S3 User Guide|AWS Storage Services Comparison'),

('storage-classes', 'easy', 'Which S3 storage class is best for frequently accessed data?', 'S3 Standard', 'S3 Intelligent-Tiering', 'S3 Glacier', 'S3 Standard-IA', 0, 'S3 Standard provides high durability, availability, and performance for frequently accessed data.', 'S3 Storage Classes Documentation|S3 Cost Optimization Guide'),

('storage-classes', 'easy', 'What is the main benefit of S3 Intelligent-Tiering?', 'Lowest cost storage', 'Automatic cost optimization', 'Fastest retrieval', 'Highest durability', 1, 'S3 Intelligent-Tiering automatically moves objects between access tiers based on changing access patterns, optimizing costs without performance impact.', 'S3 Intelligent-Tiering Documentation|AWS Storage Cost Optimization'),

('security-services', 'easy', 'What does AWS MFA provide?', 'Data encryption', 'Additional authentication layer', 'Network monitoring', 'Vulnerability scanning', 1, 'Multi-Factor Authentication (MFA) provides an additional security layer beyond username and password.', 'AWS MFA Documentation|IAM Best Practices'),

('security-services', 'easy', 'Which service is used for managing encryption keys in AWS?', 'AWS CloudWatch', 'AWS KMS', 'AWS Inspector', 'AWS WAF', 1, 'AWS Key Management Service (KMS) is used for creating and managing encryption keys.', 'AWS KMS User Guide|Encryption Best Practices'),

('well-architected', 'easy', 'Which Well-Architected pillar focuses on the ability to monitor systems and improve supporting processes?', 'Reliability', 'Operational Excellence', 'Performance Efficiency', 'Security', 1, 'Operational Excellence focuses on running and monitoring systems, and continuously improving supporting processes and procedures.', 'AWS Well-Architected Framework|Operational Excellence Pillar'),

('well-architected', 'easy', 'Which pillar emphasizes the ability to recover from failures?', 'Operational Excellence', 'Reliability', 'Cost Optimization', 'Sustainability', 1, 'The Reliability pillar focuses on the ability of a system to recover from infrastructure or service disruptions.', 'AWS Well-Architected Reliability Pillar|Disaster Recovery Strategies');