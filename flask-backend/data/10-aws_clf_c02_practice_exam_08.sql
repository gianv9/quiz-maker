-- Practice Exam 8 - SQL INSERT Statements
-- 50 questions converted to SQL format

INSERT INTO questions (topic, difficulty, question_type, question_text, option_a, option_b, option_c, option_d, correct_answers, explanation, study_references) VALUES

-- Question 1
('security-services', 'medium', 'single-choice', 'What is the main benefit of attaching security groups to an Amazon RDS instance?', 'Manages user access and encryption keys.', 'Controls what IP address ranges can connect to your database instance.', 'Deploys SSL/TLS certificates for use with your database instance.', 'Distributes incoming traffic across multiple targets.', '[1]', 'Security groups act as virtual firewalls controlling network access to RDS instances.', 'Amazon RDS Security Documentation'),

-- Question 2
('services-distinction', 'medium', 'single-choice', 'A company wants to use Amazon Elastic Container Service (Amazon ECS) to run its containerized applications. For compliance reasons, the company wants to retain complete visibility and control over the underlying server cluster. Which Amazon ECS launch type will satisfy these requirements?', 'EC2 launch type.', 'Fargate launch type.', 'Lightsail launch type.', 'Lambda launch type.', '[0]', 'EC2 launch type provides full control over the underlying infrastructure.', 'Amazon ECS Launch Types Documentation'),

-- Question 3
('services-distinction', 'easy', 'single-choice', 'You have multiple standalone AWS accounts and you want to decrease your AWS monthly charges. What should you do?', 'Try to remove unnecessary AWS accounts.', 'Add the accounts to an AWS Organization and use Consolidated Billing.', 'Track the AWS charges that are incurred by the member accounts.', 'Enable AWS tiered-pricing before provisioning resources.', '[1]', 'AWS Organizations with consolidated billing enables volume pricing discounts.', 'AWS Organizations Documentation'),

-- Question 4
('security-services', 'medium', 'single-choice', 'You have been tasked with auditing the security of your VPC. As part of this process, you need to start by analyzing what inbound and outbound traffic is allowed on your EC2 instances. What two parts of the VPC do you need to check to accomplish this task?', 'Network ACLs and Traffic Manager.', 'Network ACLs and Subnets.', 'Security Groups and Internet Gateways.', 'Security Groups and Network ACLs.', '[3]', 'Security Groups and Network ACLs control inbound and outbound traffic to EC2 instances.', 'VPC Security Documentation'),

-- Question 5
('services-distinction', 'medium', 'multiple-choice', 'What does the AWS "Business" support plan provide? (Choose TWO)', 'Access to the full set of Trusted Advisor checks.', 'Support Concierge Service.', 'Less than 15 minutes response-time support if your business critical system goes down.', 'AWS Support API.', '[0,3]', 'Business support includes full Trusted Advisor checks and Support API access.', 'AWS Support Plans Documentation'),

-- Question 6
('services-distinction', 'easy', 'single-choice', 'You have just finished writing your application code. Which service can be used to automate the deployment and scaling of your application?', 'Amazon Simple Storage Service.', 'AWS Elastic Beanstalk.', 'AWS CodeCommit.', 'Amazon Elastic File System.', '[1]', 'AWS Elastic Beanstalk automates application deployment and scaling.', 'AWS Elastic Beanstalk Documentation'),

-- Question 7
('shared-responsibility', 'medium', 'single-choice', 'Which statement is true in relation to security in AWS?', 'AWS manages everything related to EC2 operating systems.', 'AWS customers are responsible for patching any database software running on Amazon EC2.', 'Server side encryption is the responsibility of AWS.', 'AWS is responsible for the security of your application.', '[1]', 'Customers are responsible for patching database software on EC2 instances.', 'AWS Shared Responsibility Model Documentation'),

