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
    study_references TEXT,
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
INSERT INTO questions (topic, difficulty, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, study_references) VALUES
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

-- Add Medium Difficulty Questions
INSERT INTO questions (topic, difficulty, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, study_references) VALUES

-- Shared Responsibility - Medium
('shared-responsibility', 'medium', 'Your company uses RDS with Multi-AZ deployment. In this setup, who is responsible for database failover?', 'Customer must manually trigger failover', 'AWS automatically handles failover', 'Database vendor handles failover', 'Failover is not supported', 1, 'AWS automatically handles failover in Multi-AZ deployments. The customer is responsible for application-level handling of connection retries.', 'Amazon RDS Multi-AZ Documentation|RDS Best Practices Guide'),

('shared-responsibility', 'medium', 'You are running a web application on EC2 behind an ELB. Who is responsible for SSL certificate management?', 'AWS manages all certificates', 'Customer must manage certificates', 'Both AWS and Customer share responsibility', 'Third-party certificate authority', 1, 'Customers are responsible for obtaining, installing, and renewing SSL certificates. AWS provides tools like ACM to help manage certificates.', 'AWS Certificate Manager Documentation|ELB SSL Configuration'),

-- Services Distinction - Medium  
('services-distinction', 'medium', 'Your application needs to process large amounts of data but only runs occasionally. Which compute service would be most cost-effective?', 'EC2 On-Demand instances', 'EC2 Reserved instances', 'AWS Lambda', 'Amazon ECS with EC2', 2, 'AWS Lambda is ideal for occasional workloads as you only pay for execution time, not idle time. Perfect for event-driven processing.', 'AWS Lambda Pricing|Compute Services Cost Optimization'),

('services-distinction', 'medium', 'You need a managed database service for a high-traffic web application with complex queries. Which service is most appropriate?', 'Amazon S3', 'Amazon RDS', 'AWS Lambda', 'Amazon ECS', 1, 'Amazon RDS provides managed relational databases optimized for complex queries and high-traffic applications with features like read replicas and Multi-AZ.', 'Amazon RDS Documentation|Database Selection Guide'),

-- Storage Classes - Medium
('storage-classes', 'medium', 'Your application has unpredictable access patterns - sometimes files are accessed daily, sometimes not for months. Which storage class is optimal?', 'S3 Standard (safest choice)', 'S3 Standard-IA (assume infrequent)', 'S3 Intelligent-Tiering (adapts to patterns)', 'S3 Glacier (cheapest option)', 2, 'S3 Intelligent-Tiering is perfect for unpredictable access patterns as it automatically optimizes costs by moving objects between tiers.', 'S3 Intelligent-Tiering Use Cases|S3 Storage Class Analysis'),

('storage-classes', 'medium', 'You have 10TB of log data that needs to be kept for compliance but is rarely accessed. What is the most cost-effective approach?', 'Keep everything in S3 Standard', 'Use S3 Standard-IA immediately', 'Use S3 Glacier for immediate archival', 'Use S3 Intelligent-Tiering with archive tiers', 3, 'S3 Intelligent-Tiering with optional archive tiers provides the most cost-effective solution for infrequently accessed compliance data.', 'S3 Glacier Documentation|Compliance Data Storage Best Practices'),

-- Security Services - Medium
('security-services', 'medium', 'Your web application is experiencing SQL injection attacks. Which AWS service should you implement?', 'AWS CloudWatch (for monitoring)', 'AWS Inspector (for vulnerabilities)', 'AWS WAF (for web protection)', 'AWS KMS (for encryption)', 2, 'AWS WAF (Web Application Firewall) protects against common web exploits like SQL injection and cross-site scripting.', 'AWS WAF Documentation|Web Application Security Guide'),

