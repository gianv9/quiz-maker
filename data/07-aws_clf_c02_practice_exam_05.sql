-- Practice Exam 5 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('well-architected', 'medium', 'single-choice', 'A company is using EC2 Instances to run their e-commerce site on the AWS platform. If the site becomes unavailable, the company will lose a significant amount of money for each minute the site is unavailable. Which design principle should the company use to minimize the risk of an outage?', 'Least Privilege', 'Pilot Light', 'Fault Tolerance', 'Multi-threading', '[2]', '', 'See AWS Documentation'),

-- Question 2
('services-distinction', 'medium', 'single-choice', 'You decide to buy a reserved instance for a term of one year. Which option provides the largest total discount?', 'All up-front reservation', 'All reserved instance payment options provide the same discount level', 'Partial up-front reservation', 'No up-front reservation', '[0]', '', 'See AWS Documentation'),

-- Question 3
('security-services', 'medium', 'multiple-choice', 'What features does AWS offer to help protect your data in the Cloud? (Choose TWO)', 'Access control', 'Physical MFA devices', 'Data encryption', 'Unlimited storage', '[0,2]', '', 'See AWS Documentation'),

-- Question 4
('services-distinction', 'medium', 'single-choice', 'An AWS customer has used one Amazon Linux instance for 2 hours, 5 minutes and 9 seconds, and one CentOS instance for 4 hours, 23 minutes and 7 seconds. How much time will the customer be billed for?', '3 hours for the Linux instance and 5 hours for the CentOS instance', '2 hours, 5 minutes and 9 seconds for the Linux instance and 4 hours, 23 minutes and 7 seconds for the CentOS instance', '2 hours, 5 minutes and 9 seconds for the Linux instance and 5 hours for the CentOS instance', '3 hours for the Linux instance and 4 hours, 23 minutes and 7 seconds for the CentOS instance', '[2]', 'Pricing is per instance-hour consumed for each instance, from the time an instance is launched until it is terminated or stopped. Each partial instance-hour consumed will be billed per-second for Linux, Windows, Windows with SQL Enterprise, Windows with SQL Standard, and Windows with SQL Web Instances, and as a full hour for all other instance types.', 'See AWS Documentation'),

-- Question 5
('services-distinction', 'easy', 'single-choice', 'What is the AWS Support feature that allows customers to manage support cases programmatically?', 'AWS Trusted Advisor', 'AWS Operations Support', 'AWS Support API', 'AWS Personal Health Dashboard', '[2]', '', 'See AWS Documentation'),

-- Question 6
('security-services', 'medium', 'multiple-choice', 'Which methods can be used by customers to interact with AWS Identity and Access Management (IAM)? (Choose TWO)', 'AWS CLI', 'AWS Security Groups', 'AWS SDKs', 'AWS Network Access Control Lists', '[0,2]', '', 'See AWS Documentation'),

-- Question 7
('security-services', 'easy', 'multiple-choice', 'Which of the following are types of AWS Identity and Access Management (IAM) identities? (Choose TWO)', 'AWS Resource Groups', 'IAM Policies', 'IAM Roles', 'IAM Users', '[2,3]', '', 'See AWS Documentation'),

-- Question 8
('services-distinction', 'medium', 'single-choice', 'Which of the following Amazon RDS features facilitates offloading of database read activity?', 'Database Snapshots', 'Multi-AZ Deployments', 'Automated Backups', 'Read Replicas', '[3]', '', 'See AWS Documentation'),

-- Question 9
('security-services', 'medium', 'single-choice', 'How does AWS notify customers about security and privacy events pertaining to AWS services?', 'Using the AWS ACM service', 'Using Security Bulletins', 'Using the AWS Management Console', 'Using Compliance Resources', '[1]', '', 'See AWS Documentation'),

-- Question 10
('security-services', 'medium', 'single-choice', 'Which IAM entity can best be used to grant temporary access to your AWS resources?', 'IAM Users', 'Key Pair', 'IAM Roles', 'IAM Groups', '[2]', '', 'See AWS Documentation'),