-- Question 8
('services-distinction', 'medium', 'multiple-choice', 'Amazon EC2 instances are conceptually very similar to traditional servers. However, using Amazon EC2 server instances in the same manner as traditional hardware server instances is only a starting point. What are the main benefits of using the AWS EC2 instances instead of traditional servers? (Choose TWO)', 'Improves Fault-Tolerance.', 'Provides your business with a seamless remote accessibility.', 'Prevents unauthorized users from getting into your network.', 'Provides automatic data backups.', '[0]', 'EC2 instances can improve fault-tolerance through multi-AZ deployments.', 'Amazon EC2 Benefits Documentation'),

-- Question 9
('well-architected', 'medium', 'multiple-choice', 'Which statement is true regarding AWS pricing? (Choose TWO)', 'With the AWS pay-as-you-go pricing model, you don''t have to pay any upfront fee.', 'You have no responsibility for third-party software license costs.', 'You only pay for the individual services that you need with no long-term contracts.', 'For some services, you have to pay a startup fee in order to get the service running.', '[0,2]', 'AWS offers pay-as-you-go pricing with no upfront fees and no long-term contracts.', 'AWS Pricing Model Documentation'),

-- Question 10
('services-distinction', 'easy', 'single-choice', 'Which AWS service provides the EASIEST way to set up and manage a secure, well-architected, multi-account AWS environment?', 'AWS Control Tower.', 'Amazon Macie.', 'AWS Systems Manager Patch Manager.', 'AWS Security Hub.', '[0]', 'AWS Control Tower simplifies multi-account environment setup and governance.', 'AWS Control Tower Documentation'),

-- Question 11
('services-distinction', 'medium', 'single-choice', 'A company is running a large web application that needs to always be available. The application tends to slow down when CPU usage is greater than 60%. How can they track when CPU usage goes above 60% for any of the EC2 Instances in their account?', 'Use CloudFront to monitor the CPU usage.', 'Set the AWS Config CPU threshold to 60% to receive a notification when EC2 usage exceeds that value.', 'Use CloudWatch Alarms to monitor the CPU and alert when the CPU usage is >= 60%.', 'Use SNS to monitor the utilization of the server.', '[2]', 'CloudWatch Alarms can monitor metrics and trigger notifications when thresholds are exceeded.', 'Amazon CloudWatch Alarms Documentation'),

-- Question 12
('storage-classes', 'medium', 'single-choice', 'What is the recommended storage option when hosting an often-changing database on an Amazon EC2 instance?', 'Amazon EBS.', 'Amazon RDS.', 'You can''t run a database inside an Amazon EC2 instance.', 'Amazon DynamoDB.', '[0]', 'Amazon EBS provides persistent, high-performance block storage for EC2 databases.', 'Amazon EBS Documentation'),

-- Question 13
('services-distinction', 'easy', 'single-choice', 'You are working as a site reliability engineer (SRE) in an AWS environment, which of the following services helps monitor your applications?', 'Amazon CloudWatch.', 'Amazon CloudSearch.', 'Amazon Elastic MapReduce.', 'Amazon CloudHSM.', '[0]', 'Amazon CloudWatch provides monitoring and observability for AWS resources and applications.', 'Amazon CloudWatch Documentation'),

-- Question 14
('services-distinction', 'medium', 'multiple-choice', 'What factors determine how you are charged when using AWS Lambda? (Choose TWO)', 'Storage consumed.', 'Number of requests to your functions.', 'Number of volumes.', 'Placement groups.', '[1]', 'AWS Lambda pricing is based on number of requests and compute time consumed.', 'AWS Lambda Pricing Documentation'),

-- Question 15
('security-services', 'medium', 'multiple-choice', 'What are the main differences between an IAM user and an IAM role in AWS? (Choose TWO)', 'An IAM user is uniquely associated with only one person, however a role is intended to be assumable by anyone who needs it.', 'An IAM user has permanent credentials associated with it, however a role has temporary credentials associated with it.', 'IAM users are more cost effective than IAM roles.', 'A role is uniquely associated with only one person, however an IAM user is intended to be assumable by anyone who needs it.', '[0,1]', 'IAM users have permanent credentials and are person-specific, while roles provide temporary credentials and are assumable.', 'AWS IAM Users and Roles Documentation'),

