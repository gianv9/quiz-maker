-- Practice Exam 7 - SQL INSERT Statements
-- Questions converted to match database schema requirements

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1 (Multiple choice - keeping first 4 options)
('security-services', 'medium', 'multiple-choice', 'Which of the following can help secure your sensitive data in Amazon S3? (Choose TWO)', 'Delete the encryption keys once your data is encrypted.', 'With AWS you do not need to worry about encryption.', 'Enable S3 Encryption.', 'Encrypt the data prior to uploading it.', '[2,3]', 'S3 encryption and client-side encryption both protect data security.', 'Amazon S3 Security Documentation'),

-- Question 2
('services-distinction', 'easy', 'single-choice', 'Which AWS service helps developers compile and test their code?', 'AWS CodeDeploy.', 'AWS CodeCommit.', 'CloudEndure.', 'AWS CodeBuild.', '[3]', 'AWS CodeBuild provides managed build services for compiling and testing code.', 'AWS CodeBuild Documentation'),

-- Question 3 (Multiple choice - keeping first 4 options)
('storage-classes', 'medium', 'multiple-choice', 'Which of the following will affect how much you are charged for storing objects in S3? (Choose TWO)', 'Using default encryption for any number of S3 buckets.', 'The number of EBS volumes attached to your instances.', 'The storage class used for the objects stored.', 'Creating and deleting S3 buckets.', '[2]', 'S3 storage class affects pricing based on access frequency and durability requirements.', 'Amazon S3 Pricing Documentation'),

-- Question 4 (Multiple choice - keeping first 4 options)
('services-distinction', 'medium', 'multiple-choice', 'What does the Amazon CloudFront service provide? (Choose TWO)', 'Tracks user activity and APl usage.', 'Increases application availability by caching at the edge.', 'Enables faster disaster recovery.', 'Stores archived data at very low costs.', '[1]', 'CloudFront increases availability through edge caching and reduces latency.', 'Amazon CloudFront Documentation'),

-- Question 5
('services-distinction', 'easy', 'single-choice', 'You are facing a lot of problems with your current contact center. Which service provides a cloud-based contact center that can deliver a better service for your customers?', 'Amazon Lightsail.', 'Amazon Connect.', 'AWS Direct Connect.', 'AWS Elastic Beanstalk.', '[1]', 'Amazon Connect provides cloud-based contact center services.', 'Amazon Connect Documentation'),

-- Question 6
('services-distinction', 'easy', 'single-choice', 'You have migrated your application to AWS recently. How can you view the AWS costs applied to your account?', 'Using the AWS Cost & Usage Report.', 'Using the AWS Total Cost of Ownership (TCO) dashboard.', 'Using the AWS CloudWatch logs dashboard.', 'Using the Amazon VPC dashboard.', '[0]', 'AWS Cost & Usage Report provides detailed billing and cost information.', 'AWS Cost & Usage Report Documentation'),

-- Question 7 (Multiple choice - keeping first 4 options)
('services-distinction', 'medium', 'multiple-choice', 'Which of the following are valid Amazon EC2 Reserved Instance types? (Choose TWO)', 'Convertible.', 'Expedited.', 'Bulk.', 'Spot.', '[0]', 'Convertible Reserved Instances allow modification of instance attributes.', 'Amazon EC2 Reserved Instances Documentation'),

-- Question 8
('security-services', 'easy', 'single-choice', 'Which of the following services gives you access to all AWS auditor-issued reports and certifications?', 'AWS Artifact.', 'AWS Config.', 'Amazon CloudWatch.', 'AWS CloudTrail.', '[0]', 'AWS Artifact provides access to compliance reports and certifications.', 'AWS Artifact Documentation'),

-- Question 9
('services-distinction', 'medium', 'single-choice', 'You manage a blog on AWS that has different environments: development, testing, and production. What can you use to create a custom console for each environment to view and manage your resources easily?', 'AWS Resource Groups.', 'AWS Placement Groups.', 'AWS Management Console.', 'AWS Tag Editor.', '[0]', 'AWS Resource Groups allow custom organization and management of resources.', 'AWS Resource Groups Documentation'),

-- Question 10
('services-distinction', 'easy', 'single-choice', 'Which AWS service collects metrics from running EC2 instances?', 'Amazon Inspector.', 'Amazon CloudWatch.', 'AWS CloudFormation.', 'AWS CloudTrail.', '[1]', 'Amazon CloudWatch collects and monitors metrics from AWS resources.', 'Amazon CloudWatch Documentation'),

