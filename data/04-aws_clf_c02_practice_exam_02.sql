-- Practice Exam 2 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('services-distinction', 'medium', 'single-choice', 'A global company with a large number of AWS accounts is seeking a way in which they can centrally manage billing and security policies across all accounts. Which AWS Service will assist them in meeting these goals?', 'AWS Organizations', 'AWS Trusted Advisor', 'IAM User Groups', 'AWS Config', '[0]', '', 'See AWS Documentation'),

-- Question 2  
('storage-classes', 'easy', 'single-choice', 'Which service provides object-level storage in AWS?', 'Amazon EBS', 'Amazon Instance Store', 'Amazon EFS', 'Amazon S3', '[3]', '', 'See AWS Documentation'),

-- Question 3
('services-distinction', 'medium', 'single-choice', 'A company is concerned that they are spending money on underutilized compute resources in AWS. Which AWS feature will help ensure that their applications are automatically adding/removing EC2 compute capacity to closely match the required demand?', 'AWS Elastic Load Balancer', 'AWS Budgets', 'AWS Auto Scaling', 'AWS Cost Explorer', '[2]', '', 'See AWS Documentation'),

-- Question 4
('storage-classes', 'medium', 'single-choice', 'Which S3 storage class is best for data with unpredictable access patterns?', 'Amazon S3 Intelligent-Tiering', 'Amazon S3 Glacier Flexible Retrieval', 'Amazon S3 Standard', 'Amazon S3 Standard-Infrequent Access', '[0]', '', 'See AWS Documentation'),

-- Question 5
('services-distinction', 'easy', 'single-choice', 'What is the AWS database service that allows you to upload data structured in key-value format?', 'Amazon DynamoDB', 'Amazon Aurora', 'Amazon Redshift', 'Amazon RDS', '[0]', '', 'See AWS Documentation'),

-- Question 6
('services-distinction', 'easy', 'single-choice', 'Which of the following is NOT correct regarding Amazon EC2 On-demand instances?', 'You have to pay a start-up fee when launching a new instance for the first time', 'The on-demand instances follow the AWS pay-as-you-go pricing model', 'With on-demand instances, no longer-term commitments or upfront payments are needed', 'When using on-demand Linux instances, you are charged per second based on an hourly rate', '[0]', '', 'See AWS Documentation'),

-- Question 7
('security-services', 'medium', 'multiple-choice', 'A company has moved to AWS recently. Which of the following AWS Services will help ensure that they have the proper security settings? (Choose TWO)', 'AWS Trusted Advisor', 'Amazon Inspector', 'Amazon SNS', 'Amazon CloudWatch', '[0,1]', '', 'See AWS Documentation'),

-- Question 8
('security-services', 'easy', 'single-choice', 'What is the AWS feature that provides an additional level of security above the default authentication mechanism of usernames and passwords?', 'Encrypted keys', 'Email verification', 'AWS KMS', 'AWS MFA', '[3]', '', 'See AWS Documentation'),

-- Question 9
('services-distinction', 'medium', 'single-choice', 'A company is introducing a new product to their customers, and is expecting a surge in traffic to their web application. As part of their Enterprise Support plan, which of the following provides the company with architectural and scaling guidance?', 'AWS Knowledge Center', 'AWS Health Dashboard', 'Infrastructure Event Management', 'AWS Support Concierge Service', '[2]', '', 'See AWS Documentation'),

-- Question 10
('services-distinction', 'medium', 'single-choice', 'You work as an on-premises MySQL DBA. The work of database configuration, backups, patching, and DR can be time-consuming and repetitive. Your company has decided to migrate to the AWS Cloud. Which of the following can help save time on database maintenance so you can focus on data architecture and performance?', 'Amazon RDS', 'Amazon Redshift', 'Amazon DynamoDB', 'Amazon CloudWatch', '[0]', '', 'See AWS Documentation'),

-- Question 11
('well-architected', 'medium', 'single-choice', 'Which of the below is a best-practice when designing solutions on AWS?', 'Invest heavily in architecting your environment, as it is not easy to change your design later', 'Use AWS reservations to reduce costs when testing your production environment', 'Automate wherever possible to make architectural experimentation easier', 'Provision a large compute capacity to handle any spikes in load', '[2]', '', 'See AWS Documentation'),

