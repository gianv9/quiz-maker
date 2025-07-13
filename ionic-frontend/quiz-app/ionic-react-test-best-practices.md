# React/Ionic Testing Best Practices Guide

When writing or fixing React tests, especially for Ionic applications, follow these essential patterns and practices:

## 🔄 **Async State Management & Loading States**

### Problem: Testing loading states when mocked APIs resolve immediately
```javascript
// ❌ BAD - Mock resolves instantly, loading state never visible
apiService.getQuestions.mockResolvedValue(mockData);
render(<Component />);
expect(screen.getByText('Loading...')).toBeInTheDocument(); // FAILS
```

```javascript
// ✅ GOOD - Use controllable promises for loading tests
let resolvePromise;
const controllablePromise = new Promise((resolve) => {
  resolvePromise = resolve;
});
apiService.getQuestions.mockReturnValue(controllablePromise);

render(<Component />);
expect(screen.getByText('Loading...')).toBeInTheDocument(); // WORKS

// Clean up by resolving
await act(async () => {
  resolvePromise(mockData);
});
```

## 🔧 **Debugging Failed Tests**

### When tests fail, follow this systematic approach:

1. **Read the error message carefully** - It often tells you exactly what's wrong
2. **Check the rendered HTML** - Look at what's actually in the DOM vs. what you expect
3. **Verify mock data structure** - Ensure mocks match production interfaces exactly
4. **Test component functions in isolation** - Unit test helper functions separately
5. **Use `screen.debug()`** - See what Testing Library actually finds
6. **Check console for runtime errors** - Component crashes often cause test failures
7. **Verify async timing** - Use controllable promises for loading states

```javascript
// ✅ GOOD - Debug what's actually rendered
it('should display data', async () => {
  renderComponent();
  
  await waitFor(() => {
    expect(screen.queryByText('Loading...')).not.toBeInTheDocument();
  });
  
  // Debug what's actually in the DOM
  screen.debug();
  
  // Now you can see exactly what text is rendered
  expect(screen.getByText('Actual Text From DOM')).toBeInTheDocument();
});
```

## 🧠 **Understanding Component Behavior First**

### Before writing tests, understand what the component actually does
```javascript
// ✅ GOOD - First understand the function behavior
const formatTopicName = (topic: string) => {
  if (topic === 'mixed') return 'Mixed Review';
  return topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase());
};

// Test the actual behavior:
// 'aws-services' → 'aws services' → 'Aws Services'
// NOT 'AWS Services' as you might assume

// ✅ GOOD - Write a unit test for the transformation
describe('formatTopicName', () => {
  it('should format topic names correctly', () => {
    expect(formatTopicName('aws-services')).toBe('Aws Services');
    expect(formatTopicName('mixed')).toBe('Mixed Review');
  });
});

// ✅ GOOD - Use the correct expected values in integration tests
expect(screen.getByText('Aws Services')).toBeInTheDocument();
```

## 🎯 **Text Transformation & Expected Values**

### Problem: Tests failing because expected text doesn't match actual component output
```javascript
// ❌ BAD - Assuming how text transformation works
const formatTopicName = (topic) => topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase());
// 'aws-services' becomes 'Aws Services', not 'AWS Services'
expect(screen.getByText('AWS Services')).toBeInTheDocument(); // FAILS
```

```javascript
// ✅ GOOD - Test the actual output, not what you expect it should be
// First understand the transformation: 'aws-services' → 'Aws Services'
expect(screen.getByText('Aws Services')).toBeInTheDocument(); // WORKS

// Or test the transformation function directly in a separate test
expect(formatTopicName('aws-services')).toBe('Aws Services');
```

## 🛡️ **Defensive Programming for Tests**

### Always handle undefined/null states in components
```javascript
// ❌ BAD - Component crashes when stats is undefined
const calculateOverallStats = () => {
  if (stats.length === 0) return null; // Error: Cannot read property 'length' of undefined
};
```

```javascript
// ✅ GOOD - Defensive checks prevent runtime errors
const calculateOverallStats = () => {
  if (!stats || !Array.isArray(stats) || stats.length === 0) return null;
  // Safe to proceed with stats operations
};
```

