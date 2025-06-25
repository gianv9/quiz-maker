-- Insert all 50 practice exam questions
INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('services-distinction', 'easy', 'single-choice', 'AWS allows users to manage their resources using a web based user interface. What is the name of this interface?', 'AWS CLI.', 'AWS API.', 'AWS SDK.', 'AWS Management Console.', '[3]', 'The AWS Management Console is the web-based user interface for managing AWS resources.', 'AWS Management Console Documentation'),

-- Question 2  
('well-architected', 'medium', 'single-choice', 'Which of the following is an example of horizontal scaling in the AWS Cloud?', 'Replacing an existing EC2 instance with a larger, more powerful one.', 'Increasing the compute capacity of a single EC2 instance to address the growing demands of an application.', 'Adding more RAM capacity to an EC2 instance.', 'Adding more EC2 instances of the same size to handle an increase in traffic.', '[3]', 'Horizontal scaling means adding more instances rather than upgrading existing ones (vertical scaling).', 'AWS Auto Scaling Documentation'),

-- Question 3
('security-services', 'medium', 'single-choice', 'You have noticed that several critical Amazon EC2 instances have been terminated. Which of the following AWS services would help you determine who took this action?', 'Amazon Inspector.', 'AWS CloudTrail.', 'AWS Trusted Advisor.', 'EC2 Instance Usage Report.', '[1]', 'AWS CloudTrail logs API calls and user actions, allowing you to track who performed specific actions.', 'AWS CloudTrail Documentation'),


-- Question 4
('well-architected', 'medium', 'multiple-choice', 'Which of the below options are related to the reliability of AWS? (Choose TWO)', 'Applying the principle of least privilege to all AWS resources.', 'Automatically provisioning new resources to meet demand.', 'All AWS services are considered Global Services, and this design helps customers serve their international users.', 'Ability to recover quickly from failures.', '[1,3]', 'Reliability focuses on automatically scaling resources and recovering from failures.', 'AWS Well-Architected Reliability Pillar'),


-- Question 5
('shared-responsibility', 'medium', 'single-choice', 'Which statement is true regarding the AWS Shared Responsibility Model?', 'Responsibilities vary depending on the services used.', 'Security of the IaaS services is the responsibility of AWS.', 'Patching the guest OS is always the responsibility of AWS.', 'Security of the managed services is the responsibility of the customer.', '[0]', 'The AWS Shared Responsibility Model varies based on service types (IaaS, PaaS, SaaS).', 'AWS Shared Responsibility Model Documentation'),

-- Question 6
('services-distinction', 'medium', 'single-choice', 'You have set up consolidated billing for several AWS accounts. One of the accounts has purchased a number of reserved instances for 3 years. Which of the following is true regarding this scenario?', 'The Reserved Instance discounts can only be shared with the master account.', 'All accounts can receive the hourly cost benefit of the Reserved Instances.', 'The purchased instances will have better performance than On-demand instances.', 'There are no cost benefits from using consolidated billing; It is for informational purposes only.', '[1]', 'Reserved Instance discounts are automatically shared across all accounts in consolidated billing.', 'AWS Consolidated Billing Documentation'),

-- Question 7
('well-architected', 'hard', 'single-choice', 'A company has developed an eCommerce web application in AWS. What should they do to ensure that the application has the highest level of availability?', 'Deploy the application across multiple Availability Zones and Edge locations.', 'Deploy the application across multiple Availability Zones and subnets.', 'Deploy the application across multiple Regions and Availability Zones.', 'Deploy the application across multiple VPC''s and subnets.', '[2]', 'Multi-region deployment provides the highest availability by protecting against regional failures.', 'AWS High Availability Best Practices'),

-- Question 8
('services-distinction', 'medium', 'multiple-choice', 'What does AWS Snowball provide? (Choose TWO)', 'Built-in computing capabilities that allow customers to process data locally.', 'Secure transfer of large amounts of data into and out of the AWS.', 'A hybrid cloud storage between on-premises environments and the AWS Cloud.', 'An Exabyte-scale data transfer service that allows you to move extremely large amounts of data to AWS.', '[0,1]', 'AWS Snowball provides local computing capabilities and secure large-scale data transfer.', 'AWS Snowball Documentation'),

