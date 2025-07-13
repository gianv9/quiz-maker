-- Practice Exam 6 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('services-distinction', 'medium', 'single-choice', 'Which of the following is true regarding the AWS availability zones and edge locations?', 'Edge locations are located in separate Availability Zones worldwide to serve global customers.', 'An availability zone exists within an edge location to distribute content globally with low latency.', 'An Availability Zone is a geographic location where AWS provides multiple, physically separated and isolated edge locations.', 'An AWS Availability Zone is an isolated location within an AWS Region, however edge locations are located in multiple cities worldwide.', '[3]', 'AWS Availability Zones are isolated locations within regions, while edge locations are globally distributed for content delivery.', 'AWS Global Infrastructure Documentation'),

-- Question 2
('services-distinction', 'medium', 'multiple-choice', 'Which features are included in the AWS Business Support Plan? (Choose TWO)', '24x7 access to customer service.', 'Access to Cloud Support Engineers via email only during business hours.', 'Access to the Infrastructure Event Management (IEM) feature for additional fee.', '24x7 access to the TAM feature.', '[0,2]', 'Business Support includes 24x7 customer service and IEM access for additional fee.', 'AWS Support Plans Documentation'),

-- Question 3
('security-services', 'easy', 'single-choice', 'A company is developing a mobile application and wants to allow users to use their Amazon, Apple, Facebook, or Google identities to authenticate to the application. Which AWS Service should the company use for this purpose?', 'Amazon GuardDuty.', 'Amazon Personalize.', 'Amazon Cognito.', 'AWS IAM.', '[2]', 'Amazon Cognito provides identity federation for mobile and web applications.', 'Amazon Cognito Documentation'),

-- Question 4
('services-distinction', 'medium', 'single-choice', 'Which AWS Service allows customers to create a template that programmatically defines policies and configurations of all AWS resources as code and so that the same template can be reused among multiple projects?', 'AWS CloudFormation.', 'AWS Config.', 'AWS CloudTrail.', 'AWS Auto Scaling.', '[0]', 'AWS CloudFormation provides infrastructure as code templates for resource management.', 'AWS CloudFormation Documentation'),

-- Question 5
('well-architected', 'medium', 'single-choice', 'Which of the following are advantages of using AWS as a cloud computing provider? (Choose TWO)', 'Eliminates the need to monitor servers and applications.', 'Manages all the compliance and auditing tasks.', 'Provides custom hardware to meet any specification.', 'Eliminates the need to guess on infrastructure capacity needs.', '[3]', 'AWS eliminates capacity guessing and enables trading capital for operational expenses.', 'AWS Cloud Benefits Documentation'),

-- Question 6
('services-distinction', 'medium', 'multiple-choice', 'A customer is planning to migrate their Microsoft SQL Server databases to AWS. Which AWS Services can the customer use to run their Microsoft SQL Server database on AWS? (Choose TWO)', 'AWS Fargate.', 'Amazon Elastic Compute Cloud.', 'Amazon RDS.', 'AWS Database Migration service (DMS).', '[1,2]', 'Microsoft SQL Server can run on Amazon EC2 and Amazon RDS.', 'Amazon RDS and EC2 Documentation'),

-- Question 7
('services-distinction', 'medium', 'single-choice', 'Which AWS Service can perform health checks on Amazon EC2 instances?', 'AWS CloudFormation.', 'Amazon Route 53.', 'Amazon Chime.', 'Amazon Aurora.', '[1]', 'Amazon Route 53 provides health checks and DNS failover capabilities.', 'Amazon Route 53 Documentation'),

-- Question 8
('services-distinction', 'easy', 'single-choice', 'A company is developing an application that will leverage facial recognition to automate photo tagging. Which AWS Service should the company use for facial recognition?', 'Amazon Comprehend.', 'AWS IAM.', 'Amazon Polly.', 'Amazon Rekognition.', '[3]', 'Amazon Rekognition provides image and video analysis including facial recognition.', 'Amazon Rekognition Documentation'),