-- Question 12
('security-services', 'medium', 'single-choice', 'According to the AWS Acceptable Use Policy, which of the following statements is true regarding penetration testing of EC2 instances?', 'Penetration testing is not allowed in AWS', 'Penetration testing is performed automatically by AWS to determine vulnerabilities in your AWS infrastructure', 'Penetration testing can be performed by the customer on their own instances without prior authorization from AWS', 'The AWS customers are only allowed to perform penetration testing on services managed by AWS', '[2]', '', 'See AWS Documentation'),

-- Question 13
('services-distinction', 'medium', 'single-choice', 'Which service is used to ensure that messages between software components are not lost if one or more components fail?', 'Amazon SQS', 'Amazon SES', 'AWS Direct Connect', 'Amazon Connect', '[0]', '', 'See AWS Documentation'),

-- Question 14
('well-architected', 'medium', 'multiple-choice', 'The principle "design for failure and nothing will fail" is very important when designing your AWS Cloud architecture. Which of the following would help adhere to this principle? (Choose TWO)', 'Multi-factor authentication', 'Availability Zones', 'Elastic Load Balancing', 'Penetration testing', '[1,2]', '', 'See AWS Documentation'),

-- Question 15
('services-distinction', 'easy', 'single-choice', 'What is the AWS service that provides a virtual network dedicated to your AWS account?', 'AWS VPN', 'AWS Subnets', 'AWS Dedicated Hosts', 'Amazon VPC', '[3]', '', 'See AWS Documentation'),

-- Question 16
('shared-responsibility', 'medium', 'multiple-choice', 'According to the AWS Shared responsibility model, which of the following are the responsibility of the customer? (Choose TWO)', 'Managing environmental events of AWS data centers', 'Protecting the confidentiality of data in transit in Amazon S3', 'Controlling physical access to AWS Regions', 'Patching applications installed on Amazon EC2', '[1,3]', '', 'See AWS Documentation'),

-- Question 17
('services-distinction', 'easy', 'multiple-choice', 'Which of the following AWS services can be used as a compute resource? (Choose TWO)', 'Amazon VPC', 'Amazon CloudWatch', 'Amazon S3', 'Amazon EC2', '[3,1]', '', 'See AWS Documentation'),

-- Question 18
('storage-classes', 'easy', 'single-choice', 'Your company is designing a new application that will store and retrieve photos and videos. Which of the following services should you recommend as the underlying storage mechanism?', 'Amazon EBS', 'Amazon SQS', 'Amazon S3', 'Amazon Instance store', '[2]', '', 'See AWS Documentation'),

-- Question 19
('security-services', 'easy', 'single-choice', 'Which of the following is equivalent to a user name and password and is used to authenticate your programmatic access to AWS services and APIs?', 'Instance Password', 'Key pairs', 'Access Keys', 'MFA', '[2]', '', 'See AWS Documentation'),

-- Question 20
('services-distinction', 'medium', 'single-choice', 'What does Amazon ElastiCache provide?', 'In-memory caching for read-heavy applications', 'An Ehcache compatible in-memory data store', 'An online software store that allows Customers to launch pre-configured software with just few clicks', 'A domain name system in the cloud', '[0]', '', 'See AWS Documentation'),

-- Question 21
('services-distinction', 'easy', 'single-choice', 'What is the AWS service that enables you to manage all of your AWS accounts from a single master account?', 'AWS WAF', 'AWS Trusted Advisor', 'AWS Organizations', 'Amazon Config', '[2]', '', 'See AWS Documentation'),

-- Question 22
('services-distinction', 'medium', 'single-choice', 'Which of the following EC2 instance purchasing options supports the Bring Your Own License (BYOL) model for almost every BYOL scenario?', 'Dedicated Instances', 'Dedicated Hosts', 'On-demand Instances', 'Reserved Instances', '[1]', '', 'See AWS Documentation'),

-- Question 23
('well-architected', 'easy', 'single-choice', 'Which of the following is one of the benefits of moving infrastructure from an on-premises data center to AWS?', 'Free support for all enterprise customers', 'Automatic data protection', 'Reduced Capital Expenditure (CapEx)', 'AWS holds responsibility for managing customer applications', '[2]', '', 'See AWS Documentation'),

-- Question 24
('well-architected', 'medium', 'multiple-choice', 'Which of the following are important design principles you should adopt when designing systems on AWS? (Choose TWO)', 'Always use Global Services in your architecture rather than Regional Services', 'Always choose to pay as you go', 'Treat servers as fixed resources', 'Automate wherever possible', '[3,1]', '', 'See AWS Documentation'),