-- Question 9
('services-distinction', 'easy', 'single-choice', 'A company has an AWS Enterprise Support plan. They want quick and efficient guidance with their billing and account inquiries. Which of the following should the company use?', 'AWS Health Dashboard.', 'AWS Support Concierge.', 'AWS Customer Service.', 'AWS Operations Support.', '[1]', 'AWS Support Concierge provides billing and account support for Enterprise customers.', 'AWS Enterprise Support Documentation'),

-- Question 10
('well-architected', 'medium', 'single-choice', 'A Japanese company hosts their applications on Amazon EC2 instances in the Tokyo Region. The company has opened new branches in the United States, and the US users are complaining of high latency. What can the company do to reduce latency for the users in the US while minimizing costs?', 'Applying the Amazon Connect latency-based routing policy.', 'Registering a new US domain name to serve the users in the US.', 'Building a new data center in the US and implementing a hybrid model.', 'Deploying new Amazon EC2 instances in a Region located in the US.', '[3]', 'Deploying resources closer to users reduces latency and is more cost-effective than building data centers.', 'AWS Global Infrastructure Documentation'),

-- Question 11
('security-services', 'easy', 'single-choice', 'An organization has a large number of technical employees who operate their AWS Cloud infrastructure. What does AWS provide to help organize them into teams and then assign the appropriate permissions for each team?', 'IAM roles.', 'IAM users.', 'IAM user groups.', 'AWS Organizations.', '[2]', 'IAM user groups allow you to organize users and assign permissions to groups rather than individual users.', 'AWS IAM User Groups Documentation'),

-- Question 12
('services-distinction', 'medium', 'single-choice', 'A company has decided to migrate its Oracle database to AWS. Which AWS service can help achieve this without negatively impacting the functionality of the source database?', 'AWS OpsWorks.', 'AWS Database Migration Service.', 'AWS Server Migration Service.', 'AWS Application Discovery Service.', '[1]', 'AWS Database Migration Service enables database migration with minimal downtime and no data loss.', 'AWS DMS Documentation'),

-- Question 13
('well-architected', 'medium', 'single-choice', 'Adjusting compute capacity dynamically to reduce cost is an implementation of which AWS cloud best practice?', 'Build security in every layer.', 'Parallelize tasks.', 'Implement elasticity.', 'Adopt monolithic architecture.', '[2]', 'Elasticity allows systems to automatically scale resources up or down based on demand.', 'AWS Elasticity Best Practices'),

-- Question 14
('shared-responsibility', 'medium', 'multiple-choice', 'What are the benefits of having infrastructure hosted in AWS? (Choose TWO)', 'Increasing speed and agility.', 'Gaining complete control over the physical infrastructure.', 'Operating applications on behalf of customers.', 'All of the physical security and most of the data/network security are taken care of for you.', '[0,3]', 'AWS provides increased agility and handles physical security plus much of the infrastructure security.', 'AWS Benefits Documentation'),

-- Question 15
('well-architected', 'medium', 'single-choice', 'What is the advantage of the AWS-recommended practice of "decoupling" applications?', 'Allows treating an application as a single, cohesive unit.', 'Reduces inter-dependencies so that failures do not impact other components of the application.', 'Allows updates of any monolithic application quickly and easily.', 'Allows tracking of any API call made to any AWS service.', '[1]', 'Decoupling reduces dependencies between components, improving fault tolerance and maintainability.', 'AWS Architecture Best Practices'),

-- Question 16
('services-distinction', 'easy', 'single-choice', 'Which of the following helps a customer view the Amazon EC2 billing activity for the past month?', 'AWS Budgets.', 'AWS Pricing Calculator.', 'AWS Systems Manager.', 'AWS Cost & Usage Reports.', '[3]', 'AWS Cost & Usage Reports provide detailed billing information including historical usage data.', 'AWS Cost & Usage Reports Documentation'),