-- Question 9
-- Fix: The questions said (Choose TWO), but Cloud Search is not a database
('services-distinction', 'medium', 'single-choice', 'Which of the following are examples of AWS-managed databases?', 'Amazon Neptune.', 'Amazon CloudSearch.', 'Microsoft SQL Server on Amazon EC2.', 'MySQL on Amazon EC2.', '[0]', 'Amazon Neptune is an AWS-managed graph database service.', 'AWS Database Services Documentation'),

-- Question 10
('services-distinction', 'medium', 'single-choice', 'A company''s AWS workflow requires that it periodically perform large-scale image and video processing jobs. The customer is seeking to minimize cost and has stated that the amount of time it takes to process these jobs is not critical, but that cost minimization is the most important factor in designing the solution. Which EC2 instance class is best suited for this processing?', 'EC2 On-Demand Instances.', 'EC2 Reserved Instances - No Upfront.', 'EC2 Spot Instances.', 'EC2 Reserved Instances - All Upfront.', '[2]', 'EC2 Spot Instances offer the lowest cost for fault-tolerant workloads.', 'Amazon EC2 Pricing Documentation'),

-- Question 11
('shared-responsibility', 'easy', 'single-choice', 'There is a requirement to grant a DevOps team full administrative access to all resources in an AWS account. Who can grant them these permissions?', 'AWS account owner.', 'AWS technical account manager.', 'AWS security team.', 'AWS cloud support engineers.', '[0]', 'The AWS account owner has ultimate authority to grant administrative permissions.', 'AWS Account Management Documentation'),

-- Question 12
('services-distinction', 'medium', 'single-choice', 'You need to migrate a large number of on-premises workloads to AWS. Which AWS service is the most appropriate?', 'AWS File Transfer Acceleration.', 'AWS Server Migration Service.', 'AWS Database Migration Service.', 'AWS Application Discovery Service.', '[1]', 'AWS Server Migration Service helps migrate on-premises workloads to AWS.', 'AWS Migration Services Documentation'),

-- Question 13
('services-distinction', 'medium', 'multiple-choice', 'What are some key benefits of using AWS CloudFormation? (Choose TWO)', 'It helps AWS customers deploy their applications without worrying about the underlying infrastructure.', 'It applies advanced IAM security features automatically.', 'It automates the provisioning and updating of your infrastructure in a safe and controlled manner.', 'It allows you to model your entire infrastructure in just a text file.', '[2,3]', 'CloudFormation automates infrastructure provisioning and models infrastructure as code.', 'AWS CloudFormation Documentation'),

-- Question 14
('well-architected', 'easy', 'single-choice', 'Which of the following is a cloud computing deployment model that connects infrastructure and applications between cloud-based resources and existing resources not located in the cloud?', 'On-premises.', 'Mixed.', 'Hybrid.', 'Cloud.', '[2]', 'Hybrid deployment model connects cloud and on-premises resources.', 'AWS Cloud Deployment Models Documentation'),

-- Question 15
('services-distinction', 'hard', 'single-choice', 'A company is hosting business critical workloads in an AWS Region. To protect against data loss and ensure business continuity, a mirror image of the current AWS environment should be created in another AWS Region. Company policy requires that the standby environment must be available in minutes in case of an outage in the primary AWS Region. Which AWS service can be used to meet these requirements?', 'CloudEndure Disaster Recovery.', 'CloudEndure Migration.', 'AWS Backup.', 'AWS Glue.', '[0]', 'CloudEndure Disaster Recovery provides continuous replication and rapid recovery.', 'AWS Disaster Recovery Documentation'),

-- Question 16
('storage-classes', 'medium', 'single-choice', 'Which of the following S3 storage classes is most appropriate to host static assets for a popular e-commerce website with stable access patterns?', 'S3 Standard-IA.', 'S3 Intelligent-Tiering.', 'S3 Glacier Deep Archive.', 'S3 Standard.', '[3]', 'S3 Standard provides high performance for frequently accessed data.', 'Amazon S3 Storage Classes Documentation'),

