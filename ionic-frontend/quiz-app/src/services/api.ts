import { appConfig } from '../config/environment';

// src/services/api.ts - Fixed Version with No Hardcoded URLs

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

interface ApiConfig {
  baseUrl: string;
  environment: string;
  platform: string;
  debugMode: boolean;
}


class ApiService {
  private config = {
    baseUrl: appConfig.baseUrl,  // Changed from API_BASE_URL
    debugMode: appConfig.debugMode
  };

  constructor() {
    this.config = this.determineApiConfig();
    
    if (this.config.debugMode) {
      console.log('🔧 API Service Configuration:', this.config);
    }
  }

  private determineApiConfig(): ApiConfig {
    const isNative = !!(window as any).Capacitor?.isNativePlatform?.();
    const isDevelopment = import.meta.env.DEV;
    const debugMode = import.meta.env.VITE_DEBUG_MODE === 'true' || import.meta.env.VITE_DEBUG_NETWORK === 'true';
    
    let baseUrl: string;
    let environment: string;

    // Priority order for API URL determination:
    // 1. Manual override (for testing specific backends)
    // 2. Platform-specific configuration
    // 3. Environment-based defaults

    if (import.meta.env.VITE_API_BASE_URL_OVERRIDE) {
      baseUrl = import.meta.env.VITE_API_BASE_URL_OVERRIDE;
      environment = 'override';
    } else if (isNative) {
      // Mobile app
      if (isDevelopment) {
        // Mobile development: use local network IP from env
        baseUrl = import.meta.env.VITE_API_BASE_URL_LOCAL;
        environment = 'mobile-dev';
        
        if (!baseUrl) {
          throw new Error(
            '❌ VITE_API_BASE_URL_LOCAL not set! ' +
            'Please set your computer\'s IP in .env.local: ' +
            'VITE_API_BASE_URL_LOCAL=http://192.168.1.XXX:5000'
          );
        }
      } else {
        // Mobile production: use production API
        baseUrl = import.meta.env.VITE_API_BASE_URL;
        environment = 'mobile-prod';
        
        if (!baseUrl) {
          throw new Error(
            '❌ VITE_API_BASE_URL not set! ' +
            'Please set production URL in .env.production'
          );
        }
      }
    } else {
      // Web browser
      if (isDevelopment) {
        // Web development: use localhost or local override
        baseUrl = import.meta.env.VITE_API_BASE_URL_LOCAL || 'http://localhost:5000';
        environment = 'web-dev';
      } else {
        // Web production: use production API
        baseUrl = import.meta.env.VITE_API_BASE_URL;
        environment = 'web-prod';
        
        if (!baseUrl) {
          throw new Error(
            '❌ VITE_API_BASE_URL not set! ' +
            'Please set production URL in .env.production'
          );
        }
      }
    }

    // Validate URL format
    if (!baseUrl.startsWith('http://') && !baseUrl.startsWith('https://')) {
      throw new Error(`❌ Invalid API URL format: ${baseUrl}. Must start with http:// or https://`);
    }

    return {
      baseUrl,
      environment,
      platform: isNative ? 'native' : 'web',
      debugMode
    };
  }