-- Question 17
('services-distinction', 'medium', 'single-choice', 'What do you gain from setting up consolidated billing for five different AWS accounts under another master account?', 'AWS services'' costs will be reduced to half the original price.', 'The consolidated billing feature is just for organizational purpose.', 'Each AWS account gets volume discounts.', 'Each AWS account gets five times the free-tier services capacity.', '[2]', 'Consolidated billing combines usage across accounts to achieve volume discounts and pricing tiers.', 'AWS Consolidated Billing Documentation'),

-- Question 18
('storage-classes', 'medium', 'multiple-choice', 'What should you do in order to keep the data on EBS volumes safe? (Choose TWO)', 'Regularly update firmware on EBS devices.', 'Create EBS snapshots.', 'Ensure that EBS data is encrypted at rest.', 'Store a backup daily in an external drive.', '[1,2]', 'EBS snapshots and encryption at rest are key data protection mechanisms for EBS volumes.', 'EBS Data Protection Documentation'),

-- Question 19
('well-architected', 'medium', 'single-choice', 'One of the most important AWS best-practices to follow is the cloud architecture principle of elasticity. How does this principle improve your architecture''s design?', 'By automatically scaling your on-premises resources based on changes in demand.', 'By automatically scaling your AWS resources using an Elastic Load Balancer.', 'By reducing interdependencies between application components wherever possible.', 'By automatically provisioning the required AWS resources based on changes in demand.', '[3]', 'Elasticity means automatically scaling resources up or down based on demand changes.', 'AWS Elasticity Documentation'),

-- Question 20
('services-distinction', 'medium', 'multiple-choice', 'A startup company is operating on limited funds and is extremely concerned about cost overruns. Which of the below options can be used to notify the company when their monthly AWS bill exceeds $2000? (Choose TWO)', 'Setup a CloudWatch billing alarm that triggers an SNS notification when the threshold is exceeded.', 'Configure the Amazon Simple Email Service to send billing alerts to their email address on a daily basis.', 'Configure the AWS Budgets Service to alert the company when the threshold is exceeded.', 'Configure AWS CloudTrail to automatically delete all AWS resources when the threshold is exceeded.', '[0,2]', 'CloudWatch billing alarms and AWS Budgets can both send notifications when spending thresholds are exceeded.', 'AWS Cost Management Documentation'),

-- Question 21
('services-distinction', 'easy', 'single-choice', 'What does Amazon CloudFront use to distribute content to global users with low latency?', 'AWS Global Accelerator.', 'AWS Regions.', 'AWS Edge Locations.', 'AWS Availability Zones.', '[2]', 'CloudFront uses edge locations to cache content closer to users, reducing latency.', 'Amazon CloudFront Documentation'),

-- Question 22
('security-services', 'easy', 'single-choice', 'What does the "Principle of Least Privilege" refer to?', 'You should grant your users only the permissions they need when they need them and nothing more.', 'All IAM users should have at least the necessary permissions to access the core AWS services.', 'All trusted IAM users should have access to any AWS service in the respective AWS account.', 'IAM users should not be granted any permissions; to keep your account safe.', '[0]', 'Principle of Least Privilege means granting only the minimum permissions necessary for users to perform their job functions.', 'IAM Best Practices Documentation'),

-- Question 23
('services-distinction', 'easy', 'single-choice', 'Which of the following does NOT belong to the AWS Cloud Computing models?', 'Platform as a Service (PaaS).', 'Infrastructure as a Service (IaaS).', 'Software as a Service (SaaS).', 'Networking as a Service (NaaS).', '[3]', 'The standard cloud computing models are IaaS, PaaS, and SaaS. NaaS is not a standard AWS cloud computing model.', 'AWS Cloud Computing Models Documentation'),

-- Question 24
('storage-classes', 'medium', 'single-choice', 'The identification process of an online financial services company requires that new users must complete an online interview with their security team. The completed recorded interviews are only required in the event of a legal issue or a regulatory compliance breach. What is the most cost-effective service to store the recorded videos?', 'S3 Intelligent-Tiering.', 'AWS Marketplace.', 'Amazon S3 Glacier Deep Archive.', 'Amazon EBS.', '[2]', 'S3 Glacier Deep Archive provides the lowest cost storage for rarely accessed data with long-term retention requirements.', 'S3 Storage Classes Documentation'),

