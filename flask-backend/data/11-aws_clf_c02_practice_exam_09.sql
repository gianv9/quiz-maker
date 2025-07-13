-- Practice Exam 9 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('services-distinction', 'easy', 'single-choice', 'An administrator needs to rapidly deploy a popular IT solution and start using it immediately. Where can the administrator find assistance?', 'AWS Well-Architected Framework documentation.', 'Amazon CloudFront.', 'AWS CodeCommit.', 'AWS Quick Start reference deployments.', '[3]', 'AWS Quick Start provides pre-built templates for rapid deployment of popular solutions.', 'AWS Quick Start Documentation'),

-- Question 2
('services-distinction', 'easy', 'single-choice', 'What is one of the advantages of the Amazon Relational Database Service (Amazon RDS)?', 'It simplifies relational database administration tasks.', 'It provides 99.99999999999% reliability and durability.', 'It automatically scales databases for loads.', 'It enables users to dynamically adjust CPU and RAM resources.', '[0]', 'Amazon RDS automates routine database administration tasks like backups and patching.', 'Amazon RDS Documentation'),

-- Question 3
('services-distinction', 'medium', 'single-choice', 'Which of the following AWS Cloud services can be used to run a customer-managed relational database?', 'Amazon EC2.', 'Amazon Route 53.', 'Amazon ElastiCache.', 'Amazon DynamoDB.', '[0]', 'Amazon EC2 allows customers to install and manage their own database software.', 'Amazon EC2 Documentation'),

-- Question 4
('well-architected', 'medium', 'single-choice', 'A user is planning to launch two additional Amazon EC2 instances to increase availability. Which action should the user take?', 'Launch the instances across multiple Availability Zones in a single AWS Region.', 'Launch the instances as EC2 Reserved Instances in the same AWS Region and the same Availability Zone.', 'Launch the instances in multiple AWS Regions but in the same Availability Zone.', 'Launch the instances as EC2 Spot Instances in the same AWS Region but in different Availability Zones.', '[0]', 'Deploying across multiple AZs in a region provides high availability and fault tolerance.', 'AWS High Availability Documentation'),

-- Question 5
('security-services', 'medium', 'single-choice', 'Which of the following can limit Amazon Simple Storage Service (Amazon S3) bucket access to specific users?', 'A public and private key-pair.', 'Amazon Inspector.', 'AWS Identity and Access Management (IAM) policies.', 'Security Groups.', '[2]', 'IAM policies control access permissions to S3 buckets and objects.', 'Amazon S3 Security Documentation'),

-- Question 6
('services-distinction', 'medium', 'multiple-choice', 'Which AWS service allows companies to connect an Amazon VPC to an on-premises data center? (Select TWO)', 'AWS VPN.', 'Amazon Redshift.', 'API Gateway.', 'Amazon Direct Connect.', '[0,3]', 'AWS VPN and Direct Connect both provide connectivity between VPC and on-premises networks.', 'AWS Hybrid Connectivity Documentation'),

-- Question 7
('services-distinction', 'easy', 'single-choice', 'Which AWS service or feature can be used to monitor CPU usage?', 'AWS CloudTrail.', 'VPC Flow Logs.', 'Amazon CloudWatch.', 'AWS Config.', '[2]', 'Amazon CloudWatch collects and monitors CPU usage metrics from AWS resources.', 'Amazon CloudWatch Documentation'),

-- Question 8
('shared-responsibility', 'medium', 'single-choice', 'Which task is AWS responsible for in the shared responsibility model for security and compliance?', 'Granting access to individuals and services.', 'Encrypting data in transit.', 'Updating Amazon EC2 host firmware.', 'Updating operating systems.', '[2]', 'AWS manages the underlying infrastructure including host firmware updates.', 'AWS Shared Responsibility Model Documentation'),

-- Question 9
('security-services', 'easy', 'single-choice', 'Which of the following security-related actions are available at no cost?', 'Calling AWS Support.', 'Contacting AWS Professional Services to request a workshop.', 'Accessing forums, blogs, and whitepapers.', 'Attending AWS classes at a local university.', '[2]', 'AWS provides free access to security resources like forums, blogs, and whitepapers.', 'AWS Security Resources Documentation'),

