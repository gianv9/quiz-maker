import { describe, it, expect, vi, beforeEach } from 'vitest';
import { render, screen, waitFor } from '@testing-library/react';
import App from './App';
import { apiService } from './services/api';

// Mock apiService for App.test.tsx
vi.mock('./services/api', () => ({
  apiService: {
    getTopics: vi.fn(() => Promise.resolve(['mock-topic'])), // Mock to resolve immediately
    testConnection: vi.fn(),
    getQuestions: vi.fn(),
    getConfig: vi.fn().mockReturnValue({ baseUrl: 'http://localhost:5000' }),
    submitScore: vi.fn(),
  },
}));

// Mock Ionic overlay components for App.test.tsx
vi.mock('@ionic/react', async () => {
  const actual = await vi.importActual<typeof import('@ionic/react')>('@ionic/react');
  return {
    ...actual,
    IonLoading: ({ isOpen }: { isOpen: boolean }) => (isOpen ? <div>Loading topics...</div> : null),
    IonToast: ({ isOpen, message }: { isOpen: boolean; message: string }) => (isOpen ? <div>{message}</div> : null),
    IonAlert: ({ isOpen, header, message, buttons }: any) => (isOpen ? <div>{header}{message}</div> : null),
  };
});

describe('App', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  it('renders the App component', async () => {
    render(<App />);
    // Wait for the loading state to disappear from the Home component (rendered by App)
    await waitFor(() => {
      expect(screen.queryByText('Loading topics...')).not.toBeInTheDocument();
    });
    // You can add more assertions here if needed, e.g., check for a specific title on the Home page
    expect(screen.getByText('🎯 AWS Knowledge Quest')).toBeInTheDocument();
  });
});