-- Question 25
('services-distinction', 'medium', 'single-choice', 'Which AWS Service can be used to establish a dedicated, private network connection between AWS and your datacenter?', 'AWS Direct Connect', 'Amazon CloudFront', 'AWS Snowball', 'Amazon Route 53', '[0]', '', 'See AWS Documentation'),

-- Question 26
('services-distinction', 'medium', 'single-choice', 'You are working on two projects that require completely different network configurations. Which AWS service or feature will allow you to isolate resources and network configurations?', 'Internet gateways', 'Virtual Private Cloud', 'Security Groups', 'Amazon CloudFront', '[1]', '', 'See AWS Documentation'),

-- Question 27
('security-services', 'medium', 'single-choice', 'Which of the following services can help protect your web applications from SQL injection and other vulnerabilities in your application code?', 'Amazon Cognito', 'AWS IAM', 'Amazon Aurora', 'AWS WAF', '[3]', '', 'See AWS Documentation'),

-- Question 28
('services-distinction', 'medium', 'single-choice', 'An organization needs to analyze and process a large number of data sets. Which AWS service should they use?', 'Amazon EMR', 'Amazon MQ', 'Amazon SNS', 'Amazon SQS', '[0]', '', 'See AWS Documentation'),

-- Question 29
('shared-responsibility', 'medium', 'multiple-choice', 'Based on the AWS Shared Responsibility Model, which of the following are the sole responsibility of AWS? (Choose TWO)', 'Monitoring network performance', 'Installing software on EC2 instances', 'Creating hypervisors', 'Hardware maintenance', '[2,3]', '', 'See AWS Documentation'),

-- Question 30
('services-distinction', 'easy', 'single-choice', 'What is the AWS service that provides you the highest level of control over the underlying virtual infrastructure?', 'Amazon Redshift', 'Amazon DynamoDB', 'Amazon EC2', 'Amazon RDS', '[2]', '', 'See AWS Documentation'),

-- Question 31
('security-services', 'easy', 'single-choice', 'What are the default security credentials that are required to access the AWS management console for an IAM user account?', 'MFA', 'Security tokens', 'A user name and password', 'Access keys', '[2]', '', 'See AWS Documentation'),

-- Question 32
('services-distinction', 'medium', 'single-choice', 'In your on-premises environment, you can create as many virtual servers as you need from a single template. What can you use to perform the same in AWS?', 'IAM', 'An internet gateway', 'EBS Snapshot', 'AMI', '[3]', '', 'See AWS Documentation'),

-- Question 33
('well-architected', 'medium', 'multiple-choice', 'What are two advantages of using Cloud Computing over using traditional data centers? (Choose TWO)', 'Reserved Compute capacity', 'Eliminating Single Points of Failure (SPOFs)', 'Distributed infrastructure', 'Virtualized compute resources', '[1,2]', '', 'See AWS Documentation'),

-- Question 34
('shared-responsibility', 'medium', 'multiple-choice', 'Which of the following aspects of security are managed by AWS? (Choose TWO)', 'Encryption of EBS volumes', 'VPC security', 'Access permissions', 'Hardware patching', '[3,2]', '', 'See AWS Documentation'),

-- Question 35
('well-architected', 'medium', 'single-choice', 'Which statement best describes the operational excellence pillar of the AWS Well-Architected Framework?', 'The ability of a system to recover gracefully from failure', 'The efficient use of computing resources to meet requirements', 'The ability to monitor systems and improve supporting processes and procedures', 'The ability to manage datacenter operations more efficiently', '[2]', '', 'See AWS Documentation'),

-- Question 36
('services-distinction', 'medium', 'single-choice', 'AWS has created a large number of Edge Locations as part of its Global Infrastructure. Which of the following is NOT a benefit of using Edge Locations?', 'Edge locations are used by CloudFront to cache the most recent responses', 'Edge locations are used by CloudFront to improve your end users'' experience when uploading files', 'Edge locations are used by CloudFront to distribute traffic across multiple instances to reduce latency', 'Edge locations are used by CloudFront to distribute content to global users with low latency', '[2]', '', 'See AWS Documentation'),

-- Question 37
('services-distinction', 'medium', 'multiple-choice', 'What are the change management tools that helps AWS customers audit and monitor all resource changes in their AWS environment? (Choose TWO)', 'AWS CloudTrail', 'Amazon Comprehend', 'AWS Transit Gateway', 'AWS Config', '[0,3]', '', 'See AWS Documentation'),