-- Question 11
('services-distinction', 'medium', 'single-choice', 'Your web application currently faces performance issues and suffers from long load times. Which of the following AWS services could help fix these issues and improve performance?', 'Amazon Detective.', 'AWS X-Ray.', 'AWS Security Hub.', 'AWS Shield.', '[1]', 'AWS X-Ray helps analyze and debug application performance issues.', 'AWS X-Ray Documentation'),

-- Question 12 (Multiple choice - keeping first 4 options)
('services-distinction', 'medium', 'multiple-choice', 'Which of the following compute resources are serverless? (Choose TWO)', 'Amazon EC2.', 'AWS Fargate.', 'AWS Lambda.', 'Amazon ECS.', '[1,2]', 'AWS Fargate and Lambda provide serverless compute capabilities.', 'AWS Serverless Computing Documentation'),

-- Question 13
('services-distinction', 'medium', 'single-choice', 'For compliance and regulatory purposes, a government agency requires that their applications must run on hardware that is dedicated to them only. How can you meet this requirement?', 'Use EC2 Dedicated Hosts.', 'Use EC2 Reserved Instances.', 'Use EC2 Spot Instances.', 'Use EC2 On-demand Instances.', '[0]', 'EC2 Dedicated Hosts provide physical servers dedicated to a single customer.', 'Amazon EC2 Dedicated Hosts Documentation'),

-- Question 14
('well-architected', 'medium', 'single-choice', 'Which AWS Cost Governance best practice recommends refining workloads regularly to make the most of existing AWS resources and reduce costs?', 'Tagging Enforcement.', 'Architecture Optimization.', 'Budgeting Processes.', 'Resource Controls.', '[1]', 'Architecture optimization focuses on refining workloads for cost efficiency.', 'AWS Cost Optimization Documentation'),

-- Question 15
('services-distinction', 'medium', 'single-choice', 'An organization needs to build a financial application that requires support for ACID transactions. Which AWS database service is most appropriate in this case?', 'RedShift.', 'RDS.', 'CloudHSM.', 'DMS.', '[1]', 'Amazon RDS provides ACID transaction support for relational databases.', 'Amazon RDS Documentation'),

-- Question 16
('security-services', 'easy', 'single-choice', 'What can you use to assign permissions directly to an IAM user?', 'IAM Identity.', 'IAM Group.', 'IAM Role.', 'IAM Policy.', '[3]', 'IAM Policies define permissions that can be attached to users, groups, or roles.', 'AWS IAM Policies Documentation'),

-- Question 17
('well-architected', 'medium', 'single-choice', 'The owner of an E-Commerce application notices that the compute capacity requirements vary heavily from time to time. What makes AWS more economical than traditional data centers for this type of application?', 'AWS allows customers to launch powerful EC2 instances to handle spikes in load.', 'AWS allows customers to pay upfront to get bigger discounts.', 'AWS allows customers to launch and terminate EC2 instances based on demand.', 'AWS allows customers to choose cheaper types of EC2 instances that best fit their needs.', '[2]', 'Elastic scaling allows paying only for resources when needed.', 'AWS Elasticity Documentation'),

-- Question 18
('services-distinction', 'easy', 'single-choice', 'Amazon RDS supports multiple database engines to choose from. Which of the following is not one of them?', 'PostgreSQL.', 'Oracle.', 'Microsoft SQL Server.', 'Teradata.', '[3]', 'Teradata is not supported as an RDS engine option.', 'Amazon RDS Database Engines Documentation'),

-- Question 19
('services-distinction', 'easy', 'single-choice', 'Which of the following AWS services would help you migrate on-premise databases to AWS?', 'AWS DMS.', 'Amazon S3 Transfer Acceleration.', 'AWS Directory Service.', 'AWS Transit Gateway.', '[0]', 'AWS Database Migration Service facilitates database migration to AWS.', 'AWS DMS Documentation'),

-- Question 20
('services-distinction', 'easy', 'single-choice', 'For new AWS customers, what is the EASIEST way to launch a simple WordPress website on AWS?', 'Run WordPress on an Amazon Lightsail instance.', 'Install WordPress on an Amazon EC2 instance.', 'Use the Amazon S3 Web hosting feature.', 'Host the website directly on AWS Cloud Development Kit (AWS CDK).', '[0]', 'Amazon Lightsail provides simplified WordPress deployment for beginners.', 'Amazon Lightsail Documentation'),