-- Question 11
('services-distinction', 'medium', 'single-choice', 'A company has a web application that is hosted on a single EC2 instance and is approaching 100 percent CPU Utilization during peak loads. Rather than scaling the server vertically, the company has decided to deploy three Amazon EC2 instances in parallel and to distribute traffic across the three servers. What AWS Service should the company use to distribute the traffic evenly?', 'AWS Global Accelerator', 'AWS Application Load Balancer (ALB)', 'Amazon CloudFront', 'Transit VPC', '[1]', '', 'See AWS Documentation'),

-- Question 12
('well-architected', 'medium', 'single-choice', 'Which of the following approaches will help you eliminate human error and automate the process of creating and updating your AWS environment?', 'Use Software test automation tools', 'Use AWS CodeDeploy to build and automate your AWS environment', 'Use code to provision and operate your AWS infrastructure', 'Migrate all of your applications to a dedicated host', '[2]', '', 'See AWS Documentation'),

-- Question 13
('security-services', 'medium', 'single-choice', 'A company is seeking to better secure its AWS account from unauthorized access. Which of the below options can the customer use to achieve this goal?', 'Restrict any API call made through SDKs or CLI', 'Create one IAM account for each department in the company (Development, QA, Production), and share it across all staff in that department', 'Require Multi-Factor Authentication (MFA) for all IAM User access', 'Set up two login passwords', '[2]', '', 'See AWS Documentation'),

-- Question 14
('services-distinction', 'easy', 'single-choice', 'Which AWS Service offers volume discounts based on usage?', 'Amazon VPC', 'Amazon S3', 'Amazon Lightsail', 'AWS Cost Explorer', '[1]', '', 'See AWS Documentation'),

-- Question 15
('services-distinction', 'medium', 'multiple-choice', 'Which of the following factors should be considered when determining the region in which AWS Resources will be deployed? (Choose TWO)', 'The AWS Region''s security level', 'Data sovereignty', 'Cost', 'The planned number of VPCs', '[1,2]', '', 'See AWS Documentation'),

-- Question 16
('services-distinction', 'medium', 'single-choice', 'You are running a financial services web application on AWS. The application uses a MySQL database to store the data. Which of the following AWS services would improve the performance of your application by allowing you to retrieve information from fast in-memory caches?', 'Amazon EFS', 'Amazon Neptune', 'Amazon ElastiCache', 'DAX', '[2]', '', 'See AWS Documentation'),

-- Question 17
('services-distinction', 'medium', 'single-choice', 'What are the advantages of using Auto Scaling Groups for EC2 instances?', 'Auto Scaling Groups caches the most recent responses at global edge locations to reduce latency and improve performance', 'Auto Scaling Groups scales EC2 instances in multiple Availability Zones to increase application availability and fault tolerance', 'Auto Scaling Groups scales EC2 instances across multiple regions to reduce latency for global users', 'Auto Scaling Groups distributes application traffic across multiple Availability Zones to enhance performance', '[1]', '', 'See AWS Documentation'),

-- Question 18
('well-architected', 'medium', 'single-choice', 'The TCO gap between AWS infrastructure and traditional infrastructure has widened over the recent years. Which of the following could be the reason for that?', 'AWS helps customers invest more in capital expenditures', 'AWS automates all infrastructure operations, so customers save more on human resources costs', 'AWS continues to lower the cost of cloud computing for its customers', 'AWS secures AWS resources at no additional charge', '[2]', '', 'See AWS Documentation'),

-- Question 19
('shared-responsibility', 'medium', 'multiple-choice', 'Which of the following are examples of the customer''s responsibility to implement "security IN the cloud"? (Choose TWO)', 'Building a schema for an application', 'Replacing physical hardware', 'Creating a new hypervisor', 'File system encryption', '[0,3]', '', 'See AWS Documentation'),