('security-services', 'medium', 'You need to detect vulnerabilities in your EC2 instances and container images. Which service should you use?', 'AWS CloudWatch', 'AWS Inspector', 'AWS WAF', 'AWS Config', 1, 'AWS Inspector automatically assesses EC2 instances and container images for software vulnerabilities and unintended network exposure.', 'AWS Inspector Documentation|Vulnerability Management Best Practices'),

-- Well-Architected - Medium
('well-architected', 'medium', 'Your system needs to handle a Black Friday traffic spike. Which Well-Architected principle should you prioritize?', 'Cost optimization (minimize spend)', 'Reliability (ensure availability)', 'Security (protect from attacks)', 'Operational Excellence (monitor everything)', 1, 'During traffic spikes, Reliability is crucial - your system must remain available and recover gracefully from any failures during peak demand.', 'Reliability Pillar Design Principles|Auto Scaling Best Practices'),

('well-architected', 'medium', 'You are designing a system that must be available 99.99% of the time. Which design patterns support this requirement?', 'Single region, single AZ deployment', 'Multi-AZ deployment with auto-scaling', 'Manual scaling and monitoring', 'Cost optimization over availability', 1, 'Multi-AZ deployment with auto-scaling provides high availability by distributing resources across multiple failure domains with automatic recovery.', 'High Availability Architecture Patterns|Multi-AZ Best Practices'),

-- Add Hard Difficulty Questions

-- Shared Responsibility - Hard
('shared-responsibility', 'hard', 'In a scenario where you are running containers on ECS with EC2 launch type, who is responsible for securing the container runtime?', 'AWS secures everything', 'Customer secures container images and runtime', 'Split between AWS (host) and Customer (containers)', 'Third-party container security tool', 2, 'AWS secures the underlying EC2 host and ECS service, while customers are responsible for securing container images, runtime configuration, and application-level security.', 'ECS Security Best Practices|AWS Container Security Documentation'),

-- Services Distinction - Hard  
('services-distinction', 'hard', 'You need to choose between Amazon ECS, EKS, and Lambda for a microservices architecture. What is the key deciding factor?', 'Cost is the only factor', 'Container orchestration needs vs serverless simplicity', 'Geographic availability', 'Programming language support', 1, 'Choose ECS/EKS for complex container orchestration needs and long-running services, Lambda for event-driven, stateless functions with automatic scaling.', 'AWS Container Services Comparison|Microservices on AWS'),

-- Storage Classes - Hard
('storage-classes', 'hard', 'You are designing a data lake with hot, warm, and cold data tiers. How would you implement this cost-effectively with S3?', 'Use only S3 Standard for simplicity', 'Manual lifecycle policies for each tier', 'S3 Intelligent-Tiering with optional archive tiers', 'Separate buckets for each temperature', 2, 'S3 Intelligent-Tiering with Archive and Deep Archive access tiers provides automatic optimization across all temperature levels without manual management.', 'S3 Data Lake Architecture|Advanced S3 Lifecycle Management'),

-- Security Services - Hard
('security-services', 'hard', 'You need to implement defense-in-depth for a critical application. Which combination provides the most comprehensive security?', 'Just WAF at the edge', 'WAF + CloudWatch + KMS encryption', 'IAM + MFA + WAF + KMS + Inspector + CloudTrail', 'Only network security groups', 2, 'Defense-in-depth requires multiple security layers: identity (IAM/MFA), network (WAF), encryption (KMS), monitoring (CloudWatch/CloudTrail), and vulnerability management (Inspector).', 'AWS Security Best Practices|Defense-in-Depth Architecture'),

-- Well-Architected - Hard
('well-architected', 'hard', 'You are designing a global application architecture. How do the Well-Architected pillars interact in your design decisions?', 'Focus on one pillar at a time', 'Pillars are independent and do not interact', 'Balance trade-offs between all pillars', 'Security pillar always overrides others', 2, 'Well-Architected design requires balancing trade-offs between all pillars. For example, global distribution improves reliability and performance but may increase costs and operational complexity.', 'AWS Well-Architected Tool|Multi-Region Architecture Patterns');