-- Question 10
('storage-classes', 'easy', 'single-choice', 'Which storage service can be used as a low-cost option for hosting static websites?', 'Amazon Glacier.', 'Amazon DynamoDB.', 'Amazon Elastic File System (Amazon EFS).', 'Amazon Simple Storage Service (Amazon S3).', '[3]', 'Amazon S3 provides cost-effective static website hosting capabilities.', 'Amazon S3 Static Website Hosting Documentation'),

-- Question 11
('shared-responsibility', 'easy', 'single-choice', 'According to the AWS shared responsibility model what is the sole responsibility of AWS?', 'Application security.', 'Edge location management.', 'Patch management.', 'Client-side data.', '[1]', 'AWS has sole responsibility for managing edge locations and global infrastructure.', 'AWS Shared Responsibility Model Documentation'),

-- Question 12
('well-architected', 'easy', 'multiple-choice', 'Which of the following are pillars of the AWS Well-Architected Framework? (Select TWO)', 'Multiple Availability Zones.', 'Performance efficiency.', 'Security.', 'Encryption usage.', '[1,2]', 'Performance Efficiency and Security are two of the six Well-Architected Framework pillars.', 'AWS Well-Architected Framework Documentation'),

-- Question 13
('security-services', 'medium', 'single-choice', 'Which AWS service identifies security groups that allow unrestricted access to a user''s AWS resources?', 'AWS Trusted Advisor.', 'Amazon Inspector.', 'Amazon CloudWatch.', 'AWS CloudTrail.', '[0]', 'AWS Trusted Advisor checks for security groups with overly permissive rules.', 'AWS Trusted Advisor Documentation'),

-- Question 14
('well-architected', 'medium', 'multiple-choice', 'Which design principles for cloud architecture are recommended when re-architecting a large monolithic application? (Select TWO)', 'Use manual monitoring.', 'Use fixed servers.', 'Implement loose coupling.', 'Rely on individual components.', '[2]', 'Loose coupling enables independent scaling and reduces dependencies between components.', 'AWS Well-Architected Framework Documentation'),

-- Question 15
('well-architected', 'medium', 'single-choice', 'When architecting cloud applications, which of the following are a key design principle?', 'Use the largest instance possible.', 'Provision capacity for peak load.', 'Use the Scrum development process.', 'Implement elasticity.', '[3]', 'Elasticity allows applications to scale resources up and down based on demand.', 'AWS Well-Architected Framework Documentation'),

-- Question 16
('services-distinction', 'medium', 'single-choice', 'A company has deployed several relational databases on Amazon EC2 instances. Every month the database software vendor releases new security patches that need to be applied to the databases. What is the MOST efficient way to apply the security patches?', 'Connect to each database instance on a monthly basis and download and apply the necessary security patches from the vendor.', 'Enable automate patching for the instances using the Amazon RDS console.', 'In AWS Config. configure a rule for the instances and the required patch level.', 'Use AWS Systems Manager to automate database patching according to a schedule.', '[3]', 'AWS Systems Manager automates patch management across EC2 instances efficiently.', 'AWS Systems Manager Documentation'),

-- Question 17
('services-distinction', 'easy', 'single-choice', 'Which mechanism allows developers to access AWS services from application code?', 'AWS Software Development Kit.', 'AWS Management Console.', 'AWS CodePipeline.', 'AWS Config.', '[0]', 'AWS SDKs provide programmatic access to AWS services from application code.', 'AWS SDK Documentation'),

-- Question 18
('well-architected', 'medium', 'single-choice', 'Which AWS feature will reduce the customer''s total cost of ownership (TCO)?', 'Shared responsibility security model.', 'Single tenancy.', 'Elastic computing.', 'Encryption.', '[2]', 'Elastic computing reduces TCO by scaling resources based on actual demand.', 'AWS TCO Documentation'),

-- Question 19
('well-architected', 'medium', 'single-choice', 'Which of the following is a benefit of using the AWS Cloud?', 'Permissive security removes the administrative burden.', 'Ability to focus on revenue-generating activities.', 'Control over cloud network hardware.', 'Choice of specific cloud hardware vendors.', '[1]', 'AWS Cloud enables businesses to focus on core activities rather than infrastructure management.', 'AWS Cloud Benefits Documentation'),

-- Question 20
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are categories of AWS Trusted Advisor? (Select TWO)', 'Fault Tolerance.', 'Instance Usage.', 'Infrastructure.', 'Performance.', '[0,3]', 'Fault Tolerance and Performance are two of the five Trusted Advisor categories.', 'AWS Trusted Advisor Documentation'),