-- Question 17
('storage-classes', 'medium', 'single-choice', 'You want to create a backup of your data in another geographical location. Where should you create this backup?', 'In another Edge location.', 'In another Region.', 'In another VPC.', 'In another Availability Zone.', '[1]', 'Cross-region backups provide geographic redundancy for disaster recovery.', 'AWS Backup Best Practices Documentation'),

-- Question 18
('shared-responsibility', 'medium', 'single-choice', 'Which statement is true in relation to the security of Amazon EC2?', 'You should use instance store volumes to store login data.', 'You should regularly patch the operating system and applications on your EC2 instances.', 'You should deploy critical components of your application in the Availability Zone that you trust.', 'You can track all API calls using Amazon Athena.', '[1]', 'Customers are responsible for OS and application patching on EC2 instances.', 'AWS Shared Responsibility Model Documentation'),

-- Question 19
('services-distinction', 'medium', 'single-choice', 'What does AWS Cost Explorer provide to help manage your AWS spend?', 'Cost comparisons between AWS Cloud environments and on-premises environments.', 'Accurate estimates of AWS service costs based on your expected usage.', 'Consolidated billing.', 'Highly accurate cost forecasts for up to 12 months ahead.', '[3]', 'AWS Cost Explorer provides detailed cost analysis and forecasting capabilities.', 'AWS Cost Explorer Documentation'),

-- Question 20
('services-distinction', 'medium', 'single-choice', 'Which of the following is a feature of Amazon RDS that performs automatic failover when the primary database fails to respond?', 'RDS Single-AZ.', 'RDS Write Replica.', 'RDS Snapshots.', 'RDS Multi-AZ.', '[3]', 'RDS Multi-AZ provides automatic failover for high availability.', 'Amazon RDS Multi-AZ Documentation'),

-- Question 21
('services-distinction', 'easy', 'single-choice', 'You are using several on-demand EC2 Instances to run your development environment. What is the best way to reduce your charges when these instances are not in use?', 'Deleting all EBS volumes attached to the instances.', 'You cannot minimize charges for on-demand instances.', 'Terminating the instances.', 'Stopping the instances.', '[3]', 'Stopping instances halts compute charges while preserving the instance and EBS storage.', 'Amazon EC2 Instance Lifecycle Documentation'),

-- Question 22
('security-services', 'medium', 'single-choice', 'Which of the following strategies helps protect your AWS root account?', 'Delete root user access keys if you do not need them.', 'Apply MFA for the root account and use it for all of your work.', 'Access the root account only from your personal Mobile Phone.', 'Only share your AWS account password or access keys with trusted persons.', '[0]', 'Root access keys should be deleted when not needed to reduce security risk.', 'AWS Root Account Security Best Practices'),

-- Question 23
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are factors should be considered for Amazon EBS pricing? (Choose TWO)', 'The size of volumes provisioned per month.', 'The compute capacity you consume.', 'The amount of data you have stored in snapshots.', 'The compute time you consume.', '[0,2]', 'EBS pricing is based on provisioned volume size and snapshot storage.', 'Amazon EBS Pricing Documentation'),

-- Question 24
('security-services', 'easy', 'single-choice', 'You have just set up your AWS environment and have created six IAM user accounts for the DevOps team. What is the AWS recommendation when granting permissions to these IAM accounts?', 'Attach a separate IAM policy for each individual account.', 'Apply the Principle of Least Privilege.', 'For security purposes, you should not grant any permission to the DevOps team.', 'Create six different IAM passwords.', '[1]', 'The Principle of Least Privilege grants only necessary permissions.', 'AWS IAM Best Practices Documentation'),

-- Question 25
('services-distinction', 'medium', 'single-choice', 'Which of the following has the greatest impact on cost? (Choose TWO)', 'Compute charges.', 'The number of services used.', 'Data Transfer In charges.', 'Data Transfer Out charges.', '[0]', 'Compute charges typically have the greatest cost impact.', 'AWS Pricing Documentation'),