-- Question 20
('security-services', 'easy', 'single-choice', 'Which of the following is a type of MFA device that customers can use to protect their AWS resources?', 'AWS CloudHSM', 'U2F Security Key', 'AWS Access Keys', 'AWS Key Pair', '[1]', '', 'See AWS Documentation'),

-- Question 21
('services-distinction', 'medium', 'single-choice', 'A company is seeking to deploy an existing .NET application onto AWS as quickly as possible. Which AWS Service should the customer use to achieve this goal?', 'Amazon SNS', 'AWS Elastic Beanstalk', 'AWS Systems Manager', 'AWS Trusted Advisor', '[1]', '', 'See AWS Documentation'),

-- Question 22
('services-distinction', 'medium', 'multiple-choice', 'Which of the following is NOT a factor when estimating the costs of Amazon EC2? (Choose TWO)', 'The amount of time the instances will be running', 'Number of security groups', 'Allocated Elastic IP Addresses', 'Number of Hosted Zones', '[1,3]', '', 'See AWS Documentation'),

-- Question 23
('services-distinction', 'medium', 'single-choice', 'Which AWS Service helps enterprises extend their on-premises storage to AWS in a cost-effective manner?', 'AWS Data Pipeline', 'AWS Storage Gateway', 'Amazon Aurora', 'Amazon EFS', '[1]', '', 'See AWS Documentation'),

-- Question 24
('storage-classes', 'medium', 'single-choice', 'A company is building an online cloud storage platform. They need a storage service that can scale capacity automatically, while minimizing cost. Which AWS storage service should the company use to meet these requirements?', 'Amazon Simple Storage Service', 'Amazon Elastic Block Store', 'Amazon Elastic Container Service', 'AWS Storage Gateway', '[0]', '', 'See AWS Documentation'),

-- Question 25
('security-services', 'medium', 'single-choice', 'You have just hired a skilled sys-admin to join your team. As usual, you have created a new IAM user for him to interact with AWS services. On his first day, you ask him to create snapshots of all existing Amazon EBS volumes and save them in a new Amazon S3 bucket. However, the new member reports back that he is unable to create neither EBS snapshots nor S3 buckets. What might prevent him from doing this simple task?', 'EBS and S3 are accessible only to the root account owner', 'The systems administrator must contact AWS Support first to activate his new IAM account', 'There is not enough space in S3 to store the snapshots', 'There is a non-explicit deny to all new users', '[3]', '', 'See AWS Documentation'),

-- Question 26
('security-services', 'medium', 'single-choice', 'An external auditor is requesting a log of all accesses to the AWS resources in the company''s account. Which of the following services will provide the auditor with the requested information?', 'AWS CloudTrail', 'Amazon CloudFront', 'AWS CloudFormation', 'Amazon CloudWatch', '[0]', '', 'See AWS Documentation'),

-- Question 27
('services-distinction', 'medium', 'single-choice', 'Which of the below options is true of Amazon Cloud Directory?', 'Amazon Cloud Directory allows the organization of hierarchies of data across multiple dimensions', 'Amazon Cloud Directory enables the analysis of video and data streams in real time', 'Amazon Cloud Directory allows users to access AWS with their existing Active Directory credentials', 'Amazon Cloud Directory allows for registration and management of domain names', '[0]', '', 'See AWS Documentation'),

-- Question 28
('services-distinction', 'medium', 'single-choice', 'A user has opened a "Production System Down" support case to get help from AWS Support after a production system disruption. What is the expected response time for this type of support case?', '12 hours', '15 minutes', '24 hours', 'One hour', '[3]', '', 'See AWS Documentation'),

-- Question 29
('well-architected', 'medium', 'single-choice', 'Which of the below options is a best practice for making your application on AWS highly available?', 'Deploy the application to at least two Availability Zones', 'Use Elastic Load Balancing (ELB) across multiple AWS Regions', 'Deploy the application code on at least two servers in the same Availability Zone', 'Rewrite the application code to handle all incoming requests', '[0]', '', 'See AWS Documentation'),

