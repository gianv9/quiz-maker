-- Practice Exam 4 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('security-services', 'medium', 'multiple-choice', 'A developer needs to set up an SSL security certificate for a client''s eCommerce website in order to use the HTTPS protocol. Which of the following AWS services can be used to deploy the required SSL server certificates? (Choose TWO)', 'Amazon Route 53', 'AWS ACM', 'AWS Directory Service', 'AWS Identity & Access Management', '[0,1]', '', 'See AWS Documentation'),

-- Question 2
('services-distinction', 'medium', 'multiple-choice', 'Which of the following AWS services scale automatically without your intervention? (Choose TWO)', 'Amazon EC2', 'Amazon S3', 'AWS Lambda', 'Amazon EMR', '[1,2]', '', 'See AWS Documentation'),

-- Question 3
('shared-responsibility', 'medium', 'multiple-choice', 'A company is planning to migrate an application from Amazon EC2 to AWS Lambda to use a serverless architecture. Which of the following will be the responsibility of AWS after migration? (Choose TWO)', 'Application management', 'Capacity management', 'Access control', 'Operating system maintenance', '[1,3]', '', 'See AWS Documentation'),

-- Question 4
('services-distinction', 'medium', 'single-choice', 'How do ELBs improve the reliability of your application?', 'By distributing traffic across multiple S3 buckets', 'By replicating data to multiple availability zones', 'By creating database Read Replicas', 'By ensuring that only healthy targets receive traffic', '[3]', '', 'See AWS Documentation'),

-- Question 5
('services-distinction', 'medium', 'single-choice', 'A company needs to migrate their website from on-premises to AWS. Security is a major concern for them, so they need to host their website on hardware that is NOT shared with other AWS customers. Which of the following EC2 instance options meets this requirement?', 'On-demand instances', 'Spot instances', 'Dedicated instances', 'Reserved instances', '[2]', '', 'See AWS Documentation'),

-- Question 6
('services-distinction', 'hard', 'single-choice', 'A customer is planning to move billions of images and videos to be stored on Amazon S3. The customer has approximately 60 Petabytes of data to move. Which of the following AWS Services is the best choice to transfer the data to AWS?', 'Snowball', 'S3 Transfer Acceleration', 'Snowmobile', 'Amazon VPC', '[2]', '', 'See AWS Documentation'),

-- Question 7
('storage-classes', 'medium', 'single-choice', 'A company plans to migrate a large amount of archived data to AWS. The archived data must be maintained for a period of 5 years and must be retrievable within 5 hours of a request. What is the most cost-effective AWS storage service to use?', 'Amazon S3 Glacier', 'Amazon EFS', 'Amazon S3 Standard', 'Amazon EBS', '[0]', '', 'See AWS Documentation'),

-- Question 8
('security-services', 'easy', 'single-choice', 'Which AWS Service is used to manage user permissions?', 'Security Groups', 'Amazon ECS', 'AWS IAM', 'AWS Support', '[2]', '', 'See AWS Documentation'),

-- Question 9
('services-distinction', 'easy', 'single-choice', 'Which support plan includes AWS Support Concierge Service?', 'Premium Support', 'Business Support', 'Enterprise Support', 'Standard Support', '[2]', '', 'See AWS Documentation'),

-- Question 10
('services-distinction', 'medium', 'single-choice', 'A company needs to track resource changes using the API call history. Which AWS service can help the company achieve this goal?', 'AWS Config', 'Amazon CloudWatch', 'AWS CloudTrail', 'AWS CloudFormation', '[2]', '', 'See AWS Documentation'),

-- Question 11
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of using an AWS-managed service? (Choose TWO)', 'Provides complete control over the virtual infrastructure', 'Allows customers to deliver new solutions faster', 'Lowers operational complexity', 'Eliminates the need to encrypt data', '[1,2]', '', 'See AWS Documentation'),

-- Question 12
('storage-classes', 'medium', 'multiple-choice', 'Which of the following are use cases for Amazon S3? (Choose TWO)', 'Hosting static websites', 'Hosting websites that require sustained high CPU utilization', 'Cost-effective database and log storage', 'A media store for the CloudFront service', '[0,3]', '', 'See AWS Documentation'),

-- Question 13
('security-services', 'medium', 'single-choice', 'What is the AWS'' recommendation regarding access keys?', 'Delete all access keys and use passwords instead', 'Only share them with trusted people', 'Rotate them regularly', 'Save them within your application code', '[2]', '', 'See AWS Documentation'),