-- Question 21
('services-distinction', 'easy', 'single-choice', 'What is Amazon CloudWatch?', 'A code repository with customizable build and team commit features.', 'A metrics repository with customizable notification thresholds and channels.', 'A security configuration repository with threat analytics.', 'A rule repository of a web application firewall with automated vulnerability prevention features.', '[1]', 'Amazon CloudWatch collects metrics and provides monitoring with configurable alarms.', 'Amazon CloudWatch Documentation'),

-- Question 22
('shared-responsibility', 'medium', 'multiple-choice', 'Under the AWS shared responsibility model, which of the following activities are the customer''s responsibility? (Select TWO)', 'Patching operating system components for Amazon Relational Database Server (Amazon RDS).', 'Encrypting data on the client-side.', 'Training the data center staff.', 'Configuring Network Access Control Lists (ACL).', '[1,3]', 'Customers are responsible for client-side encryption and network ACL configuration.', 'AWS Shared Responsibility Model Documentation'),

-- Question 23
('shared-responsibility', 'medium', 'single-choice', 'Under the shared responsibility model, which of the following is a shared control between a customer and AWS?', 'Physical controls.', 'Patch management.', 'Zone security.', 'Data center auditing.', '[1]', 'Patch management is shared - AWS patches infrastructure, customers patch their applications.', 'AWS Shared Responsibility Model Documentation'),

-- Question 24
('services-distinction', 'easy', 'single-choice', 'Which AWS service is used to pay AWS bills, and monitor usage and budget costs?', 'AWS Billing and Cost Management.', 'Consolidated billing.', 'Amazon CloudWatch.', 'Amazon QuickSight.', '[0]', 'AWS Billing and Cost Management provides comprehensive billing and cost monitoring tools.', 'AWS Billing Documentation'),

-- Question 25
('well-architected', 'medium', 'single-choice', 'How do customers benefit from Amazon''s massive economies of scale?', 'Periodic price reductions as the result of Amazon''s operational efficiencies.', 'New Amazon EC2 instance types providing the latest hardware.', 'The ability to scale up and down when needed.', 'Increased reliability in the underlying hardware of Amazon EC2 instances.', '[0]', 'AWS passes cost savings from economies of scale to customers through price reductions.', 'AWS Economics Documentation'),

-- Question 26
('services-distinction', 'medium', 'single-choice', 'Which AWS feature allows a company to take advantage of usage tiers for services across multiple member accounts?', 'Service control policies (SCPs).', 'Consolidated billing.', 'All Upfront Reserved Instances.', 'AWS Cost Explorer.', '[1]', 'Consolidated billing aggregates usage across accounts to achieve volume pricing tiers.', 'AWS Organizations Documentation'),

-- Question 27
('services-distinction', 'medium', 'multiple-choice', 'Which AWS services provide a way to extend an on-premises architecture to the aws cloud? (Select TWO)', 'Amazon EBS.', 'Amazon Connect.', 'AWS Storage Gateway.', 'Amazon CloudFront.', '[2]', 'AWS Storage Gateway integrates on-premises storage with AWS cloud storage.', 'AWS Hybrid Architecture Documentation'),

-- Question 28
('services-distinction', 'medium', 'single-choice', 'Which of the following services will automatically scale with an expected increase in web traffic?', 'AWS CodePipeline.', 'Elastic Load Balancing.', 'Amazon EBS.', 'AWS Direct Connect.', '[1]', 'Elastic Load Balancing automatically distributes traffic and can scale to handle increased load.', 'Elastic Load Balancing Documentation'),

-- Question 29
('storage-classes', 'easy', 'single-choice', 'Which service provides a virtually unlimited amount of online highly durable object storage?', 'Amazon Redshift.', 'Amazon Elastic File System (Amazon EFS).', 'Amazon Elastic Container Service (Amazon ECS).', 'Amazon S3.', '[3]', 'Amazon S3 provides virtually unlimited, highly durable object storage.', 'Amazon S3 Documentation'),

-- Question 30
('well-architected', 'medium', 'single-choice', 'Which AWS feature should a customer leverage to achieve high availability of an application?', 'AWS Direct Connect.', 'Availability Zones.', 'Data centers.', 'Amazon Virtual Private Cloud (Amazon VPC).', '[1]', 'Availability Zones enable high availability by providing fault-isolated infrastructure.', 'AWS High Availability Documentation'),