## 📦 **Mock Data Structure Alignment**

### Ensure mock data exactly matches your TypeScript interfaces
```javascript
// ✅ GOOD - Mock data matches interface perfectly
export const mockStats: Stats[] = [
  {
    topic: 'aws-services',
    difficulty: 'medium', 
    avg_score: 85,
    avg_percentage: 0.85, // Note: percentage as decimal, not integer
    attempts: 3,
  },
];

// ❌ BAD - Missing properties or wrong types cause test failures
export const mockStats = [
  {
    topic: 'aws-services',
    // Missing required fields
  },
];
```

## 🔍 **Console Error Handling in Tests**

### Handle different argument types in console suppressors
```javascript
// ❌ BAD - Assumes console.error always called with strings
console.error = (...args) => {
  if (args[0].includes('Warning')) return; // Error: args[0].includes is not a function
};
```

```javascript
// ✅ GOOD - Check types before calling string methods
console.error = (...args) => {
  if (
    args.length > 0 &&
    typeof args[0] === 'string' &&
    args[0].includes('Warning: An update to')
  ) {
    return; // Safely suppress
  }
  originalConsoleError.call(console, ...args);
};
```

## 📂 **Import/Export Patterns for Test Mocks**

### Organize mock data properly for reuse across tests
```javascript
// ✅ GOOD - mocks/api.ts exports all mock data
import { Question, Stats } from '../services/api';

export const mockQuestions: Question[] = [/* ... */];
export const mockStats: Stats[] = [/* ... */];

// ✅ GOOD - Tests import what they need
import { mockStats } from '../mocks/api';
import { mockQuestions } from '../mocks/api';
```

## 🔄 **State Management Testing Patterns**

### Test components that depend on async state properly
```javascript
// ✅ GOOD - Handle async state loading in tests
it('should handle empty state gracefully', async () => {
  apiService.getStats.mockResolvedValue([]); // Test empty state
  
  await act(async () => {
    renderComponent();
  });
  
  await waitFor(() => {
    expect(screen.queryByText('Loading...')).not.toBeInTheDocument();
  });
  
  // Test that empty state UI is shown
  expect(screen.getByText('No data available')).toBeInTheDocument();
});
```

### Rule: ALL state updates must be wrapped in act()
```javascript
// ❌ BAD - Causes "not wrapped in act()" warnings
render(<Component />);
fireEvent.click(button);
expect(result).toBeInTheDocument();
```

```javascript
// ✅ GOOD - Wrap renders and interactions
await act(async () => {
  render(<Component />);
});

await act(async () => {
  fireEvent.click(button);
});

expect(result).toBeInTheDocument();
```

## 🧭 **Navigation Testing**

### Problem: routerLink doesn't trigger history.push in tests
```javascript
// ❌ BAD - routerLink won't trigger mocked history
<IonButton routerLink="/results">Go</IonButton>
// Test: expect(mockHistoryPush).toHaveBeenCalled(); // FAILS
```

```javascript
// ✅ GOOD - Use onClick with history.push for testability
const navigateToResults = () => history.push('/results');
<IonButton onClick={navigateToResults}>Go</IonButton>
// Test: expect(mockHistoryPush).toHaveBeenCalledWith('/results'); // WORKS
```

## 🎯 **Element Selection Strategies**

### Priority order for finding elements:
1. **Text content** - Most reliable for Ionic components
2. **Test IDs** - When text isn't unique
3. **Roles** - Last resort, often unreliable with Ionic

```javascript
// ✅ PREFERRED - Text-based selection
const button = screen.findByText('Next Question');

// ✅ GOOD - Test IDs for unique identification
<IonButton data-testid="submit-button">Submit</IonButton>
const button = screen.getByTestId('submit-button');

// ❌ AVOID - Role-based selection with Ionic
const button = screen.findByRole('button', { name: 'Next Question' }); // Often fails
```

## 🔧 **Mock Setup Patterns**

