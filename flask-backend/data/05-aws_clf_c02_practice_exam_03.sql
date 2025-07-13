-- Practice Exam 3 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('storage-classes', 'easy', 'multiple-choice', 'Where can you store files in AWS? (Choose TWO)', 'Amazon EFS', 'Amazon SNS', 'Amazon EBS', 'Amazon ECS', '[0,2]', '', 'See AWS Documentation'),

-- Question 2
('services-distinction', 'medium', 'single-choice', 'Which AWS service can be used to store and reliably deliver messages across distributed systems?', 'Amazon Simple Queue Service', 'AWS Storage Gateway', 'Amazon Simple Email Service', 'Amazon Simple Storage Service', '[0]', '', 'See AWS Documentation'),

-- Question 3
('services-distinction', 'easy', 'single-choice', 'Which of the following describes the payment model that AWS makes available for customers that can commit to using Amazon EC2 over a one or 3-year term to reduce their total computing costs?', 'Pay less as AWS grows', 'Pay as you go', 'Pay less by using more', 'Save when you reserve', '[3]', '', 'See AWS Documentation'),

-- Question 4
('services-distinction', 'medium', 'single-choice', 'A company is migrating its on-premises database to Amazon RDS. What should the company do to ensure Amazon RDS costs are kept to a minimum?', 'Right-size before and after migration', 'Use a Multi-Region Active-Passive architecture', 'Combine On-demand Capacity Reservations with Saving Plans', 'Use a Multi-Region Active-Active architecture', '[0]', '', 'See AWS Documentation'),

-- Question 5
('storage-classes', 'easy', 'single-choice', 'What is the primary storage service used by Amazon RDS database instances?', 'Amazon Glacier', 'Amazon EBS', 'Amazon EFS', 'Amazon S3', '[1]', '', 'See AWS Documentation'),

-- Question 6
('services-distinction', 'medium', 'single-choice', 'A company is developing a new application using a microservices framework. The new application is having performance and latency issues. Which AWS Service should be used to troubleshoot these issues?', 'AWS CodePipeline', 'AWS X-Ray', 'Amazon Inspector', 'AWS CloudTrail', '[1]', '', 'See AWS Documentation'),

-- Question 7
('well-architected', 'medium', 'multiple-choice', 'Which of the following AWS services is designed with native Multi-AZ fault tolerance in mind? (Choose TWO)', 'Amazon Redshift', 'AWS Snowball', 'Amazon Simple Storage Service', 'Amazon DynamoDB', '[2,3]', '', 'See AWS Documentation'),

-- Question 8
('services-distinction', 'medium', 'multiple-choice', 'What are the Amazon RDS features that can be used to improve the availability of your database? (Choose TWO)', 'AWS Regions', 'Multi-AZ Deployment', 'Automatic patching', 'Read Replicas', '[1,3]', '', 'See AWS Documentation'),

-- Question 9
('services-distinction', 'medium', 'single-choice', 'Sarah has deployed an application in the Northern California (us-west-1) region. After examining the application''s traffic, she notices that about 30% of the traffic is coming from Asia. What can she do to reduce latency for the users in Asia?', 'Replicate the current resources across multiple Availability Zones within the same region', 'Migrate the application to a hosting provider in Asia', 'Recreate the website content', 'Create a CDN using CloudFront, so that content is cached at Edge Locations close to and in Asia', '[3]', '', 'See AWS Documentation'),

-- Question 10
('security-services', 'easy', 'single-choice', 'An organization runs many systems and uses many AWS products. Which of the following services enables them to control how each developer interacts with these products?', 'AWS Identity and Access Management', 'Amazon RDS', 'Network Access Control Lists', 'Amazon EMR', '[0]', '', 'See AWS Documentation'),

-- Question 11
('services-distinction', 'easy', 'single-choice', 'Using Amazon EC2 falls under which of the following cloud computing models?', 'Iaas & SaaS', 'IaaS', 'SaaS', 'PaaS', '[1]', '', 'See AWS Documentation'),

-- Question 12
('well-architected', 'medium', 'single-choice', 'Which of the below is a best-practice when building applications on AWS?', 'Strengthen physical security by applying the principle of least privilege', 'Ensure that the application runs on hardware from trusted vendors', 'Use IAM policies to maintain performance', 'Decouple the components of the application so that they run independently', '[3]', '', 'See AWS Documentation'),