-- Question 25
('services-distinction', 'easy', 'single-choice', 'Which service provides DNS in the AWS cloud?', 'Route 53.', 'AWS Config.', 'Amazon CloudFront.', 'Amazon EMR.', '[0]', 'Amazon Route 53 is AWS''s scalable DNS and domain name registration service.', 'Route 53 Documentation'),

-- Question 26
('security-services', 'medium', 'multiple-choice', 'Hundreds of thousands of DDoS attacks are recorded every month worldwide. What service does AWS provide to help protect AWS Customers from these attacks? (Choose TWO)', 'AWS Shield.', 'AWS Config.', 'Amazon Cognito.', 'AWS WAF.', '[0,3]', 'AWS Shield provides DDoS protection and AWS WAF helps filter malicious web traffic.', 'AWS DDoS Protection Documentation'),

-- Question 27
('services-distinction', 'medium', 'single-choice', 'A company is deploying a new two-tier web application in AWS. Where should the most frequently accessed data be stored so that the application''s response time is optimal?', 'AWS OpsWorks.', 'AWS Storage Gateway.', 'Amazon EBS volume.', 'Amazon ElastiCache.', '[3]', 'ElastiCache provides in-memory caching for frequently accessed data, offering the fastest response times.', 'Amazon ElastiCache Documentation'),

-- Question 28
('services-distinction', 'easy', 'single-choice', 'You want to run a questionnaire application for only one day (without interruption), which Amazon EC2 purchase option should you use?', 'Reserved instances.', 'Spot instances.', 'Dedicated instances.', 'On-demand instances.', '[3]', 'On-demand instances provide guaranteed capacity without interruption and are ideal for short-term workloads.', 'EC2 Pricing Documentation'),

-- Question 29
('services-distinction', 'medium', 'single-choice', 'You are working on a project that involves creating thumbnails of millions of images. Consistent uptime is not an issue, and continuous processing is not required. Which EC2 buying option would be the most cost-effective?', 'Reserved Instances.', 'On-demand Instances.', 'Dedicated Instances.', 'Spot Instances.', '[3]', 'Spot instances offer significant cost savings for fault-tolerant workloads that can handle interruptions.', 'EC2 Spot Instances Documentation'),

-- Question 30
('services-distinction', 'easy', 'single-choice', 'Which of the following can be described as a global content delivery network (CDN) service?', 'AWS VPN.', 'AWS Direct Connect.', 'AWS Regions.', 'Amazon CloudFront.', '[3]', 'Amazon CloudFront is AWS''s global content delivery network service.', 'CloudFront Documentation'),

-- Question 31
('services-distinction', 'medium', 'single-choice', 'Which of the following services allows customers to manage their agreements with AWS?', 'AWS Artifact.', 'AWS Certificate Manager.', 'AWS Systems Manager.', 'AWS Organizations.', '[0]', 'AWS Artifact provides access to AWS compliance reports and agreements.', 'AWS Artifact Documentation'),

-- Question 32
('shared-responsibility', 'medium', 'multiple-choice', 'Which of the following are examples of AWS-Managed Services, where AWS is responsible for the operational and maintenance burdens of running the service? (Choose TWO)', 'Amazon VPC.', 'Amazon DynamoDB.', 'Amazon Elastic MapReduce.', 'AWS IAM.', '[1,2]', 'DynamoDB and EMR are managed services where AWS handles infrastructure maintenance. VPC, IAM, and EC2 require more customer management.', 'AWS Managed Services Documentation'),

-- Question 33
('services-distinction', 'easy', 'single-choice', 'Your company has a data store application that requires access to a NoSQL database. Which AWS database offering would meet this requirement?', 'Amazon Aurora.', 'Amazon DynamoDB.', 'Amazon Elastic Block Store.', 'Amazon Redshift.', '[1]', 'DynamoDB is AWS''s fully managed NoSQL database service.', 'DynamoDB Documentation'),