-- Question 26
('services-distinction', 'medium', 'single-choice', 'Who from the following will get the largest discount?', 'A user who chooses to buy On-demand, Convertible, Partial upfront instances.', 'A user who chooses to buy Reserved, Convertible, All upfront instances.', 'A user who chooses to buy Reserved, Standard, No upfront instances.', 'A user who chooses to buy Reserved, Standard, All upfront instances.', '[3]', 'Reserved Standard instances with all upfront payment provide the highest discount.', 'Amazon EC2 Reserved Instance Pricing'),

-- Question 27
('services-distinction', 'medium', 'single-choice', 'Which of the following is an available option when purchasing Amazon EC2 instances?', 'The ability to bid to get the lowest possible prices.', 'The ability to register EC2 instances to get volume discounts on every hour the instances are running.', 'The ability to buy Dedicated Instances for up to 90% discount.', 'The ability to pay upfront to get lower hourly costs.', '[3]', 'Reserved Instances allow upfront payment for reduced hourly costs.', 'Amazon EC2 Pricing Options Documentation'),

-- Question 28
('well-architected', 'easy', 'single-choice', 'What does the term "Economies of scale" mean?', 'It means that you save more when you consume more.', 'It means as more time passes using AWS, you pay more for its services.', 'It means that AWS will continuously lower costs as it grows.', 'It means that you have the ability to pay as you go.', '[2]', 'Economies of scale allow AWS to reduce costs as their scale increases.', 'AWS Cloud Economics Documentation'),

-- Question 29
('services-distinction', 'medium', 'single-choice', 'A company experiences fluctuations in traffic patterns to their e-commerce website when running flash sales. What service can help the company dynamically match the required compute capacity to handle spikes in traffic during flash sales?', 'AWS Auto Scaling.', 'Amazon Elastic Compute Cloud.', 'Amazon Elastic File System.', 'Amazon ElastiCache.', '[0]', 'AWS Auto Scaling automatically adjusts capacity based on demand.', 'AWS Auto Scaling Documentation'),

-- Question 30
('shared-responsibility', 'medium', 'single-choice', 'Which of the below options is true of Amazon VPC?', 'Amazon VPC allows customers to control user interactions with all other AWS resources.', 'AWS Customers have complete control over their Amazon VPC virtual networking environment.', 'AWS is responsible for all the management and configuration details of Amazon VPC.', 'Amazon VPC helps customers to review their AWS architecture and adopt best practices.', '[1]', 'Customers have complete control over their VPC networking environment configuration.', 'Amazon VPC Documentation'),

-- Question 31
('services-distinction', 'medium', 'single-choice', 'Which tool can a non-AWS customer use to compare the cost of on-premises environment resources to AWS?', 'AWS Cost Explorer.', 'AWS Pricing Calculator.', 'AWS Budgets.', 'AWS TCO Calculator.', '[3]', 'AWS TCO Calculator compares on-premises costs with AWS cloud costs.', 'AWS TCO Calculator Documentation'),

-- Question 32
('security-services', 'medium', 'multiple-choice', 'Which of the following services provide real-time auditing for compliance and vulnerabilities? (Choose TWO)', 'AWS Config.', 'Amazon Redshift.', 'Amazon MQ.', 'AWS Trusted Advisor.', '[0,3]', 'AWS Config and Trusted Advisor provide compliance monitoring and recommendations.', 'AWS Compliance Documentation'),

-- Question 33
('services-distinction', 'medium', 'single-choice', 'Which of the following AWS services uses Puppet to automate how EC2 instances are configured?', 'AWS OpsWorks.', 'AWS CloudFormation.', 'AWS Quick Starts.', 'AWS CloudTrail.', '[0]', 'AWS OpsWorks provides configuration management with Chef and Puppet.', 'AWS OpsWorks Documentation'),

