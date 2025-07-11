import { describe, it, expect, vi, beforeEach } from 'vitest';
import { render, screen, waitFor, fireEvent, act } from '@testing-library/react';
import { IonReactRouter } from '@ionic/react-router';
import Results from './Results';
import { apiService } from '../services/api';
import { mockStats } from '../mocks/api';

// Mock Ionic overlay components and Refresher
vi.mock('@ionic/react', async () => {
  const actual = await vi.importActual<typeof import('@ionic/react')>('@ionic/react');
  return {
    ...actual,
    IonLoading: ({ isOpen }: { isOpen: boolean }) => (isOpen ? <div>Loading statistics...</div> : null),
    IonToast: ({ isOpen, message }: { isOpen: boolean; message: string }) => (isOpen ? <div role="status">{message}</div> : null),
    IonRefresher: ({ children, onIonRefresh }: any) => (
      <div data-testid="ion-refresher" onClick={() => onIonRefresh({ detail: { complete: vi.fn() } })}>
        {children}
      </div>
    ),
    IonRefresherContent: () => null, // Mock content as it's not relevant for logic
  };
});

// Mock the apiService
vi.mock('../services/api', () => ({
  apiService: {
    getStats: vi.fn(),
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

describe('Results Page', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    // Default mock for successful stats load
    apiService.getStats.mockResolvedValue(mockStats);
  });

  const renderResults = () => {
    return render(
      <IonReactRouter>
        <Results />
      </IonReactRouter>
    );
  };

  it('should show a loading state initially', async () => {
    // Create controllable promise for loading test
    let resolvePromise: (value: any) => void;
    const controllablePromise = new Promise((resolve) => {
      resolvePromise = resolve;
    });
    
    apiService.getStats.mockReturnValue(controllablePromise);
    
    renderResults();
    
    expect(screen.getByText('Loading statistics...')).toBeInTheDocument();
    
    // Clean up by resolving the promise
    await act(async () => {
      resolvePromise!(mockStats);
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });
  });

  it('should display overall and detailed statistics after loading', async () => {
    await act(async () => {
      renderResults();
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });

    // Overall Stats
    expect(screen.getByText('Overall Performance')).toBeInTheDocument();
    expect(screen.getByText('Total Quizzes')).toBeInTheDocument();
    expect(screen.getByText('Average Score')).toBeInTheDocument();
    expect(screen.getByText('Topics Studied')).toBeInTheDocument();

    // Detailed Stats
    expect(screen.getByText('Detailed Statistics')).toBeInTheDocument();
    expect(screen.getByText('Aws Services')).toBeInTheDocument();
    expect(screen.getByText('Aws Security')).toBeInTheDocument();
    expect(screen.getByText('Mixed Review')).toBeInTheDocument();
  });

  it('should display "No Statistics Yet!" if no stats are available', async () => {
    apiService.getStats.mockResolvedValue([]); // Mock empty stats
    
    await act(async () => {
      renderResults();
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });

    expect(screen.getByText('No Statistics Yet!')).toBeInTheDocument();
    expect(screen.getByText('Take some quizzes to see your progress here.')).toBeInTheDocument();
    
    // Use text-based selector instead of role
    expect(screen.getByTestId('start-first-quiz-button')).toBeInTheDocument();
  });

  it('should display an error toast if statistics fail to load', async () => {
    apiService.getStats.mockRejectedValue(new Error('API Error'));
    
    await act(async () => {
      renderResults();
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });

    const toast = await screen.findByRole('status');
    expect(toast).toHaveTextContent(/Failed to load statistics/i);
  });

  it('should navigate to home when "Back to Menu" button is clicked', async () => {
    await act(async () => {
      renderResults();
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });

    // Use text-based selector
    const backButton = screen.getByTestId('back-to-menu-button');
    
    await act(async () => {
      fireEvent.click(backButton);
    });

    expect(mockHistoryPush).toHaveBeenCalledWith('/home');
  });

  it('should refresh statistics when "Refresh Statistics" button is clicked', async () => {
    await act(async () => {
      renderResults();
    });
    
    await waitFor(() => {
      expect(screen.queryByText('Loading statistics...')).not.toBeInTheDocument();
    });

    apiService.getStats.mockClear(); // Clear previous call
    apiService.getStats.mockResolvedValueOnce(mockStats); // Mock for the refresh call

    // Use text-based selector
    const refreshButton = screen.getByTestId('refresh-stats-button');
    
    await act(async () => {
      fireEvent.click(refreshButton);
    });

    await waitFor(() => {
      expect(apiService.getStats).toHaveBeenCalledTimes(1);
    });
  });
});