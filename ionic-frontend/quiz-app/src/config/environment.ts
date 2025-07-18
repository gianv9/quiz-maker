interface AppConfig {
  baseUrl: string;
  debugMode: boolean;
}

const getConfig = (): AppConfig => {
  const isDev = import.meta.env.DEV;
  const isCapacitor = !!window.Capacitor?.isNativePlatform?.();
  
  const config = {
    baseUrl: isDev && isCapacitor 
      ? import.meta.env.VITE_API_BASE_URL_LOCAL || 'http://172.16.0.14:5000'
      : isDev 
        ? 'http://localhost:5000'
        : import.meta.env.VITE_API_BASE_URL || 'https://us-central1-quiz-maker-12470.cloudfunctions.net',
    debugMode: isDev
  };

  // Debug logging for mobile
  if (isCapacitor && isDev) {
    console.log('🔧 Mobile App Config:', config);
    console.log('🔧 Environment variables:', {
      VITE_API_BASE_URL_LOCAL: import.meta.env.VITE_API_BASE_URL_LOCAL,
      DEV: import.meta.env.DEV,
      isCapacitor
    });
  }

  return config;
};

export const appConfig = getConfig();