  // Network connectivity and health check
  private async healthCheck(): Promise<{ connected: boolean; latency?: number; error?: string }> {
    const startTime = Date.now();
    
    try {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 10000); // 10 second timeout for mobile
      
      const response = await fetch(`${this.config.baseUrl}/api/topics`, {
        method: 'HEAD',
        signal: controller.signal
      });
      
      clearTimeout(timeoutId);
      const latency = Date.now() - startTime;
      
      if (response.ok) {
        return { connected: true, latency };
      } else {
        return { connected: false, error: `HTTP ${response.status}` };
      }
    } catch (error: any) {
      const latency = Date.now() - startTime;
      
      if (error.name === 'AbortError') {
        return { connected: false, error: 'Timeout (10s)' };
      }
      
      return { 
        connected: false, 
        error: error.message || 'Network error',
        latency 
      };
    }
  }

  async getTopics(): Promise<string[]> {
    try {
      const url = `${this.config.baseUrl}/api/topics`;
      
      if (this.config.debugMode) {
        console.log('📡 Making request to:', url);
      }
      
      const response = await fetch(url);
      
      if (this.config.debugMode) {
        console.log('📡 Response status:', response.status);
        console.log('📡 Response headers:', response.headers);
      }
      
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
      }
      
      const topics = await response.json();
      
      if (this.config.debugMode) {
        console.log('✅ Topics received:', topics);
      }
      
      return topics;
    } catch (error) {
      console.error('❌ Error fetching topics:', error);
      console.log('🔄 Using fallback topics');
      
      // Enhanced error handling with specific messages
      this.logNetworkError(error);
      
      // Fallback topics
      return [
        'aws-shared-responsibility',
        'aws-services', 
        'aws-storage',
        'aws-security',
        'aws-well-architected'
      ];
    }
  }

  async getQuestions(topic: string, difficulty: string, count: string = '10'): Promise<Question[]> {
    try {
      const url = `${this.config.baseUrl}/api/questions/${topic}/${difficulty}?count=${count}`;
      
      if (this.config.debugMode) {
        console.log('📡 Fetching questions from:', url);
        console.log('📡 Parameters:', { topic, difficulty, count });
      }
      
      const response = await fetch(url);
      
      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`HTTP ${response.status}: ${response.statusText} - ${errorText}`);
      }
      
      const questions = await response.json();
      
      if (this.config.debugMode) {
        console.log('✅ Questions received:', questions.length);
        console.log('📝 First question preview:', questions[0]?.question?.substring(0, 100) + '...');
      }
      
      if (!Array.isArray(questions) || questions.length === 0) {
        throw new Error('No questions returned from API');
      }
      
      return questions;
    } catch (error) {
      console.error('❌ Error fetching questions:', error);
      this.logNetworkError(error);
      throw error; // Re-throw to let the component handle it
    }
  }

  async submitScore(scoreData: ScoreData): Promise<{ status: string }> {
    try {
      if (this.config.debugMode) {
        console.log('📡 Submitting score:', scoreData);
      }
      
      const response = await fetch(`${this.config.baseUrl}/api/submit-score`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(scoreData),
      });

      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`HTTP ${response.status}: ${response.statusText} - ${errorText}`);
      }

      const result = await response.json();
      
      if (this.config.debugMode) {
        console.log('✅ Score submitted successfully');
      }
      
      return result;
    } catch (error) {
      console.error('❌ Error submitting score:', error);
      this.logNetworkError(error);
      throw error;
    }
  }

  async getStats(): Promise<Stats[]> {
    try {
      if (this.config.debugMode) {
        console.log('📡 Fetching stats from:', `${this.config.baseUrl}/api/stats`);
      }
      
      const response = await fetch(`${this.config.baseUrl}/api/stats`);
      
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
      }
      
      const stats = await response.json();
      
      if (this.config.debugMode) {
        console.log('✅ Stats received:', stats);
      }
      
      return stats;
    } catch (error) {
      console.error('❌ Error fetching stats:', error);
      this.logNetworkError(error);
      return [];
    }
  }

  // Enhanced error logging
  private logNetworkError(error: any): void {
    if (error instanceof Error) {
      if (error.message.includes('Failed to fetch')) {
        console.error('🚫 Network error: Is the backend running?');
        console.error(`🔧 Check if ${this.config.baseUrl} is accessible`);
        console.error('🔧 Verify your IP address in .env.local');
      } else if (error.message.includes('CORS')) {
        console.error('🚫 CORS error: Backend CORS configuration issue');
      } else if (error.message.includes('Timeout')) {
        console.error('🚫 Request timeout: Backend took too long to respond');
      }
    }
    
    console.error('🔧 Current config:', this.config);
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

  // Utility method to get current configuration (for debugging)
  getConfig() {
    return {
      baseUrl: this.config.baseUrl,
      environment: this.config.debugMode ? 'development' : 'production',
      platform: !!(window as any).Capacitor?.isNativePlatform?.() ? 'native' : 'web',
      debugMode: this.config.debugMode
    };
  }

  // Method to test different backend URLs without rebuilding
  async testConnection(testUrl?: string): Promise<{ success: boolean; message: string; latency?: number }> {
    const originalBaseUrl = this.config.baseUrl;
    
    if (testUrl) {
      this.config.baseUrl = testUrl;
    }
    
    try {
      const healthResult = await this.healthCheck();
      const message = healthResult.connected 
        ? `✅ Connected successfully (${healthResult.latency}ms)`
        : `❌ Connection failed: ${healthResult.error}`;
      
      return {
        success: healthResult.connected,
        message,
        latency: healthResult.latency
      };
    } finally {
      // Restore original URL
      this.config.baseUrl = originalBaseUrl;
    }
  }
}

export const apiService = new ApiService();