-- Question 16
('storage-classes', 'medium', 'multiple-choice', 'Which of the following actions may reduce Amazon EBS costs? (Choose TWO)', 'Deleting unused buckets.', 'Using reservations.', 'Deleting unnecessary snapshots.', 'Changing the type of the volume.', '[2,3]', 'Deleting unnecessary snapshots and optimizing volume types can reduce EBS costs.', 'Amazon EBS Cost Optimization Documentation'),

-- Question 17
('security-services', 'medium', 'single-choice', 'What does Amazon GuardDuty do to protect AWS accounts and workloads?', 'Notifies AWS customers about abuse events once they are reported.', 'Continuously monitors AWS infrastructure and helps detect threats such as attacker reconnaissance or account compromise.', 'Helps AWS customers identify the root cause of potential security issues.', 'Checks security groups for rules that allow unrestricted access to AWS. resources.', '[1]', 'Amazon GuardDuty provides intelligent threat detection and continuous security monitoring.', 'Amazon GuardDuty Documentation'),

-- Question 18
('services-distinction', 'medium', 'single-choice', 'Which database service should you use if your application and data schema require "joins" or complex transactions?', 'Amazon RDS.', 'AWS Outposts.', 'Amazon DocumentDB.', 'Amazon DynamoDB.', '[0]', 'Amazon RDS supports relational databases with SQL joins and ACID transactions.', 'Amazon RDS Documentation'),

-- Question 19
('services-distinction', 'easy', 'single-choice', 'Which of the following makes it easier for you to categorize, manage and filter your resources?', 'Amazon CloudWatch.', 'AWS Service Catalog.', 'AWS Directory Service.', 'AWS Tagging.', '[3]', 'AWS resource tagging enables categorization, management, and filtering of resources.', 'AWS Resource Tagging Documentation'),

-- Question 20
('storage-classes', 'medium', 'single-choice', 'What should you consider when storing data in Amazon Glacier?', 'Amazon Glacier only accepts data in a compressed format.', 'Glacier can only be used to store frequently accessed data and data archives.', 'Amazon Glacier does not provide immediate retrieval of data.', 'Attach Glacier to an EC2 Instance to be able to store data.', '[2]', 'Amazon Glacier is designed for archival storage with retrieval times of minutes to hours.', 'Amazon S3 Glacier Documentation'),

-- Question 21
('services-distinction', 'medium', 'single-choice', 'Engineers are wasting a lot of time and effort managing batch computing software in traditional data centers. Which of the following AWS services allows them to easily run thousands of batch computing jobs?', 'Amazon EC2.', 'AWS Batch.', 'Lambda@Edge.', 'AWS Fargate.', '[1]', 'AWS Batch enables efficient running and management of batch computing workloads.', 'AWS Batch Documentation'),

-- Question 22
('well-architected', 'medium', 'single-choice', 'How can you increase your application''s fault-tolerance while it is being hosted in AWS?', 'Deploy your application across multiple EC2 instances.', 'Deploy your application across multiple Availability Zones.', 'Host your application on one powerful EC2 instance type instead of multiple smaller instances.', 'Deploy the underlying application resources across multiple subnets.', '[1]', 'Multi-AZ deployment provides fault tolerance against single AZ failures.', 'AWS Well-Architected Framework Documentation'),

-- Question 23
('services-distinction', 'easy', 'multiple-choice', 'Which of the following AWS Support Plans gives you 24/7 access to Cloud Support Engineers via email & phone? (Choose TWO)', 'Developer.', 'Premium.', 'Enterprise.', 'Standard.', '[2]', 'Enterprise support plan provides 24/7 access to Cloud Support Engineers.', 'AWS Support Plans Documentation'),

-- Question 24
('security-services', 'medium', 'multiple-choice', 'Which of the following requires an access key ID and a secret access key to get long-lived programmatic access to AWS resources? (Choose TWO)', 'IAM group.', 'IAM user.', 'IAM role.', 'AWS account root user.', '[1,3]', 'IAM users and root users use access keys for programmatic access to AWS.', 'AWS Access Keys Documentation'),