-- Question 38
('services-distinction', 'medium', 'single-choice', 'Which of the following services allows you to run containerized applications on a cluster of EC2 instances?', 'Amazon ECS', 'AWS Data Pipeline', 'AWS Cloud9', 'AWS Personal Health Dashboard', '[0]', '', 'See AWS Documentation'),

-- Question 39
('security-services', 'medium', 'single-choice', 'Which of the following services will help businesses ensure compliance in AWS?', 'CloudFront', 'CloudEndure Migration', 'CloudWatch', 'CloudTrail', '[3]', '', 'See AWS Documentation'),

-- Question 40
('storage-classes', 'medium', 'single-choice', 'Which of the following procedures will help reduce your Amazon S3 costs?', 'Use the Import/Export feature to move old files automatically to Amazon Glacier', 'Use the right combination of storage classes based on different use cases', 'Pick the right Availability Zone for your S3 bucket', 'Move all the data stored in S3 standard to EBS', '[1]', '', 'See AWS Documentation'),

-- Question 41
('well-architected', 'medium', 'multiple-choice', 'What are the AWS services/features that can help you maintain a highly available and fault-tolerant architecture in AWS? (Choose TWO)', 'AWS Direct Connect', 'Amazon EC2 Auto Scaling', 'Elastic Load Balancer', 'CloudFormation', '[1,2]', '', 'See AWS Documentation'),

-- Question 42
('services-distinction', 'medium', 'single-choice', 'Which of the following activities may help reduce your AWS monthly costs?', 'Enabling Amazon EC2 Auto Scaling for all of your workloads', 'Using the AWS Network Load Balancer (NLB) to load balance the incoming HTTP requests', 'Removing all of your Cost Allocation Tags', 'Deploying your AWS resources across multiple Availability Zones', '[0]', '', 'See AWS Documentation'),

-- Question 43
('services-distinction', 'medium', 'single-choice', 'What is the AWS service/feature that takes advantage of Amazon CloudFront''s globally distributed edge locations to transfer files to S3 with higher upload speeds?', 'S3 Transfer Acceleration', 'AWS WAF', 'AWS Snowmobile', 'AWS Snowball', '[0]', '', 'See AWS Documentation'),

-- Question 44
('security-services', 'medium', 'single-choice', 'Which of the following AWS security features is associated with an EC2 instance and functions to filter incoming traffic requests?', 'AWS X-Ray', 'Network ACL', 'Security Groups', 'VPC Flow logs', '[2]', '', 'See AWS Documentation'),

-- Question 45
('services-distinction', 'medium', 'multiple-choice', 'Which AWS services can be used to improve the performance of a global application and reduce latency for its users? (Choose TWO)', 'AWS KMS', 'AWS Global accelerator', 'AWS Direct Connect', 'Amazon CloudFront', '[1,3]', '', 'See AWS Documentation'),

-- Question 46
('shared-responsibility', 'medium', 'multiple-choice', 'Using Amazon RDS falls under the shared responsibility model. Which of the following are customer responsibilities? (Choose TWO)', 'Building the relational database schema', 'Performing backups', 'Managing the database settings', 'Patching the database software', '[0,2]', '', 'See AWS Documentation'),

-- Question 47
('services-distinction', 'medium', 'single-choice', 'A company has a large amount of structured data stored in their on-premises data center. They are planning to migrate all the data to AWS, what is the most appropriate AWS database option?', 'Amazon DynamoDB', 'Amazon SNS', 'Amazon RDS', 'Amazon ElastiCache', '[2]', '', 'See AWS Documentation'),

-- Question 48
('services-distinction', 'medium', 'single-choice', 'A company has created a solution that helps AWS customers improve their architectures on AWS. Which AWS program may support this company?', 'APN Consulting Partners', 'AWS TAM', 'APN Technology Partners', 'AWS Professional Services', '[0]', '', 'See AWS Documentation'),

-- Question 49
('services-distinction', 'easy', 'single-choice', 'What is the AWS serverless service that allows you to run your applications without any administrative burden?', 'Amazon LightSail', 'AWS Lambda', 'Amazon RDS instances', 'Amazon EC2 instances', '[1]', '', 'See AWS Documentation'),

-- Question 50
('well-architected', 'medium', 'single-choice', 'Jessica is managing an e-commerce web application in AWS. The application is hosted on six EC2 instances. One day, three of the instances crashed; but none of her customers were affected. What has Jessica done correctly in this scenario?', 'She has properly built an elastic system', 'She has properly built a fault tolerant system', 'She has properly built an encrypted system', 'She has properly built a scalable system', '[1]', '', 'See AWS Documentation');