-- Question 13
('storage-classes', 'easy', 'single-choice', 'Your company is designing a new application that will store and retrieve photos and videos. Which of the following services should you recommend as the underlying storage mechanism?', 'Amazon EBS', 'Amazon SQS', 'Amazon Instance store', 'Amazon S3', '[3]', '', 'See AWS Documentation'),

-- Question 14
('storage-classes', 'medium', 'multiple-choice', 'Amazon Glacier is an Amazon S3 storage class that is suitable for storing [...] & [...]. (Choose TWO)', 'Active archives', 'Dynamic websites'' assets', 'Long-term analytic data', 'Active databases', '[0,2]', '', 'See AWS Documentation'),

-- Question 15
('services-distinction', 'medium', 'single-choice', 'What does Amazon Elastic Beanstalk provide?', 'A PaaS solution to automate application deployment', 'A compute engine for Amazon ECS', 'A scalable file storage solution for use with AWS and on-premises servers', 'A NoSQL database service', '[0]', '', 'See AWS Documentation'),

-- Question 16
('security-services', 'medium', 'single-choice', 'What is the AWS service that performs automated network assessments of Amazon EC2 instances to check for vulnerabilities?', 'Amazon Kinesis', 'Security groups', 'Amazon Inspector', 'AWS Network Access Control Lists', '[2]', '', 'See AWS Documentation'),

-- Question 17
('shared-responsibility', 'medium', 'multiple-choice', 'Under the Shared Responsibility Model, which of the following controls do customers fully inherit from AWS? (Choose TWO)', 'Patch management controls', 'Database controls', 'Awareness & Training', 'Environmental controls', '[3,2]', '', 'See AWS Documentation'),

-- Question 18
('services-distinction', 'medium', 'single-choice', 'A company needs to host a database in Amazon RDS for at least three years. Which of the following options would be the most cost-effective solution?', 'Reserved instances - No Upfront', 'Reserved instances - Partial Upfront', 'On-Demand instances', 'Spot Instances', '[1]', '', 'See AWS Documentation'),

-- Question 19
('well-architected', 'medium', 'single-choice', 'Your application has recently experienced significant global growth, and international users are complaining of high latency. What is the AWS characteristic that can help improve your international users'' experience?', 'Elasticity', 'Global reach', 'Data durability', 'High availability', '[1]', '', 'See AWS Documentation'),

-- Question 20
('services-distinction', 'medium', 'multiple-choice', 'Savings Plans are available for which of the following AWS compute services? (Choose TWO)', 'AWS Batch', 'AWS Outposts', 'Amazon Lightsail', 'Amazon EC2', '[3,0]', '', 'See AWS Documentation'),

-- Question 21
('well-architected', 'hard', 'single-choice', 'A company has business critical workloads hosted on AWS and they are unwilling to accept any downtime. Which of the following is a recommended best practice to protect their workloads in the event of an unexpected natural disaster?', 'Replicate data across multiple Edge Locations worldwide and use Amazon CloudFront to perform automatic failover in the event of an outage', 'Deploy AWS resources across multiple Availability Zones within the same AWS Region', 'Create point-in-time backups in another subnet and recover this data when a disaster occurs', 'Deploy AWS resources to another AWS Region and implement an Active-Active disaster recovery strategy', '[3]', '', 'See AWS Documentation'),

-- Question 22
('services-distinction', 'medium', 'multiple-choice', 'Which statement is correct with regards to AWS service limits? (Choose TWO)', 'You can contact AWS support to increase the service limits', 'Each IAM user has the same service limit', 'There are no service limits on AWS', 'You can use the AWS Trusted Advisor to monitor your service limits', '[0,3]', '', 'See AWS Documentation'),

-- Question 23
('services-distinction', 'easy', 'single-choice', 'What is the AWS tool that enables you to use scripts to manage all AWS services and resources?', 'AWS Console', 'AWS Service Catalog', 'AWS OpsWorks', 'AWS CLI', '[3]', '', 'See AWS Documentation'),

-- Question 24
('services-distinction', 'medium', 'multiple-choice', 'What are the connectivity options that can be used to build hybrid cloud architectures? (Choose TWO)', 'AWS Artifact', 'AWS Cloud9', 'AWS Direct Connect', 'AWS VPN', '[2,3]', '', 'See AWS Documentation'),

-- Question 25
('services-distinction', 'medium', 'single-choice', 'A company has deployed a new web application on multiple Amazon EC2 instances. Which of the following should they use to ensure that the incoming HTTP traffic is distributed evenly across the instances?', 'AWS EC2 Auto Recovery', 'AWS Auto Scaling', 'AWS Network Load Balancer', 'AWS Application Load Balancer', '[3]', '', 'See AWS Documentation'),

