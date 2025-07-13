import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';

// Ionic CSS imports (official approach)
import '@ionic/react/css/core.css';
import '@ionic/react/css/normalize.css';
import '@ionic/react/css/structure.css';
import '@ionic/react/css/typography.css';
import '@ionic/react/css/padding.css';
import '@ionic/react/css/float-elements.css';
import '@ionic/react/css/text-alignment.css';
import '@ionic/react/css/text-transformation.css';
import '@ionic/react/css/flex-utils.css';
import '@ionic/react/css/display.css';

import { StatusBar, Style } from '@capacitor/status-bar';
import { Capacitor } from '@capacitor/core';

const setupStatusBar = async () => {
  if (Capacitor.isNativePlatform()) {
    try {
      await StatusBar.setStyle({ style: Style.Light }); // White text
      await StatusBar.setBackgroundColor({ color: '#667eea' }); // Match your app theme
      await StatusBar.setOverlaysWebView({ overlay: false });
    } catch (error) {
      console.error('Status bar error:', error);
    }
  }
};

setupStatusBar();

const container = document.getElementById('root');
const root = createRoot(container!);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);