-- Question 31
('security-services', 'medium', 'multiple-choice', 'Which AWS service or feature can enhance network security by blocking requests from a particular network for a web application on AWS? (Select TWO)', 'AWS WAF.', 'AWS Trusted Advisor.', 'AWS Direct Connect.', 'AWS Organizations.', '[0]', 'AWS WAF can block requests from specific networks to protect web applications.', 'AWS WAF Documentation'),

-- Question 32
('well-architected', 'easy', 'single-choice', 'Which of the following is a cloud architectural design principle?', 'Scale up not out.', 'Loosely couple components.', 'Build monolithic systems.', 'Use commercial database software.', '[1]', 'Loose coupling is a fundamental cloud architecture principle for scalability and reliability.', 'AWS Well-Architected Framework Documentation'),

-- Question 33
('security-services', 'medium', 'single-choice', 'Which service enables risk auditing by continuously monitoring and logging account activity, including user actions in the AWS Management Console and AWS SDKs?', 'Amazon CloudWatch.', 'AWS CloudTrail.', 'AWS Config.', 'AWS Health.', '[1]', 'AWS CloudTrail provides audit trails of all API calls and user actions across AWS.', 'AWS CloudTrail Documentation'),

-- Question 34
('security-services', 'easy', 'single-choice', 'Where can AWS compliance and certification reports be downloaded?', 'AWS Artifact.', 'AWS Concierge.', 'AWS Certificate Manager.', 'AWS Trusted Advisor.', '[0]', 'AWS Artifact provides access to compliance reports and certifications.', 'AWS Artifact Documentation'),

-- Question 35
('well-architected', 'medium', 'multiple-choice', 'The financial benefits of using AWS are: (Select TWO)', 'Reduced Total Cost of Ownership (TCO).', 'Increased capital expenditure (capex).', 'Reduced operational expenditure ( opex ).', 'Deferred payment plans for startups.', '[0,2]', 'AWS reduces both TCO and operational expenditures through efficient cloud services.', 'AWS Financial Benefits Documentation'),

-- Question 36
('storage-classes', 'easy', 'single-choice', 'Which AWS service can serve a static website?', 'Amazon S3.', 'Amazon Route 53.', 'Amazon QuickSight.', 'AWS X-Ray.', '[0]', 'Amazon S3 can host static websites directly from storage buckets.', 'Amazon S3 Static Website Documentation'),

-- Question 37
('well-architected', 'medium', 'multiple-choice', 'What are the benefits of using the AWS Cloud for companies with customers in many countries around the world (Select TWO)', 'Companies can deploy applications in multiple AWS Regions to reduce latency.', 'Amazon Translate automatically translates third-party website interfaces into multiple languages.', 'Amazon CloudFront has multiple edge locations around the world to reduce latency.', 'Amazon Comprehend allows users to build applications that can respond to user requests in many languages.', '[0,2]', 'Multi-region deployment and CloudFront edge locations both reduce global latency.', 'AWS Global Infrastructure Documentation'),

-- Question 38
('services-distinction', 'easy', 'multiple-choice', 'Which of the following are main components of the AWS global infrastructure? (Select TWO)', 'Resource groups.', 'Availability Zones.', 'Security groups.', 'Regions.', '[1,3]', 'Availability Zones and Regions are the main components of AWS global infrastructure.', 'AWS Global Infrastructure Documentation'),

-- Question 39
('shared-responsibility', 'medium', 'single-choice', 'What is the AWS customer responsible for according to the AWS shared responsibility model?', 'Physical access controls.', 'Data encryption.', 'Secure disposal of storage devices.', 'Environmental risk management.', '[1]', 'Customers are responsible for encrypting their data both at rest and in transit.', 'AWS Shared Responsibility Model Documentation'),

-- Question 40
('services-distinction', 'medium', 'single-choice', 'If each department within a company has its own AWS account, what is one way to enable consolidated billing?', 'Use AWS Budgets on each account to pay only to budget.', 'Contact AWS Support for a monthly bill.', 'Create an AWS Organization from the payer account and invite the other accounts to join.', 'Put all invoices into one Amazon Simple Storage Service (Amazon S3) bucket, load data into Amazon Redshift, and then run a billing report.', '[2]', 'AWS Organizations enables consolidated billing across multiple member accounts.', 'AWS Organizations Documentation'),