-- Question 34
('services-distinction', 'medium', 'single-choice', 'An organization uses a hybrid cloud architecture to run their business. Which AWS service enables them to deploy their applications to any AWS or on-premises server?', 'Amazon Kinesis.', 'Amazon QuickSight.', 'AWS CodeDeploy.', 'Amazon Athena.', '[2]', 'AWS CodeDeploy automates application deployments to AWS and on-premises servers.', 'AWS CodeDeploy Documentation'),

-- Question 35
('services-distinction', 'medium', 'single-choice', 'Select the services that are server-based: (Choose TWO)', 'Amazon RDS.', 'Amazon DynamoDB.', 'AWS Lambda.', 'AWS Fargate.', '[0]', 'Amazon RDS runs on servers managed by AWS.', 'AWS Service Types Documentation'),

-- Question 36
('security-services', 'easy', 'single-choice', 'What best describes penetration testing?', 'Testing your application''s response time from different locations.', 'Testing your network to find security vulnerabilities that an attacker could exploit.', 'Testing your instances to check for the unhealthy ones.', 'Testing your software for bugs and errors.', '[1]', 'Penetration testing identifies security vulnerabilities in networks and systems.', 'AWS Penetration Testing Documentation'),

-- Question 37
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are use cases for Amazon EMR? (Choose TWO)', 'Enables you to backup extremely large amounts of data at very low costs.', 'Enables you to move Exabyte-scale data from on-premises datacenters into AWS.', 'Enables you to analyze and process extremely large amounts of data in a timely manner.', 'Enables you to easily run and scale Apache Spark, Hadoop,and other Big Data frameworks.', '[2,3]', 'EMR enables big data processing and running distributed computing frameworks.', 'Amazon EMR Documentation'),

-- Question 38
('services-distinction', 'easy', 'single-choice', 'Your CTO has asked you to contact AWS support using the chat feature to ask for guidance related to EBS. However, when you open the AWS support center you can''t see a way to contact support via Chat. What should you do?', 'There is no chat feature in AWS support.', 'The chat feature is available for all plans for an additional fee, but you have to request it first.', 'At a minimum, upgrade to Business support plan.', 'Upgrade from the Basic Support plan to Developer Support.', '[2]', 'Chat support is available starting with the Business support plan.', 'AWS Support Plans Documentation'),

-- Question 39
('services-distinction', 'easy', 'single-choice', 'A developer wants to quickly deploy and manage his application in the AWS Cloud, but he doesn''t have any experience with cloud computing. Which of the following AWS services would help the developer achieve his goal?', 'AWS Fargate.', 'AWS Batch.', 'Amazon Personalize.', 'AWS Elastic Beanstalk.', '[3]', 'AWS Elastic Beanstalk simplifies application deployment for developers.', 'AWS Elastic Beanstalk Documentation'),

-- Question 40
('well-architected', 'easy', 'single-choice', 'Which statement best describes the AWS Pay-As-You-Go pricing model?', 'With AWS, you replace low upfront expenses with large variable payments.', 'With AWS, you replace low upfront expenses with large fixed payments.', 'With AWS, you replace large upfront expenses with low fixed payments.', 'With AWS, you replace large capital expenses with low variable payments.', '[3]', 'Pay-as-you-go replaces large capital expenses with variable operational costs.', 'AWS Pricing Model Documentation'),

-- Question 41
('shared-responsibility', 'medium', 'multiple-choice', 'For Amazon RDS databases, what does AWS perform on your behalf? (Choose TWO)', 'Database setup.', 'Network traffic protection.', 'Management of the operating system.', 'Access management.', '[0,2]', 'AWS manages RDS database setup and underlying operating system.', 'Amazon RDS Shared Responsibility Documentation'),

-- Question 42
('services-distinction', 'medium', 'single-choice', 'Which of the following strategies help analyze costs in AWS?', 'Using tags to group resources.', 'Using AWS CloudFormation to automate the deployment of resources.', 'Deploying resources of the same type in different regions.', 'Configuring Amazon Inspector to automatically analyze costs and email reports.', '[0]', 'Resource tagging enables detailed cost analysis and allocation.', 'AWS Cost Allocation Tags Documentation'),

