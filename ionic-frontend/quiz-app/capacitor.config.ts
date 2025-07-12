// ionic-frontend/quiz-app/capacitor.config.ts
import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'io.ionic.starter',
  appName: 'quiz-app',
  webDir: 'dist',
  server: {
    androidScheme: 'https',
    // Allow HTTP requests for development
    allowNavigation: [
      'http://172.16.0.14:5000',
      'http://localhost:5000',
      'http://192.168.*',
      'http://10.0.*'
    ]
  },
  plugins: {
    StatusBar: {
      style: 'dark',
      backgroundColor: '#667eea',
      overlay: false
    },
    // Allow HTTP requests from the app
    CapacitorHttp: {
      enabled: true
    }
  },
  android: {
    // Allow clear text traffic (HTTP) for development
    allowMixedContent: true,
    captureInput: true
  }
};

export default config;