-- Question 30
('services-distinction', 'medium', 'multiple-choice', 'Which of the following should be taken into account when performing a TCO analysis regarding the costs of running an application on AWS VS on-premises? (Choose TWO)', 'Labor and IT costs', 'Cooling and power consumption', 'Amazon EBS computing power', 'Software architecture', '[0,1]', '', 'See AWS Documentation'),

-- Question 31
('services-distinction', 'medium', 'single-choice', 'Your company requires a response time of less than 15 minutes from support interactions about their business-critical systems that are hosted on AWS if those systems go down. Which AWS Support Plan should this company use?', 'AWS Basic Support', 'AWS Developer Support', 'AWS Business Support', 'AWS Enterprise Support', '[3]', '', 'See AWS Documentation'),

-- Question 32
('services-distinction', 'medium', 'multiple-choice', 'Which of the following AWS offerings are serverless services? (Choose TWO)', 'Amazon EC2', 'AWS Lambda', 'Amazon DynamoDB', 'Amazon EMR', '[1,2]', '', 'See AWS Documentation'),

-- Question 33
('security-services', 'easy', 'single-choice', 'Which AWS service enables you to quickly purchase and deploy SSL/TLS certificates?', 'Amazon GuardDuty', 'AWS ACM', 'Amazon Detective', 'AWS WAF', '[1]', '', 'See AWS Documentation'),

-- Question 34
('services-distinction', 'medium', 'single-choice', 'Which AWS Service provides integration with Chef to automate the configuration of EC2 instances?', 'AWS Config', 'AWS OpsWorks', 'AutoScaling', 'AWS CloudFormation', '[1]', '', 'See AWS Documentation'),

-- Question 35
('storage-classes', 'easy', 'single-choice', 'A customer is seeking to store objects in their AWS environment and to make those objects downloadable over the internet. Which AWS Service can be used to accomplish this?', 'Amazon EBS', 'Amazon EFS', 'Amazon S3', 'Amazon Instance Store', '[2]', '', 'See AWS Documentation'),

-- Question 36
('services-distinction', 'medium', 'single-choice', 'Which of the following services can be used to monitor the HTTP and HTTPS requests that are forwarded to Amazon CloudFront?', 'AWS WAF', 'Amazon CloudWatch', 'AWS Cloud9', 'AWS CloudTrail', '[1]', '', 'See AWS Documentation'),

-- Question 37
('services-distinction', 'medium', 'single-choice', 'A company is migrating a web application to AWS. The application''s compute capacity is continually utilized throughout the year. Which of the below options offers the company the most cost-effective solution?', 'On-demand Instances', 'Dedicated Hosts', 'Spot Instances', 'Reserved Instances', '[3]', '', 'See AWS Documentation'),

-- Question 38
('security-services', 'medium', 'single-choice', 'A company wants to grant a new employee long-term access to manage Amazon DynamoDB databases. Which of the following is a recommended best-practice when granting these permissions?', 'Create an IAM role and attach a policy with Amazon DynamoDB access permissions', 'Create an IAM role and attach a policy with Administrator access permissions', 'Create an IAM user and attach a policy with Amazon DynamoDB access permissions', 'Create an IAM user and attach a policy with Administrator access permissions', '[2]', '', 'See AWS Documentation'),

-- Question 39
('security-services', 'medium', 'single-choice', 'When granting permissions to applications running on Amazon EC2 instances, which of the following is considered best practice?', 'Generate new IAM access keys every time you delegate permissions', 'Store the required AWS credentials directly within the application code', 'Use temporary security credentials (IAM roles) instead of long-term access keys', 'Do nothing; Applications that run on Amazon EC2 instances do not need permission to interact with other AWS services or resources', '[2]', '', 'See AWS Documentation'),

