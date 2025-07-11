import { describe, it, expect, vi } from 'vitest';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { IonReactRouter } from '@ionic/react-router';
import Home from './Home';
import { apiService } from '../services/api';

// Mock Ionic overlay components
vi.mock('@ionic/react', async () => {
  const actual = await vi.importActual<typeof import('@ionic/react')>('@ionic/react');
  return {
    ...actual,
    IonLoading: ({ isOpen }: { isOpen: boolean }) => (isOpen ? <div>Loading topics...</div> : null),
    IonToast: ({ isOpen, message }: { isOpen: boolean; message: string }) => (isOpen ? <div>{message}</div> : null),
    IonAlert: ({ isOpen, header, message }: { isOpen: boolean; header: string; message: string }) => (isOpen ? <div>{header}{message}</div> : null),
  };
});

// Mock the apiService
vi.mock('../services/api', () => ({
  apiService: {
    getTopics: vi.fn(),
    testConnection: vi.fn(),
    getQuestions: vi.fn(),
    getConfig: vi.fn().mockReturnValue({ baseUrl: 'http://localhost:5000' }),
  },
}));

// Mock the useHistory hook
const mockHistoryPush = vi.fn();
vi.mock('react-router-dom', async () => {
  const actual = await vi.importActual('react-router-dom');
  return {
    ...actual,
    useHistory: () => ({
      push: mockHistoryPush,
    }),
  };
});

describe('Home Page', () => {
  beforeEach(() => {
    // Clear mock history before each test
    vi.clearAllMocks();
  });

  it('should render the main title', () => {
    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );
    const titleElement = screen.getByText('🎯 AWS Knowledge Quest');
    expect(titleElement).toBeInTheDocument();
  });

  it('should display the main heading', () => {
    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );
    const heading = screen.getByRole('heading', { name: /Choose Your Learning Path/i });
    expect(heading).toBeInTheDocument();
  });

  it('should render the start quiz button', () => {
    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );
    const startButton = screen.getByTestId('start-quiz-button');
    expect(startButton).toBeInTheDocument();
  });

  it('should have difficulty set to Medium by default', () => {
    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );
    const difficultySelect = screen.getByTestId('difficulty-select') as HTMLIonSelectElement;
    expect(difficultySelect.value).toBe('medium');
  });

  it('should fetch and display topics on load', async () => {
    const mockTopics = ['aws-services', 'aws-security'];
    apiService.getTopics.mockResolvedValue(mockTopics);

    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );

    // Wait for the loading to disappear
    await waitFor(() => {
      expect(screen.queryByText('Loading topics...')).not.toBeInTheDocument();
    });

    // Check if topic cards are rendered
    expect(await screen.findByRole('heading', { name: /AWS Services/i })).toBeInTheDocument();
    expect(await screen.findByRole('heading', { name: /AWS Security/i })).toBeInTheDocument();
  });

  it('should display default topics if API fails', async () => {
    apiService.getTopics.mockRejectedValue(new Error('API Error'));

    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );

    await waitFor(() => {
      expect(screen.queryByText('Loading topics...')).not.toBeInTheDocument();
    });

    // Check for the toast message
    expect(await screen.findByText('Failed to load topics. Using default topics.')).toBeInTheDocument();
    
    // Check for a default topic
    expect(await screen.findByRole('heading', { name: /AWS Shared Responsibility/i })).toBeInTheDocument();
  });

  it('should navigate to the game page when a topic is clicked', async () => {
    const mockTopics = ['aws-storage'];
    apiService.getTopics.mockResolvedValue(mockTopics);

    render(
      <IonReactRouter>
        <Home />
      </IonReactRouter>
    );

    await waitFor(() => {
      expect(screen.queryByText('Loading topics...')).not.toBeInTheDocument();
    });

    const topicCard = await screen.findByRole('heading', { name: /AWS Storage/i });
    fireEvent.click(topicCard);

    expect(mockHistoryPush).toHaveBeenCalledWith('/game/aws-storage/medium?count=10');
  });
});
''