-- Question 34
('services-distinction', 'easy', 'single-choice', 'As part of the Enterprise support plan, who is the primary point of contact for ongoing support needs?', 'AWS Identity and Access Management (IAM) user.', 'Infrastructure Event Management (IEM) engineer.', 'AWS Consulting Partners.', 'Technical Account Manager (TAM).', '[3]', 'Technical Account Manager (TAM) is the primary contact for Enterprise support customers.', 'AWS Enterprise Support Documentation'),

-- Question 35
('services-distinction', 'easy', 'single-choice', 'How can you view the distribution of AWS spending in one of your AWS accounts?', 'By using Amazon VPC console.', 'By contacting the AWS Support team.', 'By using AWS Cost Explorer.', 'By contacting the AWS Finance team.', '[2]', 'AWS Cost Explorer provides visualizations and analysis of AWS spending patterns.', 'Cost Explorer Documentation'),

-- Question 36
('security-services', 'easy', 'single-choice', 'Which of the following must an IAM user provide to interact with AWS services using the AWS Command Line Interface (AWS CLI)?', 'Access keys.', 'Secret token.', 'UserID.', 'User name and password.', '[0]', 'AWS CLI requires access keys (access key ID and secret access key) for authentication.', 'AWS CLI Configuration Documentation'),

-- Question 37
('security-services', 'medium', 'single-choice', 'You have AWS Basic support, and you have discovered that some AWS resources are being used maliciously, and those resources could potentially compromise your data. What should you do?', 'Contact the AWS Customer Service team.', 'Contact the AWS Abuse team.', 'Contact the AWS Concierge team.', 'Contact the AWS Security team.', '[1]', 'AWS Abuse team handles reports of malicious use of AWS resources.', 'AWS Abuse Response Documentation'),

-- Question 38
('shared-responsibility', 'medium', 'multiple-choice', 'Select TWO examples of the AWS shared controls.', 'Patch Management.', 'IAM Management.', 'VPC Management.', 'Configuration Management.', '[0,3]', 'Patch Management and Configuration Management are shared controls where both AWS and customers have responsibilities.', 'AWS Shared Responsibility Model Documentation'),

-- Question 39
('well-architected', 'medium', 'multiple-choice', 'In order to implement best practices when dealing with a "Single Point of Failure," you should attempt to build as much automation as possible in both detecting and reacting to failure. Which of the following AWS services would help? (Choose TWO)', 'ELB.', 'Auto Scaling.', 'Amazon Athen.', 'ECR.', '[0,1]', 'Elastic Load Balancer (ELB) distributes traffic and Auto Scaling automatically replaces failed instances.', 'AWS High Availability Documentation'),

-- Question 40
('services-distinction', 'medium', 'single-choice', 'A company is planning to host an educational website on AWS. Their video courses will be streamed all around the world. Which of the following AWS services will help achieve high transfer speeds?', 'Amazon SNS.', 'Amazon Kinesis Video Streams.', 'AWS CloudFormation.', 'Amazon CloudFront.', '[3]', 'CloudFront CDN caches content at edge locations worldwide to improve transfer speeds.', 'CloudFront Documentation'),

-- Question 41
('services-distinction', 'medium', 'single-choice', 'A developer is planning to build a two-tier web application that has a MySQL database layer. Which of the following AWS database services would provide automated backups for the application?', 'A MySQL database installed on an EC2 instance.', 'Amazon Aurora.', 'Amazon DynamoDB.', 'Amazon Neptune.', '[1]', 'Amazon Aurora is a managed MySQL-compatible database that provides automated backups.', 'Aurora Documentation'),

-- Question 42
('services-distinction', 'medium', 'single-choice', 'What is the AWS service that enables AWS architects to manage infrastructure as code?', 'AWS CloudFormation.', 'AWS Config.', 'Amazon SES.', 'Amazon EMR.', '[0]', 'AWS CloudFormation allows you to define and provision AWS infrastructure using code templates.', 'CloudFormation Documentation'),

