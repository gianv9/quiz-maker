// jest-dom adds custom jest matchers for asserting on DOM nodes.
// allows you to do things like:
// expect(element).toHaveTextContent(/react/i)
// learn more: https://github.com/testing-library/jest-dom
import '@testing-library/jest-dom/extend-expect';

// Mock matchmedia
window.matchMedia = window.matchMedia || function() {
  return {
      matches: false,
      addListener: function() {},
      removeListener: function() {}
  };
};

// Mock IntersectionObserver for Ionic components
global.IntersectionObserver = class IntersectionObserver {
  constructor() {}
  
  observe() {
    return null;
  }
  
  disconnect() {
    return null;
  }
  
  unobserve() {
    return null;
  }
};

// Suppress specific console warnings during tests
const originalConsoleError = console.error;
const originalConsoleWarn = console.warn;

// Global setup to suppress act warnings
global.beforeEach(() => {
  console.error = (...args) => {
    if (
      args.length > 0 &&
      typeof args[0] === 'string' &&
      (args[0].includes('Warning: An update to') &&
       args[0].includes('was not wrapped in act(...)')) ||
      args[0].includes('Warning: You seem to have overlapping act() calls')
    ) {
      return;
    }
    originalConsoleError.call(console, ...args);
  };

  console.warn = (...args) => {
    if (
      args.length > 0 &&
      typeof args[0] === 'string' &&
      (args[0].includes('componentWillReceiveProps') ||
       args[0].includes('componentWillUpdate') ||
       args[0].includes('Warning: An update to'))
    ) {
      return;
    }
    originalConsoleWarn.call(console, ...args);
  };
});

global.afterEach(() => {
  console.error = originalConsoleError;
  console.warn = originalConsoleWarn;
});

// Mock HTMLElement.animate for Ionic animations
HTMLElement.prototype.animate = HTMLElement.prototype.animate || function() {
  return {
    cancel: () => {},
    finish: () => {},
    addEventListener: () => {},
    removeEventListener: () => {},
  };
};

// Mock ResizeObserver for Ionic components
global.ResizeObserver = class ResizeObserver {
  constructor() {}
  
  observe() {
    return null;
  }
  
  disconnect() {
    return null;
  }
  
  unobserve() {
    return null;
  }
};