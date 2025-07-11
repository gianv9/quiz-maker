import { Question, Stats } from '../services/api';

export const mockQuestions: Question[] = [
  {
    id: 1,
    question: 'Which AWS service is used for object storage?',
    answers: ['Amazon S3', 'Amazon EC2', 'Amazon RDS', 'Amazon DynamoDB'],
    correct_answers: [0],
    question_type: 'single-choice',
    explanation: 'Amazon S3 (Simple Storage Service) is the primary object storage service in AWS.',
    references: ['https://aws.amazon.com/s3/'],
  },
  {
    id: 2,
    question: 'Which of the following are pillars of the AWS Well-Architected Framework?',
    answers: ['Operational Excellence', 'Security', 'Cost Optimization', 'Scalability'],
    correct_answers: [0, 1, 2],
    question_type: 'multiple-choice',
    explanation: 'The five pillars are Operational Excellence, Security, Reliability, Performance Efficiency, and Cost Optimization.',
    references: ['https://aws.amazon.com/architecture/well-architected/'],
  },
];

export const mockStats: Stats[] = [
  {
    topic: 'aws-services',
    difficulty: 'medium',
    avg_score: 85,
    avg_percentage: 0.85,
    attempts: 3,
  },
  {
    topic: 'aws-security',
    difficulty: 'hard',
    avg_score: 75,
    avg_percentage: 0.75,
    attempts: 2,
  },
  {
    topic: 'mixed',
    difficulty: 'easy',
    avg_score: 90,
    avg_percentage: 0.90,
    attempts: 1,
  },
];