-- Question 26
('services-distinction', 'medium', 'single-choice', 'Which of the following AWS offerings is a MySQL-compatible relational database service that can scale capacity automatically based on demand?', 'Amazon Neptune', 'Amazon Aurora', 'Amazon RDS for SQL Server', 'Amazon RDS for PostgreSQL', '[1]', '', 'See AWS Documentation'),

-- Question 27
('security-services', 'medium', 'multiple-choice', 'Which of the following can help protect your EC2 instances from DDoS attacks? (Choose TWO)', 'AWS CloudHSM', 'Security Groups', 'AWS Batch', 'Network Access Control Lists (Network ACLs)', '[1,3]', '', 'See AWS Documentation'),

-- Question 28
('services-distinction', 'medium', 'single-choice', 'What is the AWS data warehouse service that supports a high level of query performance on large amounts of datasets?', 'Amazon Redshift', 'Amazon Kinesis', 'Amazon DynamoDB', 'Amazon RDS', '[0]', '', 'See AWS Documentation'),

-- Question 29
('services-distinction', 'medium', 'single-choice', 'Which of the following should be considered when performing a TCO analysis to compare the costs of running an application on AWS instead of on-premises?', 'Application development', 'Market research', 'Business analysis', 'Physical hardware', '[3]', '', 'See AWS Documentation'),

-- Question 30
('services-distinction', 'easy', 'single-choice', 'How are AWS customers billed for Linux-based Amazon EC2 usage?', 'EC2 instances will be billed on one second increments, with a minimum of one minute', 'EC2 instances will be billed on one hour increments, with a minimum of one day', 'EC2 instances will be billed on one minute increments, with a minimum of one hour', 'EC2 instances will be billed on one day increments, with a minimum of one month', '[0]', '', 'See AWS Documentation'),

-- Question 31
('services-distinction', 'medium', 'multiple-choice', 'Which of the following will impact the price paid for an EC2 instance? (Choose TWO)', 'Instance type', 'The Availability Zone where the instance is provisioned', 'Load balancing', 'Number of buckets', '[0,1]', '', 'See AWS Documentation'),

-- Question 32
('services-distinction', 'medium', 'single-choice', 'A customer spent a lot of time configuring a newly deployed Amazon EC2 instance. After the workload increases, the customer decides to provision another EC2 instance with an identical configuration. How can the customer achieve this?', 'By creating an AWS Config template from the old instance and launching a new instance from it', 'By creating an EBS Snapshot of the old instance', 'By installing Aurora on EC2 and launching a new instance from it', 'By creating an AMI from the old instance and launching a new instance from it', '[3]', '', 'See AWS Documentation'),

-- Question 33
('security-services', 'medium', 'single-choice', 'A company uses AWS Organizations to manage all of its AWS accounts. Which of the following allows the company to restrict what services and actions are allowed in each individual account?', 'IAM Principals', 'AWS Service Control Policies (SCPs)', 'IAM policies', 'AWS Fargate', '[1]', '', 'See AWS Documentation'),

-- Question 34
('well-architected', 'easy', 'single-choice', 'Which of the following statements describes the AWS Cloud''s agility?', 'AWS allows you to host your applications in multiple regions around the world', 'AWS provides customizable hardware at the lowest possible cost', 'AWS allows you to provision resources in minutes', 'AWS allows you to pay upfront to reduce costs', '[2]', '', 'See AWS Documentation'),

-- Question 35
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of using the Amazon Relational Database Service? (Choose TWO)', 'Lower administrative burden', 'Complete control over the underlying host', 'Resizable compute capacity', 'Scales automatically to larger or smaller instance types', '[0,2]', '', 'See AWS Documentation'),

-- Question 36
('services-distinction', 'medium', 'single-choice', 'What is the connectivity option that uses Internet Protocol Security (IPSec) to establish encrypted connectivity between an on-premises network and the AWS Cloud?', 'Internet Gateway', 'AWS IQ', 'AWS Direct Connect', 'AWS Site-to-Site VPN', '[3]', '', 'See AWS Documentation'),

-- Question 37
('services-distinction', 'easy', 'single-choice', 'What is the minimum level of AWS support that provides 24x7 access to technical support engineers via phone and chat?', 'Enterprise Support', 'Developer Support', 'Basic Support', 'Business Support', '[3]', '', 'See AWS Documentation'),

