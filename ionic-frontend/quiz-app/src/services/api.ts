// src/services/api.ts

export interface Question {
  id: number;
  question: string;
  question_type: 'single-choice' | 'multiple-choice';
  answers: string[];
  correct_answers: number[];
  explanation: string;
  references: string[];
}

export interface ScoreData {
  topic: string;
  difficulty: string;
  score: number;
  correct: number;
  total: number;
  detailed_results?: DetailedResult[];
}

export interface DetailedResult {
  question_type: 'single-choice' | 'multiple-choice';
  correct_answers: number[];
  user_answers: number[];
  score: number;
}

export interface Stats {
  topic: string;
  difficulty: string;
  avg_score: number;
  avg_percentage: number;
  attempts: number;
}

class ApiService {
  private baseUrl: string;

  constructor() {
    // For development, the Flask backend runs on localhost:5000
    // For production, you might want to use environment variables
    this.baseUrl = 'http://localhost:5000';
  }

  async getTopics(): Promise<string[]> {
    try {
      const response = await fetch(`${this.baseUrl}/api/topics`);
      if (!response.ok) {
        throw new Error('Failed to fetch topics');
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching topics:', error);
      // Return some default topics if the API fails
      return ['aws-shared-responsibility', 'aws-services', 'aws-storage', 'aws-security', 'aws-well-architected'];
    }
  }

  async getQuestions(topic: string, difficulty: string, count: string = '10'): Promise<Question[]> {
    try {
      const response = await fetch(`${this.baseUrl}/api/questions/${topic}/${difficulty}?count=${count}`);
      if (!response.ok) {
        throw new Error(`Failed to fetch questions: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching questions:', error);
      throw error;
    }
  }

  async submitScore(scoreData: ScoreData): Promise<{ status: string }> {
    try {
      const response = await fetch(`${this.baseUrl}/api/submit-score`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(scoreData),
      });

      if (!response.ok) {
        throw new Error(`Failed to submit score: ${response.statusText}`);
      }

      return await response.json();
    } catch (error) {
      console.error('Error submitting score:', error);
      throw error;
    }
  }

  async getStats(): Promise<Stats[]> {
    try {
      // Note: We'll need to add this endpoint to the Flask backend
      const response = await fetch(`${this.baseUrl}/api/stats`);
      if (!response.ok) {
        throw new Error('Failed to fetch stats');
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching stats:', error);
      return [];
    }
  }

  calculateQuestionScore(
    questionType: 'single-choice' | 'multiple-choice',
    correctAnswers: number[],
    userAnswers: number[],
    difficulty: string
  ): number {
    const basePoints = { easy: 10, medium: 20, hard: 30 }[difficulty] || 10;

    if (questionType === 'single-choice') {
      return userAnswers.length > 0 && correctAnswers.includes(userAnswers[0]) ? basePoints : 0;
    } else {
      if (userAnswers.length === 0) return 0;

      const correctSet = new Set(correctAnswers);
      const userSet = new Set(userAnswers);

      const correctSelections = [...correctSet].filter(x => userSet.has(x)).length;
      const wrongSelections = [...userSet].filter(x => !correctSet.has(x)).length;
      const totalCorrect = correctSet.size;

      const scoreRatio = Math.max(0, (correctSelections - wrongSelections) / totalCorrect);
      return Math.floor(basePoints * scoreRatio);
    }
  }
}

export const apiService = new ApiService();