-- Question 40
('services-distinction', 'medium', 'single-choice', 'Which of the following will help AWS customers save on costs when migrating their workloads to AWS?', 'Use servers instead of managed services', 'Use existing third-party software licenses on AWS', 'Migrate production workloads to AWS edge locations instead of AWS Regions', 'Use AWS Outposts to run all workloads in a cost-optimized environment', '[1]', '', 'See AWS Documentation'),

-- Question 41
('services-distinction', 'medium', 'single-choice', 'An organization has a legacy application designed using monolithic-based architecture. Which AWS Service can be used to decouple the components of the application?', 'Amazon SQS', 'Virtual Private Gateway', 'AWS Artifact', 'Amazon CloudFront', '[0]', '', 'See AWS Documentation'),

-- Question 42
('security-services', 'medium', 'multiple-choice', 'Which of the following can be used to enable the Virtual Multi-Factor Authentication? (Choose TWO)', 'Amazon Connect', 'AWS CLI', 'AWS Identity and Access Management (IAM)', 'Amazon SNS', '[1,2]', '', 'See AWS Documentation'),

-- Question 43
('well-architected', 'medium', 'single-choice', 'According to best practices, which of the below options is best suited for processing a large number of binary files?', 'Vertically scaling EC2 instances', 'Running RDS instances in parallel', 'Vertically scaling RDS instances', 'Running EC2 instances in parallel', '[3]', '', 'See AWS Documentation'),

-- Question 44
('services-distinction', 'medium', 'single-choice', 'A company is planning to use Amazon S3 and Amazon CloudFront to distribute its video courses globally. What tool can the company use to estimate the costs of these services?', 'AWS Cost Explorer', 'AWS Pricing Calculator', 'AWS Budgets', 'AWS Cost & Usage Report', '[1]', '', 'See AWS Documentation'),

-- Question 45
('security-services', 'medium', 'multiple-choice', 'What should you do if you see resources, which you don''t remember creating, in the AWS Management Console? (Choose TWO)', 'Stop all running services and open an investigation', 'Give your root account password to AWS Support so that they can assist in troubleshooting and securing the account', 'Check the AWS CloudTrail logs and delete all IAM users that have access to your resources', 'Open an investigation and delete any potentially compromised IAM users', '[3,2]', '', 'See AWS Documentation'),

-- Question 46
('well-architected', 'medium', 'single-choice', 'A key practice when designing solutions on AWS is to minimize dependencies between components so that the failure of a single component does not impact other components. What is this practice called?', 'Elastic coupling', 'Loosely coupling', 'Scalable coupling', 'Tightly coupling', '[1]', '', 'See AWS Documentation'),

-- Question 47
('storage-classes', 'easy', 'single-choice', 'Which AWS Service offers an NFS file system that can be mounted concurrently from multiple EC2 instances?', 'Amazon Elastic File System', 'Amazon Simple Storage Service', 'Amazon Elastic Block Store', 'AWS Storage Gateway', '[0]', '', 'See AWS Documentation'),

-- Question 48
('well-architected', 'medium', 'single-choice', 'Availability Zones within a Region are connected over low-latency links. Which of the following is a benefit of these links?', 'Create private connection to your data center', 'Achieve global high availability', 'Automate the process of provisioning new compute resources', 'Make synchronous replication of your data possible', '[3]', '', 'See AWS Documentation'),

-- Question 49
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are true regarding the languages that are supported on AWS Lambda? (Choose TWO)', 'Lambda only supports Python and Node.js, but third party plugins are available to convert code in other languages to these formats', 'Lambda natively supports a number of programming languages such as Node.js, Python, and Java', 'Lambda is AWS'' proprietary programming language for microservices', 'Lambda can support any programming language using an API', '[1,3]', '', 'See AWS Documentation'),

-- Question 50
('services-distinction', 'medium', 'multiple-choice', 'What are the capabilities of AWS X-Ray? (Choose TWO)', 'Automatically decouples application components', 'Facilitates tracking of user requests to identify application issues', 'Helps improve application performance', 'Deploys applications to Amazon EC2 instances', '[1,2]', '', 'See AWS Documentation');