-- Question 14
('security-services', 'easy', 'single-choice', 'What is the AWS IAM feature that provides an additional layer of security on top of user-name and password authentication?', 'Key Pair', 'Access Keys', 'SDK', 'MFA', '[3]', '', 'See AWS Documentation'),

-- Question 15
('services-distinction', 'medium', 'single-choice', 'What is the benefit of using an API to access AWS Services?', 'It improves the performance of AWS resources', 'It reduces the time needed to provision AWS resources', 'It reduces the number of developers necessary', 'It allows for programmatic management of AWS resources', '[3]', '', 'See AWS Documentation'),

-- Question 16
('storage-classes', 'medium', 'single-choice', 'A company is planning to migrate a database with high read/write activity to AWS. What is the best storage option to use?', 'AWS Storage Gateway', 'Amazon S3', 'Amazon EBS', 'Amazon Glacier', '[2]', '', 'See AWS Documentation'),

-- Question 17
('services-distinction', 'medium', 'single-choice', 'How can AWS customers track and avoid over-spending on underutilized reserved instances?', 'Customers can add all AWS accounts to an AWS Organization, enable Consolidated Billing, and turn off Reserved Instance sharing', 'Customers can use Amazon Neptune to track and analyze their usage patterns, detect underutilized reserved instances, and then sell them on the Amazon EC2 Reserved Instance Marketplace', 'Customers can use the AWS Budgets service to track the reserved instances usage and set up alert notifications when their utilization drops below the threshold that they define', 'Customers can use Amazon CloudTrail to automatically check for unused reservations and get recommendations to reduce their bill', '[2]', '', 'See AWS Documentation'),

-- Question 18
('services-distinction', 'medium', 'single-choice', 'What is the AWS service that provides five times the performance of a standard MySQL database?', 'Amazon Aurora', 'Amazon Redshift', 'Amazon DynamoDB', 'Amazon Neptune', '[0]', '', 'See AWS Documentation'),

-- Question 19
('services-distinction', 'medium', 'single-choice', 'What does AWS Service Catalog provide?', 'It enables customers to quickly find descriptions and use cases for AWS services', 'It enables customers to explore the different catalogs of AWS services', 'It simplifies organizing and governing commonly deployed IT services', 'It allows developers to deploy infrastructure on AWS using familiar programming languages', '[2]', '', 'See AWS Documentation'),

-- Question 20
('shared-responsibility', 'medium', 'multiple-choice', 'For managed services like Amazon DynamoDB, which of the below is AWS responsible for? (Choose TWO)', 'Protecting credentials', 'Logging access activity', 'Patching the database software', 'Operating system maintenance', '[2,3]', '', 'See AWS Documentation'),

-- Question 21
('services-distinction', 'medium', 'single-choice', 'Which of the following AWS Services helps with planning application migration to the AWS Cloud?', 'AWS Snowball Migration Service', 'AWS Application Discovery Service', 'AWS DMS', 'AWS Migration Hub', '[1]', '', 'See AWS Documentation'),

-- Question 22
('services-distinction', 'medium', 'single-choice', 'A company is trying to analyze the costs applied to their AWS account recently. Which of the following provides them the most granular data about their AWS costs and usage?', 'Amazon Machine Image', 'AWS Cost Explorer', 'AWS Cost & Usage Report', 'Amazon CloudWatch', '[2]', '', 'See AWS Documentation'),

-- Question 23
('services-distinction', 'easy', 'single-choice', 'Which statement best describes the concept of an AWS region?', 'An AWS Region is a geographical location with a collection of Edge locations', 'An AWS Region is a virtual network dedicated only to a single AWS customer', 'An AWS Region is a geographical location with a collection of Availability Zones', 'An AWS Region represents the country where the AWS infrastructure exist', '[2]', '', 'See AWS Documentation'),

-- Question 24
('security-services', 'medium', 'single-choice', 'A company has discovered that multiple S3 buckets were deleted, but it is unclear who deleted the buckets. Which of the following can the company use to determine the identity that deleted the buckets?', 'SNS logs', 'SQS logs', 'CloudWatch Logs', 'CloudTrail logs', '[3]', '', 'See AWS Documentation'),

-- Question 25
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are factors in determining the appropriate database technology to use for a specific workload? (Choose TWO)', 'Availability Zones', 'Data sovereignty', 'The number of reads and writes per second', 'The nature of the queries', '[2,3]', '', 'See AWS Documentation'),