-- Question 41
('well-architected', 'medium', 'single-choice', 'What costs are included when comparing AWS Total Cost of Ownership (TCO) with on-premises TCO?', 'Project management.', 'Antivirus software licensing.', 'Data center security.', 'Software development.', '[2]', 'Data center security costs are included in TCO comparisons between AWS and on-premises.', 'AWS TCO Calculator Documentation'),

-- Question 42
('services-distinction', 'medium', 'single-choice', 'What is the benefit of using AWS managed services, such as Amazon ElastiCache and Amazon Relational Database Service (Amazon RDS)?', 'They require the customer to monitor and replace failing instances.', 'They have better performance than customer-managed services.', 'They simplify patching and updating underlying OSs.', 'They do not require the customer to optimize instance type or size selections.', '[2]', 'AWS managed services automatically handle OS patching and updates.', 'AWS Managed Services Documentation'),

-- Question 43
('services-distinction', 'medium', 'multiple-choice', 'Which services can be used across hybrid AWS Cloud architectures? (Select TWO)', 'Amazon Route 53.', 'Virtual Private Gateway.', 'Classic Load Balancer.', 'Auto Scaling.', '[0,1]', 'Route 53 and Virtual Private Gateway both support hybrid cloud connectivity.', 'AWS Hybrid Architecture Documentation'),

-- Question 44
('services-distinction', 'easy', 'single-choice', 'Which statement best describes Elastic Load Balancing?', 'It translates a domain name into an IP address using DNC.', 'It distributes incoming application traffic across one or more Amazon EC2 instances.', 'It collects metrics on connected Amazon EC2 instances.', 'It automatically adjusts the number of Amazon EC2 instances to support incoming traffic.', '[1]', 'Elastic Load Balancing distributes incoming traffic across multiple healthy instances.', 'Elastic Load Balancing Documentation'),

-- Question 45
('services-distinction', 'easy', 'single-choice', 'Which of the following is a fast and reliable NoSQL database service?', 'Amazon Redshift.', 'Amazon RDS.', 'Amazon DynamoDB.', 'Amazon S3.', '[2]', 'Amazon DynamoDB provides fast, scalable NoSQL database capabilities.', 'Amazon DynamoDB Documentation'),

-- Question 46
('security-services', 'easy', 'single-choice', 'Which AWS service would you use to obtain compliance reports and certificates?', 'AWS Artifact.', 'AWS Lambda.', 'Amazon Inspector.', 'AWS Certificate Manager.', '[0]', 'AWS Artifact provides access to AWS compliance reports and certifications.', 'AWS Artifact Documentation'),

-- Question 47
('services-distinction', 'easy', 'multiple-choice', 'Which AWS services are defined as global instead of regional? (Select TWO)', 'Amazon Route 53.', 'Amazon EC2.', 'Amazon S3.', 'Amazon CloudFront.', '[0,3]', 'Route 53 and CloudFront are global services not tied to specific regions.', 'AWS Global Services Documentation'),

-- Question 48
('security-services', 'easy', 'single-choice', 'How would an AWS customer easily apply common access controls to a large set of users?', 'Apply an IAM policy to an IAM group.', 'Apply an IAM policy to an IAM role.', 'Apply the same IAM policy to all IAM users with access to the same workload.', 'Apply an IAM policy to an Amazon Cognito user pool.', '[0]', 'IAM groups allow efficient application of policies to multiple users.', 'AWS IAM Groups Documentation'),

-- Question 49
('well-architected', 'medium', 'single-choice', 'Which of the following is an important architectural design principle when designing cloud applications?', 'Use multiple Availability Zones.', 'Use tightly coupled components.', 'Use open source software.', 'Provision extra capacity.', '[0]', 'Using multiple Availability Zones provides fault tolerance and high availability.', 'AWS Well-Architected Framework Documentation'),

-- Question 50
('services-distinction', 'medium', 'single-choice', 'Which service allows a company with multiple AWS accounts to combine its usage to obtain volume discounts?', 'AWS Server Migration Service.', 'AWS Organizations.', 'AWS Budgets.', 'AWS Trusted Advisor.', '[1]', 'AWS Organizations enables consolidated billing to achieve volume pricing discounts.', 'AWS Organizations Documentation');