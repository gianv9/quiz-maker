-- Insert single-choice questions (existing format converted)
INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Shared Responsibility - Single Choice
('shared-responsibility', 'easy', 'single-choice', 'In the AWS Shared Responsibility Model, who is responsible for patching the EC2 operating system?', 'AWS', 'Customer', 'Both AWS and Customer', 'Third-party vendor', '[1]', 'The customer is responsible for patching the guest operating system on EC2 instances. AWS manages the underlying hypervisor and physical infrastructure.', 'AWS Shared Responsibility Model Documentation|AWS Well-Architected Security Pillar'),

('shared-responsibility', 'easy', 'single-choice', 'Who is responsible for encrypting data at rest in Amazon S3?', 'AWS automatically handles all encryption', 'Customer must configure encryption', 'Both can provide encryption', 'No encryption is needed', '[2]', 'Both AWS and customers can provide encryption. AWS offers SSE-S3, SSE-KMS, and SSE-C options, while customers can also encrypt before uploading.', 'Amazon S3 Encryption Documentation|AWS KMS User Guide'),

-- Services Distinction - Single Choice
('services-distinction', 'easy', 'single-choice', 'Which of these AWS services is primarily a compute service?', 'Amazon S3', 'Amazon RDS', 'AWS Lambda', 'Amazon VPC', '[2]', 'AWS Lambda is a serverless compute service. S3 is storage, RDS is database, and VPC is networking.', 'AWS Compute Services Overview|AWS Lambda Documentation'),

('services-distinction', 'easy', 'single-choice', 'Amazon S3 is categorized as which type of service?', 'Compute', 'Storage', 'Database', 'Networking', '[1]', 'Amazon S3 (Simple Storage Service) is an object storage service, not a compute service.', 'Amazon S3 User Guide|AWS Storage Services Comparison'),

-- Storage Classes - Single Choice  
('storage-classes', 'easy', 'single-choice', 'Which S3 storage class is best for frequently accessed data?', 'S3 Standard', 'S3 Intelligent-Tiering', 'S3 Glacier', 'S3 Standard-IA', '[0]', 'S3 Standard provides high durability, availability, and performance for frequently accessed data.', 'S3 Storage Classes Documentation|S3 Cost Optimization Guide'),

('storage-classes', 'easy', 'single-choice', 'What is the main benefit of S3 Intelligent-Tiering?', 'Lowest cost storage', 'Automatic cost optimization', 'Fastest retrieval', 'Highest durability', '[1]', 'S3 Intelligent-Tiering automatically moves objects between access tiers based on changing access patterns, optimizing costs without performance impact.', 'S3 Intelligent-Tiering Documentation|AWS Storage Cost Optimization'),

-- Security Services - Single Choice
('security-services', 'easy', 'single-choice', 'What does AWS MFA provide?', 'Data encryption', 'Additional authentication layer', 'Network monitoring', 'Vulnerability scanning', '[1]', 'Multi-Factor Authentication (MFA) provides an additional security layer beyond username and password.', 'AWS MFA Documentation|IAM Best Practices'),

('security-services', 'easy', 'single-choice', 'Which service is used for managing encryption keys in AWS?', 'AWS CloudWatch', 'AWS KMS', 'AWS Inspector', 'AWS WAF', '[1]', 'AWS Key Management Service (KMS) is used for creating and managing encryption keys.', 'AWS KMS User Guide|Encryption Best Practices'),

-- Well-Architected - Single Choice
('well-architected', 'easy', 'single-choice', 'Which Well-Architected pillar focuses on the ability to monitor systems and improve supporting processes?', 'Reliability', 'Operational Excellence', 'Performance Efficiency', 'Security', '[1]', 'Operational Excellence focuses on running and monitoring systems, and continuously improving supporting processes and procedures.', 'AWS Well-Architected Framework|Operational Excellence Pillar'),

('well-architected', 'easy', 'single-choice', 'Which pillar emphasizes the ability to recover from failures?', 'Operational Excellence', 'Reliability', 'Cost Optimization', 'Sustainability', '[1]', 'The Reliability pillar focuses on the ability of a system to recover from infrastructure or service disruptions.', 'AWS Well-Architected Reliability Pillar|Disaster Recovery Strategies'),

-- Multiple Choice Questions
('shared-responsibility', 'easy', 'multiple-choice', 'Which of the following are customer responsibilities in the AWS Shared Responsibility Model? (Select all that apply)', 'Patching guest OS on EC2', 'Managing IAM users and policies', 'Physical security of data centers', 'Configuring security groups', '[0,1,3]', 'Customers are responsible for patching guest OS, managing IAM, and configuring security groups. AWS handles physical security of data centers.', 'AWS Shared Responsibility Model Documentation'),

('services-distinction', 'easy', 'multiple-choice', 'Which of these are AWS compute services? (Select all that apply)', 'Amazon EC2', 'Amazon S3', 'AWS Lambda', 'Amazon ECS', '[0,2,3]', 'EC2, Lambda, and ECS are compute services. S3 is a storage service.', 'AWS Compute Services Overview'),

('security-services', 'medium', 'multiple-choice', 'Which AWS services can help protect against DDoS attacks? (Select all that apply)', 'AWS Shield', 'AWS WAF', 'Amazon CloudFront', 'Amazon RDS', '[0,1,2]', 'AWS Shield provides DDoS protection, WAF filters malicious traffic, and CloudFront can absorb attacks. RDS is a database service.', 'AWS DDoS Protection Best Practices'),

('storage-classes', 'medium', 'multiple-choice', 'Which S3 storage classes are suitable for long-term archival? (Select all that apply)', 'S3 Standard', 'S3 Glacier Instant Retrieval', 'S3 Glacier Flexible Retrieval', 'S3 Glacier Deep Archive', '[1,2,3]', 'All Glacier tiers are designed for archival. S3 Standard is for frequently accessed data.', 'S3 Storage Classes for Archival'),

('well-architected', 'hard', 'multiple-choice', 'Which design patterns support the Reliability pillar? (Select all that apply)', 'Multi-AZ deployments', 'Auto Scaling Groups', 'Circuit breaker pattern', 'Single point of failure architecture', '[0,1,2]', 'Multi-AZ, Auto Scaling, and circuit breakers improve reliability. Single points of failure reduce reliability.', 'AWS Well-Architected Reliability Pillar');