-- Question 21 (Multiple choice - keeping first 4 options)
('security-services', 'medium', 'multiple-choice', 'Which of the following would you use to manage your encryption keys in the AWS Cloud? (Choose TWO)', 'AWS KMS.', 'AWS Certificate Manager.', 'AWS CodeDeploy.', 'AWS CodeCommit.', '[0]', 'AWS KMS provides managed encryption key services.', 'AWS KMS Documentation'),

-- Question 22
('services-distinction', 'medium', 'single-choice', 'Which of the following services allows you to install and run custom relational database software?', 'Amazon EC2.', 'Amazon Cognito.', 'Amazon RDS.', 'Amazon Inspector.', '[0]', 'Amazon EC2 provides full control to install custom database software.', 'Amazon EC2 Documentation'),

-- Question 23
('services-distinction', 'medium', 'single-choice', 'Your application requirements for CPU and RAM are changing in an unpredictable way. Which service can be used to dynamically adjust these resources based on load?', 'Auto Scaling.', 'ELB.', 'Amazon Route53.', 'Amazon Elastic Container Service.', '[0]', 'Auto Scaling automatically adjusts compute resources based on demand.', 'AWS Auto Scaling Documentation'),

-- Question 24
('security-services', 'easy', 'single-choice', 'A company has infrastructure hosted in an on-premises data center. They currently have an operations team that takes care of identity management. If they decide to migrate to the AWS cloud, which of the following services would help them perform the same role in AWS?', 'AWS IAM.', 'AWS Outposts.', 'AWS Federation.', 'Amazon Redshift.', '[0]', 'AWS IAM provides identity and access management in the cloud.', 'AWS IAM Documentation'),

-- Question 25 (Multiple choice - keeping first 4 options)
('well-architected', 'medium', 'multiple-choice', 'What are some key design principles for designing public cloud systems? (Choose TWO)', 'Reserved capacity instead of on demand.', 'Loose coupling over tight coupling.', 'Servers instead of managed services.', 'Disposable resources instead of fixed servers.', '[1,3]', 'Loose coupling and disposable resources are key cloud design principles.', 'AWS Well-Architected Framework Documentation'),

-- Question 26
('security-services', 'medium', 'single-choice', 'Where can AWS account owners get a list of all users in their account, including the status of their AWS credentials?', 'AWS CloudTrail Trails.', 'IAM Credential Report.', 'AWS Artifact reports.', 'AWS Cost and Usage Report.', '[1]', 'IAM Credential Report provides comprehensive user and credential status information.', 'AWS IAM Credential Report Documentation'),

-- Question 27
('security-services', 'medium', 'single-choice', 'Which of the following services enables you to easily generate and use your own encryption keys in the AWS Cloud?', 'AWS Shield.', 'AWS Certificate Manager.', 'AWS CloudHSM.', 'AWS WAF.', '[2]', 'AWS CloudHSM provides dedicated hardware security modules for key management.', 'AWS CloudHSM Documentation'),

-- Question 28
('well-architected', 'hard', 'single-choice', 'You have developed a web application targeting a global audience. Which of the following will help you achieve the highest redundancy and fault tolerance from an infrastructure perspective?', 'There is no need to architect for these capabilities in AWS, as AWS is redundant by default.', 'Deploy the application in a single Availability Zone.', 'Deploy the application in multiple Availability Zones in a single AWS region.', 'Deploy the application in multiple Availability Zones in multiple AWS regions.', '[3]', 'Multi-region deployment provides the highest level of redundancy and fault tolerance.', 'AWS Global Infrastructure Documentation'),

-- Question 29 (Multiple choice - keeping first 4 options)
('shared-responsibility', 'medium', 'multiple-choice', 'For some services, AWS automatically replicates data across multiple Availability Zones to provide fault tolerance in the event of a server failure or Availability Zone outage. Select TWO services that automatically replicate data across Availability Zones.', 'Instance Store.', 'S3.', 'DynamoDB.', 'Amazon Route 53.', '[1,2]', 'S3 and DynamoDB automatically replicate data across Availability Zones.', 'AWS Data Replication Documentation'),

-- Question 30 (Multiple choice - keeping first 4 options)
('services-distinction', 'medium', 'multiple-choice', 'Which of the following factors affect Amazon CloudFront cost? (Choose TWO)', 'Number of Requests.', 'Traffic Distribution.', 'Number of Volumes.', 'Instance type.', '[0,1]', 'CloudFront pricing is based on number of requests and geographic traffic distribution.', 'Amazon CloudFront Pricing Documentation'),