-- Question 26
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of implementing a tagging strategy for AWS resources? (Choose TWO)', 'Quickly identify resources that belong to a specific project', 'Quickly identify software solutions on AWS', 'Track API calls in your AWS account', 'Track AWS spending across multiple resources', '[0,3]', '', 'See AWS Documentation'),

-- Question 27
('shared-responsibility', 'medium', 'single-choice', 'What are AWS shared controls?', 'Controls that are solely the responsibility of the customer based on the application they are deploying within AWS services', 'Controls that a customer inherits from AWS', 'Controls that apply to both the infrastructure layer and customer layers', 'Controls that the customer and AWS collaborate together upon to secure the infrastructure', '[3]', '', 'See AWS Documentation'),

-- Question 28
('well-architected', 'medium', 'multiple-choice', 'Which design principles relate to performance efficiency in AWS? (Choose TWO)', 'Build multi-region architectures to better serve global customers', 'Apply security at all layers', 'Implement strong Identity and Access controls', 'Use serverless architectures', '[0,3]', '', 'See AWS Documentation'),

-- Question 29
('shared-responsibility', 'medium', 'multiple-choice', 'Which of the below are responsibilities of the customer when using Amazon EC2? (Choose TWO)', 'Protecting sensitive data', 'Patching of the underlying infrastructure', 'Setup and operation of managed databases', 'Installing and configuring third-party software', '[0,3]', '', 'See AWS Documentation'),

-- Question 30
('well-architected', 'medium', 'multiple-choice', 'Why would an organization decide to use AWS over an on-premises data center? (Choose TWO)', 'Free commercial software licenses', 'Free technical support', 'Elastic resources', 'Cost Savings', '[2,3]', '', 'See AWS Documentation'),

-- Question 31
('security-services', 'medium', 'multiple-choice', 'Which of the following AWS services can help you perform security analysis and regulatory compliance auditing? (Choose TWO)', 'Amazon Inspector', 'AWS Virtual Private Gateway', 'AWS Batch', 'AWS Config', '[0,3]', '', 'See AWS Documentation'),

-- Question 32
('services-distinction', 'easy', 'single-choice', 'Which of the following is NOT a characteristic of Amazon Elastic Compute Cloud (Amazon EC2)?', 'Amazon EC2 is considered a Serverless Web Service', 'Amazon EC2 eliminates the need to invest in hardware upfront', 'Amazon EC2 can launch as many or as few virtual servers as needed', 'Amazon EC2 offers scalable computing', '[0]', '', 'See AWS Documentation'),

-- Question 33
('services-distinction', 'easy', 'single-choice', 'What is the AWS Compute service that executes code only when triggered by events?', 'AWS Lambda', 'Amazon CloudWatch', 'AWS Transit Gateway', 'Amazon EC2', '[0]', '', 'See AWS Documentation'),

-- Question 34
('services-distinction', 'easy', 'single-choice', 'Both AWS and traditional IT distributors provide a wide range of virtual servers to meet their customers'' requirements. What is the name of these virtual servers in AWS?', 'Amazon EBS Snapshots', 'Amazon VPC', 'AWS Managed Servers', 'Amazon EC2 Instances', '[3]', '', 'See AWS Documentation'),

-- Question 35
('services-distinction', 'medium', 'single-choice', 'What is the framework created by AWS Professional Services that helps organizations design a road map to successful cloud adoption?', 'AWS Secrets Manager', 'AWS WAF', 'AWS CAF', 'Amazon EFS', '[2]', '', 'See AWS Documentation'),

-- Question 36
('services-distinction', 'medium', 'single-choice', 'TYMO Cloud Corp is looking forward to migrating their entire on-premises data center to AWS. What tool can they use to perform a cost-benefit analysis of moving to the AWS Cloud?', 'AWS Cost Explorer', 'AWS TCO Calculator', 'AWS Budgets', 'AWS Pricing Calculator', '[1]', '', 'See AWS Documentation'),

-- Question 37
('well-architected', 'medium', 'single-choice', 'Which of the following activities supports the Operational Excellence pillar of the AWS Well-Architected Framework?', 'Using AWS Trusted Advisor to find underutilized resources', 'Using AWS CloudTrail to record user activities', 'Using AWS CloudFormation to manage infrastructure as code', 'Deploying an application in multiple Availability Zones', '[2]', '', 'See AWS Documentation'),

