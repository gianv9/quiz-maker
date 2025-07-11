import { describe, it, expect, vi, beforeEach } from 'vitest';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { IonReactRouter } from '@ionic/react-router';
import Game from './Game';
import { apiService } from '../services/api';
import { mockQuestions } from '../mocks/api'; // We will create this mock data file

// Mock Ionic overlay components
vi.mock('@ionic/react', async () => {
  const actual = await vi.importActual<typeof import('@ionic/react')>('@ionic/react');
  return {
    ...actual,
    IonLoading: ({ isOpen }: { isOpen: boolean }) => (isOpen ? <div>Loading questions...</div> : null),
    IonToast: ({ isOpen, message }: { isOpen: boolean; message: string }) => (isOpen ? <div role="status">{message}</div> : null),
    IonAlert: ({ isOpen, header, message, buttons }: any) => (isOpen ? <div>{header}{message}</div> : null),
  };
});

// Mock the apiService
vi.mock('../services/api', () => ({
  apiService: {
    getQuestions: vi.fn(),
    submitScore: vi.fn(),
    calculateQuestionScore: vi.fn((question_type, correct_answers, user_answers, difficulty) => {
        // A simplified mock for score calculation
        const basePoints = { easy: 10, medium: 20, hard: 30 }[difficulty] || 10;
        const correctUserAnswers = user_answers.filter(a => correct_answers.includes(a));
        return correctUserAnswers.length > 0 ? basePoints : 0;
    }),
  },
}));

// Mock the router hooks
const mockHistoryPush = vi.fn();
vi.mock('react-router-dom', async () => {
  const actual = await vi.importActual('react-router-dom');
  return {
    ...actual,
    useHistory: () => ({
      push: mockHistoryPush,
    }),
    useParams: () => ({
      topic: 'aws-services',
      difficulty: 'medium',
    }),
  };
});

describe('Game Page', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    // Mock successful API calls by default
    apiService.getQuestions.mockResolvedValue(mockQuestions);
    apiService.submitScore.mockResolvedValue({ success: true });
  });

  const renderGame = () => {
    // Set a dummy search query for the component to read
    window.history.pushState({}, 'Test page', '/game/aws-services/medium?count=5');
    return render(
      <IonReactRouter>
        <Game />
      </IonReactRouter>
    );
  };

  it('should show a loading state initially', () => {
    renderGame();
    expect(screen.getByText('Loading questions...')).toBeInTheDocument();
  });

  it('should display the first question after loading', async () => {
    renderGame();
    await waitFor(() => {
      expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument();
    });
    expect(screen.getByText(mockQuestions[0].question)).toBeInTheDocument();
    expect(screen.getByText(mockQuestions[0].answers[0])).toBeInTheDocument();
  });

  it('should display an error if questions fail to load', async () => {
    apiService.getQuestions.mockRejectedValue(new Error('API Error'));
    renderGame();
    await waitFor(() => {
      expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument();
    });
    expect(await screen.findByRole('heading', { name: /No questions available for this topic and difficulty/i })).toBeInTheDocument();
  });

  it('allows a user to select an answer and submit', async () => {
    renderGame();
    await waitFor(() => expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument());

    // Select an answer
    const answerOption = screen.getByText(mockQuestions[0].answers[0]);
    await fireEvent.click(answerOption);

    // Submit the answer
    const submitButton = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButton).toBeEnabled());

    fireEvent.click(submitButton);

    // Check for feedback
    expect(await screen.findByText('✅ Correct!')).toBeInTheDocument();
  });

  it('should navigate to the next question after submitting an answer', async () => {
    renderGame();
    await waitFor(() => expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument());

    // Answer first question correctly
    const answerOption1 = screen.getByText(mockQuestions[0].answers[0]);
    await fireEvent.click(answerOption1);
    const submitButton1 = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButton1).toBeEnabled());
    fireEvent.click(submitButton1);

    // Wait for feedback to appear
    await screen.findByText('✅ Correct!');

    // Click Next Question button
    const nextButton = await screen.findByText('Next Question');
    await fireEvent.click(nextButton);

    // Expect to see the second question
    expect(await screen.findByText(mockQuestions[1].question)).toBeInTheDocument();
  });

  it('should handle multiple-choice questions correctly', async () => {
    renderGame();
    await waitFor(() => expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument());

    // Navigate to the second question (multiple choice)
    const answerOption1 = screen.getByText(mockQuestions[0].answers[0]);
    await fireEvent.click(answerOption1);
    const submitButton1 = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButton1).toBeEnabled());
    fireEvent.click(submitButton1);
    const nextButton1 = await screen.findByRole('button', { name: 'Next Question' });
    fireEvent.click(nextButton1);
    await waitFor(() => expect(screen.getByText(mockQuestions[1].question)).toBeInTheDocument());

    // Select multiple correct answers for the second question
    const answerOptionMC1 = screen.getByText(mockQuestions[1].answers[0]); // Operational Excellence
    const answerOptionMC2 = screen.getByText(mockQuestions[1].answers[1]); // Security
    const answerOptionMC3 = screen.getByText(mockQuestions[1].answers[2]); // Cost Optimization

    await fireEvent.click(answerOptionMC1);
    await fireEvent.click(answerOptionMC2);
    await fireEvent.click(answerOptionMC3);

    const submitButtonMC = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButtonMC).toBeEnabled());
    fireEvent.click(submitButtonMC);

    // Expect correct feedback for multiple choice
    expect(await screen.findByText('✅ Correct!')).toBeInTheDocument();
  });

  it('should finish the quiz and navigate to results page', async () => {
    renderGame();
    await waitFor(() => expect(screen.queryByText('Loading questions...')).not.toBeInTheDocument());

    // Answer first question
    const answerOption1 = screen.getByText(mockQuestions[0].answers[0]);
    await fireEvent.click(answerOption1);
    const submitButton1 = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButton1).toBeEnabled());
    fireEvent.click(submitButton1);

    // Wait for feedback to appear
    await screen.findByText('✅ Correct!');

    // Click Next Question (which will be Finish Quiz)
    const nextButton = await screen.findByText('Next Question');
    await fireEvent.click(nextButton);

    // Answer second question
    await waitFor(() => expect(screen.getByText(mockQuestions[1].question)).toBeInTheDocument());
    const answerOptionMC1 = screen.getByText(mockQuestions[1].answers[0]);
    await fireEvent.click(answerOptionMC1);
    const submitButtonMC = await screen.findByText('Submit Answer');
    await waitFor(() => expect(submitButtonMC).toBeEnabled());
    fireEvent.click(submitButtonMC);

    // Click Finish Quiz button
    const finishQuizButton = await screen.findByText('Finish Quiz');
    fireEvent.click(finishQuizButton);

    // Wait for the Quiz Complete screen to appear
    expect(await screen.findByText('🎉 Quiz Complete!')).toBeInTheDocument();

    // Click the View Statistics button to navigate to results
    const viewStatsButton = await screen.findByText('View Statistics');
    fireEvent.click(viewStatsButton);

    // Expect submitScore to have been called and navigation to occur
    expect(apiService.submitScore).toHaveBeenCalledTimes(1);
    expect(mockHistoryPush).toHaveBeenCalledWith('/results');
  });
});