-- Question 31
('security-services', 'easy', 'single-choice', 'Which of the following resources can an AWS customer use to learn more about prohibited uses of the services offered by AWS?', 'AWS Service Control Policies (SCPs).', 'AWS Artifact.', 'AWS Budgets.', 'AWS Acceptable Use Policy.', '[3]', 'AWS Acceptable Use Policy defines prohibited uses of AWS services.', 'AWS Acceptable Use Policy Documentation'),

-- Question 32 (Multiple choice - keeping first 4 options)
('security-services', 'easy', 'multiple-choice', 'Which of the following security resources are available to any user for free? (Choose TWO)', 'AWS Bulletins.', 'AWS TAM.', 'AWS Support APl.', 'AWS Security Blog.', '[0,3]', 'AWS Bulletins and Security Blog are freely accessible security resources.', 'AWS Security Resources Documentation'),

-- Question 33
('storage-classes', 'medium', 'single-choice', 'How can you protect data stored on Amazon S3 from accidental deletion?', 'By enabling S3 Versioning.', 'By configuring S3 Bucket Policies.', 'By configuring S3 Lifecycle Policies.', 'By disabling S3 Cross-Region Replication (CRR).', '[0]', 'S3 Versioning maintains multiple versions of objects to protect against deletion.', 'Amazon S3 Versioning Documentation'),

-- Question 34
('shared-responsibility', 'easy', 'single-choice', 'Which of the following is the responsibility of AWS according to the AWS Shared Responsibility Model?', 'Securing regions and edge locations.', 'Performing auditing tasks.', 'Monitoring AWS resources usage.', 'Securing access to AWS resources.', '[0]', 'AWS is responsible for physical security of regions and edge locations.', 'AWS Shared Responsibility Model Documentation'),

-- Question 35 (Multiple choice - keeping first 4 options)
('services-distinction', 'easy', 'multiple-choice', 'Which of the following AWS support plans provides access to only the seven core AWS Trusted Advisor checks?', 'Business & Enterprise Support.', 'Basic & Developer Support.', 'Developer & Enterprise Support.', 'Developer & Business Support.', '[1]', 'Basic and Developer support plans include only core Trusted Advisor checks.', 'AWS Support Plans Documentation'),

-- Question 36
('services-distinction', 'medium', 'single-choice', 'Which of the following is NOT a benefit of using AWS Lambda?', 'AWS Lambda runs code without provisioning or managing servers.', 'AWS Lambda provides resizable compute capacity in the cloud.', 'There is no charge when your AWS Lambda code is not running.', 'AWS Lambda can be called directly from any mobile app.', '[1]', 'Lambda is serverless and does not provide resizable compute capacity like EC2.', 'AWS Lambda Documentation'),

-- Question 37
('security-services', 'medium', 'single-choice', 'How does AWS help customers achieve compliance in the cloud?', 'It''s not possible to meet regulatory compliance requirements in the Cloud.', 'AWS applies the most common Cloud security standards, and is responsible for complying with customers'' applicable laws and regulations.', 'AWS has many common assurance certifications such as ISO 9001 and HIPAA.', 'Many AWS services are assessed regularly to comply with local laws and regulations.', '[2]', 'AWS maintains various compliance certifications to help customers meet regulatory requirements.', 'AWS Compliance Documentation'),

-- Question 38
('shared-responsibility', 'easy', 'single-choice', 'Who is responsible for scaling a DynamoDB database in the AWS Shared Responsibility Model?', 'Your security team.', 'Your development team.', 'AWS.', 'Your internal DevOps team.', '[2]', 'AWS manages scaling for DynamoDB as a fully managed service.', 'Amazon DynamoDB Documentation'),

-- Question 39
('services-distinction', 'medium', 'single-choice', 'You are working as a web app developer. You are currently facing issues in media playback for mobile devices because your media format is not supported. Which of the following AWS services can help you convert your media into another format?', 'Amazon Elastic Transcoder.', 'Amazon Pinpoint.', 'AmazonS3.', 'Amazon Rekognition.', '[0]', 'Amazon Elastic Transcoder converts media files between different formats.', 'Amazon Elastic Transcoder Documentation'),

-- Question 40 (Multiple choice - keeping first 4 options)
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of the AWS Organizations service? (Choose TWO)', 'Control access to AWS services.', 'Help organizations design and maintain an accelerated path to successful cloud adoption.', 'Manage your organization''s payment methods.', 'Help organization achieve their desired business outcomes with AWS.', '[0]', 'AWS Organizations provides centralized access control across multiple AWS accounts.', 'AWS Organizations Documentation'),