-- Question 43
('shared-responsibility', 'medium', 'single-choice', 'Under the shared responsibility model, which of the following is the responsibility of AWS?', 'Client-side encryption.', 'Configuring infrastructure devices.', 'Server-side encryption.', 'Filtering traffic with Security Groups.', '[1]', 'AWS is responsible for configuring and maintaining the underlying infrastructure devices.', 'AWS Shared Responsibility Model Documentation'),

-- Question 44
('services-distinction', 'medium', 'multiple-choice', 'What does the AWS Health Dashboard provide? (Choose TWO)', 'Detailed troubleshooting guidance to address AWS events impacting your resources.', 'Health checks for Auto Scaling instances.', 'Recommendations for Cost Optimization.', 'Personalized view of AWS service health.', '[0,3]', 'AWS Health Dashboard provides troubleshooting guidance and personalized service health information.', 'AWS Health Dashboard Documentation'),

-- Question 45
('services-distinction', 'medium', 'single-choice', 'You have deployed your application on multiple Amazon EC2 instances. Your customers complain that sometimes they can''t reach your application. Which AWS service allows you to monitor the performance of your EC2 instances to assist in troubleshooting these issues?', 'AWS Lambda.', 'AWS Config.', 'Amazon CloudWatch.', 'AWS CloudTrail.', '[2]', 'Amazon CloudWatch monitors AWS resources and applications, providing metrics and alarms for troubleshooting.', 'CloudWatch Documentation'),

-- Question 46
('security-services', 'medium', 'single-choice', 'Your company is developing a critical web application in AWS, and the security of the application is a top priority. Which of the following AWS services will provide infrastructure security optimization recommendations?', 'AWS Shield.', 'AWS Management Console.', 'AWS Secrets Manager.', 'AWS Trusted Advisor.', '[3]', 'AWS Trusted Advisor provides security recommendations and best practices for your AWS infrastructure.', 'Trusted Advisor Documentation'),

-- Question 47
('storage-classes', 'medium', 'multiple-choice', 'Which of the following is not a benefit of Amazon S3? (Choose TWO)', 'Amazon S3 provides unlimited storage for any type of data.', 'Amazon S3 can run any type of application or backend system.', 'Amazon S3 stores any number of objects, but with object size limits.', 'Amazon S3 can be scaled manually to store and retrieve any amount of data from anywhere.', '[1,3]', 'S3 is a storage service, not a compute platform, and it scales automatically, not manually.', 'S3 Documentation'),

-- Question 48
('shared-responsibility', 'medium', 'multiple-choice', 'In the AWS Shared responsibility Model, which of the following are the responsibility of the customer? (Choose TWO)', 'Disk disposal.', 'Controlling physical access to compute resources.', 'Setting password complexity rules.', 'Configuring network access rules.', '[2,3]', 'Customers are responsible for setting password policies and configuring security groups and network ACLs.', 'AWS Shared Responsibility Model Documentation'),

-- Question 49
('services-distinction', 'medium', 'single-choice', 'What does AWS provide to deploy popular technologies such as IBM MQ on AWS with the least amount of effort and time?', 'Amazon Aurora.', 'Amazon CloudWatch.', 'AWS Quick Start reference deployments.', 'AWS OpsWorks.', '[2]', 'AWS Quick Start reference deployments provide automated templates for deploying popular technologies.', 'AWS Quick Start Documentation'),

-- Question 50
('services-distinction', 'hard', 'single-choice', 'An organization has decided to purchase an Amazon EC2 Reserved Instance (RI) for three years in order to reduce costs. It is possible that the application workloads could change during the reservation period. What is the EC2 Reserved Instance (RI) type that will allow the company to exchange the purchased reserved instance for another reserved instance with higher computing power if they need to?', 'Elastic RI.', 'Premium RI.', 'Standard RI.', 'Convertible RI.', '[3]', 'Convertible Reserved Instances allow you to exchange for different instance types, families, or platforms during the term.', 'EC2 Reserved Instances Documentation');