### Always provide default mock implementations
```javascript
// ✅ GOOD - Complete mock setup
vi.mock('../services/api', () => ({
  apiService: {
    getQuestions: vi.fn().mockResolvedValue([]),
    submitScore: vi.fn().mockResolvedValue({ success: true }),
    calculateQuestionScore: vi.fn((type, correct, user, difficulty) => {
      // Provide working calculation logic
      const basePoints = { easy: 10, medium: 20, hard: 30 }[difficulty] || 10;
      return user.filter(a => correct.includes(a)).length > 0 ? basePoints : 0;
    }),
  },
}));
```

## 📱 **Ionic Component Mocking**

### Mock problematic Ionic components
```javascript
// ✅ GOOD - Mock overlay components that cause issues
vi.mock('@ionic/react', async () => {
  const actual = await vi.importActual('@ionic/react');
  return {
    ...actual,
    IonLoading: ({ isOpen, message }) => (isOpen ? <div>{message}</div> : null),
    IonToast: ({ isOpen, message }) => (isOpen ? <div role="status">{message}</div> : null),
    IonAlert: ({ isOpen, header, message }) => (isOpen ? <div>{header}{message}</div> : null),
  };
});
```

## 🔕 **Console Warning Management**

### Suppress expected testing warnings in setupTests.ts
```javascript
// ✅ GOOD - Suppress known testing noise
beforeEach(() => {
  console.error = (...args) => {
    if (
      typeof args[0] === 'string' &&
      (args[0].includes('Warning: An update to') &&
       args[0].includes('was not wrapped in act(...)'))
    ) {
      return; // Suppress act() warnings
    }
    originalConsoleError.call(console, ...args);
  };
});
```

## 🧪 **Test Structure Pattern**

### Follow this consistent structure:
```javascript
describe('Component Name', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    // Set up default mock returns
    apiService.getQuestions.mockResolvedValue(mockData);
  });

  const renderComponent = () => {
    // Set up any URL params/history state needed
    window.history.pushState({}, 'Test', '/test-route?param=value');
    return render(
      <IonReactRouter>
        <Component />
      </IonReactRouter>
    );
  };

  it('should test behavior', async () => {
    await act(async () => {
      renderComponent();
    });

    // Wait for async operations
    await waitFor(() => {
      expect(screen.queryByText('Loading...')).not.toBeInTheDocument();
    });

    // Test interactions
    const button = screen.getByText('Click Me');
    await act(async () => {
      fireEvent.click(button);
    });

    // Assert results
    expect(mockFunction).toHaveBeenCalled();
  });
});
```

## 🚨 **Common Pitfalls to Avoid**

1. **Don't test implementation details** - Test user behavior, not internal state
2. **Don't use real timers** - Mock setTimeout/setInterval in tests
3. **Don't forget cleanup** - Always clear mocks between tests
4. **Don't ignore async operations** - Use waitFor() for async assertions
5. **Don't rely on exact DOM structure** - Use semantic queries when possible
6. **Don't assume text transformations** - Test actual output, not expected format
7. **Don't skip error/empty state testing** - These are common failure points
8. **Don't create mock data that doesn't match interfaces** - Use TypeScript strictly
9. **Don't forget defensive programming** - Always check for undefined/null
10. **Don't use string methods on console args without type checking** - Handle mixed argument types

## ✅ **Quick Checklist**

When writing React/Ionic tests, ensure:
- [ ] All renders wrapped in `act()`
- [ ] All interactions wrapped in `act()`
- [ ] Loading states tested with controllable promises
- [ ] Navigation uses `onClick` + `history.push()` for testability
- [ ] Mocks have realistic return values that match TypeScript interfaces
- [ ] Console warnings are appropriately handled with type checking
- [ ] Async operations use `waitFor()`
- [ ] Test IDs used for unique element identification
- [ ] beforeEach clears all mocks
- [ ] Text expectations match actual component output (check text transformations)
- [ ] Components handle undefined/null states defensively
- [ ] Mock data structure exactly matches production interfaces
- [ ] Empty state scenarios are tested
- [ ] Error state scenarios are tested

Following these patterns will result in reliable, maintainable tests that properly handle React's asynchronous nature and Ionic's component behavior.