-- Question 41
('services-distinction', 'easy', 'single-choice', 'Which AWS service allows you to build a data warehouse in the cloud?', 'AWS Shield.', 'Amazon Redshift.', 'Amazon RDS.', 'Amazon Comprehend.', '[1]', 'Amazon Redshift is AWS managed data warehouse service.', 'Amazon Redshift Documentation'),

-- Question 42
('services-distinction', 'easy', 'single-choice', 'What AWS service allows you to buy third-party software solutions and services that run on AWS resources?', 'AWS Application Discovery service.', 'Amazon DevPay.', 'AWS Marketplace.', 'Resource Groups.', '[2]', 'AWS Marketplace provides third-party software and services for AWS.', 'AWS Marketplace Documentation'),

-- Question 43
('services-distinction', 'easy', 'single-choice', 'Which of the following services is an AWS repository management system that allows for storing, versioning, and managing your application code?', 'AWS CodePipeline.', 'AWS CodeCommit.', 'AWS X-Ray.', 'Amazon Inspector.', '[1]', 'AWS CodeCommit provides Git-based source code repository management.', 'AWS CodeCommit Documentation'),

-- Question 44
('services-distinction', 'medium', 'single-choice', 'Which AWS service can be used to route end users to the nearest AWS Region to reduce latency?', 'Amazon Cognito.', 'AWS Systems Manager.', 'AWS Cloud9.', 'Amazon Route 53.', '[3]', 'Amazon Route 53 provides geolocation routing to direct users to nearest regions.', 'Amazon Route 53 Documentation'),

-- Question 45
('security-services', 'easy', 'single-choice', 'Which feature enables users to sign into their AWS accounts with their existing corporate credentials?', 'Federation.', 'Access keys.', 'IAM Permissions.', 'WAF rules.', '[0]', 'Federation allows users to access AWS using existing corporate identity systems.', 'AWS Identity Federation Documentation'),

-- Question 46 (Multiple choice - keeping first 4 options)
('shared-responsibility', 'medium', 'multiple-choice', 'According to the AWS shared responsibility model, what are the controls that customers fully inherit from AWS? (Choose TWO)', 'Awareness and Training.', 'Communications controls.', 'Data center security controls.', 'Environmental controls.', '[2,3]', 'Customers inherit physical data center and environmental security controls from AWS.', 'AWS Shared Responsibility Model Documentation'),

-- Question 47
('services-distinction', 'easy', 'single-choice', 'What can you access by visiting the URL: <http://status.aws.amazon.com>?', 'AWS Billing Dashboard.', 'AWS Cost Dashboard.', 'AWS Service Health Dashboard.', 'AWS Security Dashboard.', '[2]', 'AWS Service Health Dashboard shows current status of AWS services.', 'AWS Service Health Dashboard Documentation'),

-- Question 48 (Multiple choice - keeping first 4 options)
('well-architected', 'medium', 'multiple-choice', 'Which of the following procedures can reduce latency when your end users are retrieving data? (Choose TWO)', 'Store media assets in the region closest to your end users.', 'Store media assets on an additional EBS volume and increase the capacity of your server.', 'Replicate media assets to at least two availability zones.', 'Reduce the size of media assets using the Amazon Elastic Transcoder.', '[0]', 'Storing assets closer to users reduces geographic latency.', 'AWS Global Infrastructure Documentation'),

-- Question 49 (Multiple choice - keeping first 4 options)
('security-services', 'medium', 'multiple-choice', 'Which of the following are part of the seven design principles for security in the cloud? (Choose TWO)', 'Use manual monitoring techniques to protect your AWS resources.', 'Use IAM roles to grant temporary access instead of long-term credentials.', 'Scale horizontally to protect from failures.', 'Enable real-time traceability.', '[1,3]', 'Using IAM roles and real-time traceability are key cloud security principles.', 'AWS Security Best Practices Documentation'),

-- Question 50
('services-distinction', 'medium', 'single-choice', 'A company is migrating production workloads to AWS, and they are concerned about cost management across different departments. Which option should the company implement to categorize and track AWS spending?', 'Use the AWS Pricing Calculator service to monitor the costs incurred by each department.', 'Use Amazon Aurora to forecast AWS spending based on usage.', 'Apply cost allocation tags to segment AWS costs by different e projects and departments.', 'Configure AWS Price List API to receive billing updates for each department automatically.', '[2]', 'Cost allocation tags enable detailed cost tracking and departmental billing.', 'AWS Cost Allocation Tags Documentation');