-- Question 25
('well-architected', 'medium', 'single-choice', 'Which of the following is a benefit of the "Loose Coupling" architecture principle?', 'It eliminates the need for change management.', 'It allows for Cross-Region Replication.', 'It helps AWS customers reduce Privileged Access to AWS resources.', 'It allows individual application components or services to be modified without affecting other components.', '[3]', 'Loose coupling enables independent modification of components without affecting others.', 'AWS Well-Architected Framework Documentation'),

-- Question 26
('storage-classes', 'medium', 'single-choice', 'A company needs to host a big data application on AWS using EC2 instances. Which of the following AWS Storage services would they choose to automatically get high throughput to multiple compute nodes?', 'Amazon Elastic Block Store.', 'AWS Storage Gateway.', 'Amazon Elastic File System.', 'S3.', '[2]', 'Amazon EFS provides shared file storage with high throughput to multiple EC2 instances.', 'Amazon EFS Documentation'),

-- Question 27
('well-architected', 'easy', 'single-choice', 'Which of the following Cloud Computing deployment models eliminates the need to run and maintain physical data centers?', 'On-premises.', 'IaaS.', 'PaaS.', 'Cloud.', '[3]', 'Cloud deployment model eliminates the need for physical data center management.', 'AWS Cloud Deployment Models Documentation'),

-- Question 28
('services-distinction', 'medium', 'multiple-choice', 'What are the benefits of the AWS Marketplace service? (Choose TWO)', 'Protects customers by performing periodic security checks on listed products.', 'Per-second billing.', 'Provides cheaper options for purchasing Amazon EC2 on-demand instances.', 'Provides flexible pricing options that suit most customer needs.', '[3]', 'AWS Marketplace offers flexible pricing options for third-party software solutions.', 'AWS Marketplace Documentation'),

-- Question 29
('storage-classes', 'easy', 'single-choice', 'What is the benefit of Amazon EBS volumes being automatically replicated within the same availability zone?', 'Elasticity.', 'Durability.', 'Traceability.', 'Accessibility.', '[1]', 'EBS replication within AZ provides data durability and protection against hardware failures.', 'Amazon EBS Documentation'),

-- Question 30
('services-distinction', 'medium', 'single-choice', 'You are planning to launch an advertising campaign over the coming weekend to promote a new digital product. It is expected that there will be heavy spikes in load during the campaign period, and you can''t afford any downtime. You need additional compute resources to handle the additional load. What is the most cost-effective EC2 instance purchasing option for this job?', 'Savings Plans.', 'Spot Instances.', 'Reserved Instances.', 'On-Demand Instances.', '[3]', 'On-Demand instances provide guaranteed capacity without downtime risk for time-sensitive campaigns.', 'Amazon EC2 Pricing Documentation'),

-- Question 31
('security-services', 'medium', 'single-choice', 'Which of the following AWS services integrates with AWS Shield and AWS Web Application Firewall (AWS WAF) to protect against network and application layer DDoS attacks?', 'Amazon EFS.', 'AWS Secrets Manager.', 'AWS Systems Manager.', 'Amazon CloudFront.', '[3]', 'Amazon CloudFront integrates with Shield and WAF to provide DDoS protection.', 'Amazon CloudFront Security Documentation'),

-- Question 32
('security-services', 'easy', 'single-choice', 'Which of the following services is used when encrypting EBS volumes?', 'AWS WAF.', 'AWS KMS.', 'Amazon Macie.', 'Amazon GuardDuty.', '[1]', 'AWS KMS provides encryption key management for EBS volume encryption.', 'AWS KMS Documentation'),

-- Question 33
('security-services', 'hard', 'multiple-choice', 'The AWS account administrator of your company has been fired. With the permissions granted to him as an administrator, he was able to create multiple IAM user accounts and access keys. Additionally, you are not sure whether he has access to the AWS root account or not. What should you do immediately to protect your AWS infrastructure? (Choose TWO)', 'Download all the attached policies in a safe place.', 'Delete all IAM accounts and recreate them.', 'Use the CloudWatch service to check all API calls that have been made in your account since the administrator was fired.', 'Rotate all access keys.', '[3]', 'Rotating access keys and securing the root account are critical immediate security actions.', 'AWS Security Incident Response Documentation'),