-- Question 38
('well-architected', 'medium', 'multiple-choice', 'Why do many startup companies prefer AWS over traditional on-premises solutions? (Choose TWO)', 'AWS allows them to pay later when their business succeed', 'AWS can build complete data centers faster than any other Cloud provider', 'Using AWS, they can reduce time-to-market by focusing on business activities rather than on building and managing data centers', 'Using AWS allows companies to replace large capital expenditure with low variable costs', '[2,3]', '', 'See AWS Documentation'),

-- Question 39
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of using DynamoDB? (Choose TWO)', 'Automatically scales to meet required throughput capacity', 'Provides resizable instances to match the current demand', 'Supports both relational and non-relational data models', 'Offers extremely low (single-digit millisecond) latency', '[0,3]', '', 'See AWS Documentation'),

-- Question 40
('security-services', 'medium', 'multiple-choice', 'Which of the following can be used to protect data at rest on Amazon S3? (Choose TWO)', 'Versioning', 'Deduplication', 'Permissions', 'Decryption', '[0,2]', '', 'See AWS Documentation'),

-- Question 41
('services-distinction', 'medium', 'multiple-choice', 'As part of the AWS Migration Acceleration Program (MAP), what does AWS provide to accelerate Enterprise adoption of AWS? (Choose TWO)', 'AWS Partners', 'AWS Artifact', 'AWS Professional Services', 'Amazon Athena', '[0,2]', '', 'See AWS Documentation'),

-- Question 42
('services-distinction', 'medium', 'single-choice', 'AWS recommends some practices to help organizations avoid unexpected charges on their bill. Which of the following is NOT one of these practices?', 'Deleting unused EBS volumes after terminating an EC2instance', 'Deleting unused AutoScaling launch configuration', 'Deleting unused Elastic Load Balancers', 'Releasing unused Elastic IPs after terminating an EC2instance', '[1]', '', 'See AWS Documentation'),

-- Question 43
('services-distinction', 'medium', 'single-choice', 'What is the AWS tool that can help a company visualize their AWS spending in the last few months?', 'AWS Cost Explorer', 'AWS Pricing Calculator', 'AWS Budgets', 'AWS Consolidated Billing', '[0]', '', 'See AWS Documentation'),

-- Question 44
('shared-responsibility', 'medium', 'multiple-choice', 'When running a workload in AWS, the customer is NOT responsible for: (Select TWO)', 'Running penetration tests', 'Reserving capacity', 'Data center operations', 'Infrastructure security', '[2,3]', '', 'See AWS Documentation'),

-- Question 45
('services-distinction', 'medium', 'single-choice', 'Which AWS service can be used to send promotional text messages (SMS) to more than 200 countries worldwide?', 'Amazon Simple Email Service (Amazon SES)', 'Amazon Simple Storage Service (Amazon S3)', 'Amazon Simple Notification Service (Amazon SNS)', 'Amazon Simple Queue Service (Amazon SQS)', '[2]', '', 'See AWS Documentation'),

-- Question 46
('services-distinction', 'medium', 'multiple-choice', 'Which of the following allows you to create new RDS instances? (Choose TWO)', 'AWS CodeDeploy', 'AWS Quick Starts', 'AWS CloudFormation', 'AWS Management Console', '[2,3]', '', 'See AWS Documentation'),

-- Question 47
('services-distinction', 'easy', 'single-choice', 'One of the major advantages of using AWS is cost savings. What does AWS provide to reduce the cost of running Amazon EC2 instances?', 'Low monthly instance maintenance costs', 'Low-cost instance tagging', 'Per-second instance billing', 'Low instance start-up fees', '[2]', '', 'See AWS Documentation'),

-- Question 48
('services-distinction', 'medium', 'single-choice', 'Which AWS Group assists customers in achieving their desired business outcomes?', 'AWS Security Team', 'AWS Professional Services', 'AWS Trusted Advisor', 'AWS Concierge Support Team', '[1]', '', 'See AWS Documentation'),

-- Question 49
('security-services', 'easy', 'single-choice', 'Which AWS service or feature is used to manage the keys used to encrypt customer data?', 'AWS KMS', 'AWS Service Control Policies (SCPs)', 'Multi-Factor Authentication (MFA)', 'Amazon Macie', '[0]', '', 'See AWS Documentation'),

-- Question 50
('security-services', 'medium', 'single-choice', 'Which AWS Service allows customers to download AWS SOC & PCI reports?', 'AWS Well-Architected Tool', 'AWS Artifact', 'AWS Glue', 'Amazon Chime', '[1]', '', 'See AWS Documentation');