-- Question 43
('services-distinction', 'medium', 'single-choice', 'A media company has an application that requires the transfer of large data sets to and from AWS every day. This data is business critical and should be transferred over a consistent connection. Which AWS service should the company use?', 'AWS Direct Connect.', 'Amazon Comprehend.', 'AWS Snowmobile.', 'AWS VPN.', '[0]', 'AWS Direct Connect provides dedicated network connection to AWS.', 'AWS Direct Connect Documentation'),

-- Question 44
('services-distinction', 'medium', 'single-choice', 'What is the main benefit of the AWS Storage Gateway service?', 'It automates the process of building, maintaining, and running ETL jobs.', 'It provides physical devices to migrate data from on premises to AWS.', 'It allows integration of on-premises IT environments with Cloud Storage.', 'It provides hardware-based key storage for regulatory compliance.', '[2]', 'AWS Storage Gateway integrates on-premises environments with AWS cloud storage.', 'AWS Storage Gateway Documentation'),

-- Question 45
('storage-classes', 'medium', 'single-choice', 'To protect against data loss, you need to backup your database regularly. What is the most cost-effective storage option that provides immediate retrieval of your backups?', 'Amazon S3 Glacier Deep Archive.', 'Amazon S3 Standard-Infrequent Access.', 'Amazon S3 Glacier.', 'Instance Store.', '[1]', 'S3 Standard-IA provides cost-effective storage with immediate access.', 'Amazon S3 Storage Classes Documentation'),

-- Question 46
('services-distinction', 'medium', 'single-choice', 'Which service can you use to route traffic to the endpoint that provides the best application performance for your users worldwide?', 'AWS Global Accelerator.', 'AWS Data Pipeline.', 'AWS DAX Accelerator.', 'AWS Transfer Acceleration.', '[0]', 'AWS Global Accelerator optimizes global application performance routing.', 'AWS Global Accelerator Documentation'),

-- Question 47
('well-architected', 'medium', 'single-choice', 'Why are Serverless Architectures more economical than Server-based Architectures?', 'Serverless Architectures use new powerful computing devices.', 'With the Server-based Architectures, compute resources continue to run all the time but with serverless architecture, compute resources are only used when code is being executed.', 'When you reserve serverless capacity, you will get large discounts compared to server reservation.', 'With Serverless Architectures you have the ability to scale automatically up or down as demand changes.', '[1]', 'Serverless architectures only consume resources during code execution.', 'AWS Serverless Documentation'),

-- Question 48
('services-distinction', 'medium', 'multiple-choice', 'Which of the below options are use cases of the Amazon Route 53 service? (Choose TWO)', 'Point-to-point connectivity between an on-premises data center and AWS.', 'Detects configuration changes in the AWS environment.', 'DNS configuration and management.', 'Manages global application traffic through a variety of routing types.', '[2,3]', 'Route 53 provides DNS services and global traffic management.', 'Amazon Route 53 Documentation'),

-- Question 49
('services-distinction', 'medium', 'single-choice', 'You want to transfer 200 Terabytes of data from on-premises locations to the AWS Cloud, which of the following can do the job in a cost-effective way?', 'AWS Snowmobile.', 'AWS Import/Export.', 'AWS DMS.', 'AWS Snowball.', '[3]', 'AWS Snowball is cost-effective for transferring large amounts of data.', 'AWS Data Transfer Services Documentation'),

-- Question 50
('services-distinction', 'hard', 'single-choice', 'You have a real-time IoT application that requires sub-millisecond latency. Which of the following services should you use?', 'Amazon Redshift.', 'Amazon Athena.', 'AWS Cloud9.', 'Amazon ElastiCache for Redis.', '[3]', 'ElastiCache for Redis provides sub-millisecond latency for real-time applications.', 'Amazon ElastiCache Documentation');