-- Question 34
('services-distinction', 'medium', 'multiple-choice', 'What is the Amazon ElastiCache service used for? (Choose TWO)', 'Provide an in-memory data storage service.', 'Reduce delivery costs using Edge Locations.', 'Improve web application performance.', 'Provide a Chef-compatible cache to speed up application response.', '[0,2]', 'ElastiCache provides in-memory caching to improve application performance.', 'Amazon ElastiCache Documentation'),

-- Question 35
('well-architected', 'medium', 'multiple-choice', 'The elasticity of the AWS Cloud enables customers to save costs when compared to traditional hosting providers. What can AWS customers do to benefit from the elasticity of the AWS Cloud? (Choose TWO)', 'Deploy your resources across multiple Availability Zones.', 'Use Amazon EC2 Auto Scaling.', 'Deploy your resources in another region.', 'Use Elastic Load Balancing.', '[1]', 'EC2 Auto Scaling enables automatic capacity adjustment based on demand.', 'AWS Auto Scaling Documentation'),

-- Question 36
('services-distinction', 'medium', 'multiple-choice', 'What are some of the benefits of using On-Demand EC2 instances? (Choose TWO)', 'They provide free capacity when testing your new applications.', 'They are cheaper than all other EC2 options.', 'They remove the need to buy "safety net" capacity to handle periodic traffic spikes.', 'They only require 1-2 days for setup and configuration.', '[2]', 'On-Demand instances eliminate the need for safety net capacity planning.', 'Amazon EC2 On-Demand Documentation'),

-- Question 37
('services-distinction', 'medium', 'single-choice', 'Each AWS Region is composed of multiple Availability Zones. Which of the following best describes what an Availability Zone is?', 'It is a data center designed to be completely isolated from other data centers in the same region.', 'It is a collection of data centers distributed in multiple countries.', 'It is a logically isolated network of the AWS Cloud.', 'It is a distinct location within a region that is insulated from « failures in other Availability Zones.', '[3]', 'Availability Zones are distinct locations within regions designed for fault isolation.', 'AWS Global Infrastructure Documentation'),

-- Question 38
('well-architected', 'easy', 'single-choice', 'AWS provides disaster recovery capability by allowing customers to deploy infrastructure into multiple [...].', 'Regions.', 'Transportation devices.', 'Support plans.', 'Edge locations.', '[0]', 'Multi-region deployment enables disaster recovery across geographic locations.', 'AWS Disaster Recovery Documentation'),

-- Question 39
('shared-responsibility', 'hard', 'multiple-choice', 'A financial services company decides to migrate one of its applications to AWS. The application deals with sensitive data, such as credit card information, and must run on a PCI-compliant environment. Which of the following is the company''s responsibility when building a PCI-compliant environment in AWS? (Choose TWO)', 'Start the migration process immediately as all AWS services are PCI compliant.', 'Ensure that AWS services are configured properly to meet all PCI DSS standards.', 'Restrict any access to cardholder data and create a policy that addresses information security for all personnel.', 'Configure the underlying infrastructure of AWS services to meet all PCI DSS requirements.', '[1,2]', 'Customers must properly configure AWS services and implement data access policies for PCI compliance.', 'AWS PCI DSS Documentation'),

-- Question 40
('storage-classes', 'easy', 'single-choice', 'What is the maximum amount of data that can be stored in S3 in a single AWS account?', '100 PetaBytes.', 'Virtually unlimited storage.', '5TeraBytes.', '10 Exabytes.', '[1]', 'Amazon S3 provides virtually unlimited storage capacity.', 'Amazon S3 Documentation'),