-- Question 38
('security-services', 'medium', 'multiple-choice', 'Which of the following is used to control network traffic in AWS? (Choose TWO)', 'Network Access Control Lists (NACLs)', 'Key Pairs', 'Access Keys', 'Security Groups', '[0,3]', '', 'See AWS Documentation'),

-- Question 39
('services-distinction', 'medium', 'single-choice', 'A company has developed a media transcoding application in AWS. The application is designed to recover quickly from hardware failures. Which one of the following types of instance would be the most cost-effective choice to use?', 'Reserved instances', 'Spot Instances', 'On-Demand instances', 'Dedicated instances', '[1]', '', 'See AWS Documentation'),

-- Question 40
('services-distinction', 'easy', 'single-choice', 'Which AWS Service provides the current status of all AWS Services in all AWS Regions?', 'AWS Service Health Dashboard', 'AWS Management Console', 'Amazon CloudWatch', 'AWS Personal Health Dashboard', '[0]', '', 'See AWS Documentation'),

-- Question 41
('services-distinction', 'easy', 'single-choice', 'Which AWS service or feature can be used to call AWS Services from different programming languages?', 'AWS Software Development Kit', 'AWS Command Line Interface', 'AWS CodeDeploy', 'AWS Management Console', '[0]', '', 'See AWS Documentation'),

-- Question 42
('services-distinction', 'easy', 'single-choice', 'Which AWS Service can be used to register a new domain name?', 'Amazon Personalize', 'Amazon Route 53', 'AWS KMS', 'AWS Config', '[1]', '', 'See AWS Documentation'),

-- Question 43
('services-distinction', 'medium', 'multiple-choice', 'App development companies move their business to AWS to reduce time-to-market and improve customer satisfaction, what are the AWS automation tools that help them deploy their applications faster? (Choose TWO)', 'AWS CloudFormation', 'AWS Migration Hub', 'AWS IAM', 'AWS Elastic Beanstalk', '[0,3]', '', 'See AWS Documentation'),

-- Question 44
('services-distinction', 'medium', 'single-choice', 'Which AWS service provides cost-optimization recommendations?', 'AWS Trusted Advisor', 'AWS Pricing Calculator', 'Amazon QuickSight', 'AWS X-Ray', '[0]', '', 'See AWS Documentation'),

-- Question 45
('services-distinction', 'medium', 'single-choice', 'A company has hundreds of VPCs in multiple AWS Regions worldwide. What service does AWS offer to simplify the connection management among the VPCs?', 'VPC Peering', 'AWS Transit Gateway', 'Amazon Connect', 'Security Groups', '[1]', '', 'See AWS Documentation'),

-- Question 46
('services-distinction', 'medium', 'multiple-choice', 'What is one benefit and one drawback of buying a reserved EC2 instance? (Select TWO)', 'Instances can be shut down by AWS at any time with no notification', 'Reserved instances require at least a one-year pricing commitment', 'There is no additional charge for using dedicated instances', 'Reserved instances provide a significant discount compared to on-demand instances', '[1,3]', '', 'See AWS Documentation'),

-- Question 47
('well-architected', 'medium', 'single-choice', 'Why does every AWS Region contain multiple Availability Zones?', 'Multiple Availability Zones allows you to build resilient and highly available architectures', 'Multiple Availability Zones results in lower total cost compared to deploying in a single Availability Zone', 'Multiple Availability Zones allows for data replication and global reach', 'Multiple Availability Zones within a region increases the storage capacity available in that region', '[0]', '', 'See AWS Documentation'),

-- Question 48
('services-distinction', 'medium', 'single-choice', 'What is the most cost-effective purchasing option for running a set of EC2 instances that must always be available for a period of two months?', 'On-Demand Instances', 'Spot Instances', 'Reserved Instances - All Upfront', 'Reserved Instances - No Upfront', '[0]', '', 'See AWS Documentation'),

-- Question 49
('well-architected', 'medium', 'single-choice', 'Which of the following is a benefit of running an application in multiple Availability Zones?', 'Allows you to exceed AWS service limits', 'Reduces application response time between servers and global users', 'Increases available compute capacity', 'Increases the availability of your application', '[3]', '', 'See AWS Documentation'),

-- Question 50
('security-services', 'medium', 'single-choice', 'Data security is one of the top priorities of AWS. How does AWS deal with old storage devices that have reached the end of their useful life?', 'AWS sells the old devices to other hosting providers', 'AWS destroys the old devices in accordance with industry-standard practices', 'AWS sends the old devices for remanufacturing', 'AWS stores the old devices in a secure place', '[1]', '', 'See AWS Documentation');