-- Question 41
('well-architected', 'medium', 'single-choice', 'Which pillar of the AWS Well-Architected Framework provides recommendations to help customers select the right compute resources based on workload requirements?', 'Operational Excellence.', 'Security.', 'Performance Efficiency.', 'Reliability.', '[2]', 'Performance Efficiency pillar focuses on selecting appropriate compute resources for workloads.', 'AWS Well-Architected Framework Documentation'),

-- Question 42
('services-distinction', 'easy', 'single-choice', 'Which AWS service delivers data, videos, applications, and APIs to users globally with low latency and high transfer speeds?', 'Amazon Route 53.', 'Amazon Connect.', 'Amazon CloudFront.', 'Amazon EC2.', '[2]', 'Amazon CloudFront is a global content delivery network for low-latency content distribution.', 'Amazon CloudFront Documentation'),

-- Question 43
('security-services', 'medium', 'single-choice', 'Which of the following steps should be taken by a customer when conducting penetration testing on AWS?', 'Conduct penetration testing using Amazon Inspector, and then notify AWS support.', 'Request and wait for approval from the customer''s internal security team, and then conduct testing.', 'Notify AWS support, and then conduct testing immediately.', 'Request and wait for approval from AWS support, and then conduct testing.', '[3]', 'AWS requires approval before conducting penetration testing on AWS infrastructure.', 'AWS Penetration Testing Documentation'),

-- Question 44
('services-distinction', 'medium', 'single-choice', 'Which AWS Cost Management tool allows you to view the most granular data about your AWS bill?', 'AWS Cost Explorer.', 'AWS Budgets.', 'AWS Cost and Usage report.', 'AWS Billing dashboard.', '[2]', 'AWS Cost and Usage Report provides the most detailed billing data available.', 'AWS Cost and Usage Report Documentation'),

-- Question 45
('services-distinction', 'easy', 'single-choice', 'Which element of the AWS global infrastructure consists of one or more discrete data centers each with redundant power networking and connectivity which are housed in separate facilities?', 'AWS Regions.', 'Availability Zones.', 'Edge locations.', 'Amazon CloudFront.', '[1]', 'Availability Zones consist of discrete data centers with redundant infrastructure.', 'AWS Global Infrastructure Documentation'),

-- Question 46
('well-architected', 'easy', 'single-choice', 'How many Availability Zones should compute resources be provisioned across to achieve high availability?', 'A minimum of one.', 'A minimum of two.', 'A minimum of three.', 'A minimum of four or more.', '[1]', 'Minimum two AZs required for high availability and fault tolerance.', 'AWS High Availability Documentation'),

-- Question 47
('well-architected', 'easy', 'single-choice', 'The AWS Cloud''s multiple Regions are an example of:', 'Agility.', 'Global infrastructure.', 'Elasticity.', 'Pay-as-you-go pricing.', '[1]', 'Multiple AWS Regions demonstrate global infrastructure capabilities.', 'AWS Global Infrastructure Documentation'),

-- Question 48
('services-distinction', 'easy', 'single-choice', 'Which AWS service can be used to manually launch instances based on resource requirements?', 'Amazon EBS.', 'Amazon S3.', 'Amazon EC2.', 'Amazon ECS.', '[2]', 'Amazon EC2 allows manual launching of virtual instances based on requirements.', 'Amazon EC2 Documentation'),

-- Question 49
('well-architected', 'medium', 'single-choice', 'Which is a recommended pattern for designing a highly available architecture on AWS?', 'Ensure that components have low-latency network connectivity.', 'Run enough Amazon EC2 instances to operate at peak load.', 'Ensure that the application is designed to accommodate failure of any single component.', 'Use a monolithic application that handles all operations.', '[2]', 'Designing for component failure tolerance is key to high availability.', 'AWS Well-Architected Framework Documentation'),

-- Question 50
('well-architected', 'medium', 'multiple-choice', 'Which AWS characteristics make AWS cost effective for a workload with dynamic user demand? (Select TWO)', 'High availability.', 'Shared security model.', 'Elasticity.', 'Pay-as-you-go pricing.', '[2,3]', 'Elasticity and pay-as-you-go pricing enable cost-effective scaling with demand.', 'AWS Cost Optimization Documentation');