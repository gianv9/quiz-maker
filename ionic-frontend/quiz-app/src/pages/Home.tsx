// src/pages/Home.tsx - Add debug tools to test API
import React, { useState, useEffect } from 'react';
import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
  IonGrid,
  IonRow,
  IonCol,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonButton,
  IonSelect,
  IonSelectOption,
  IonItem,
  IonLabel,
  IonIcon,
  IonLoading,
  IonToast,
  IonAlert,
} from '@ionic/react';
import { gameController, trophy, shuffle, bug } from 'ionicons/icons';
import { useHistory } from 'react-router-dom';
import { apiService } from '../services/api';
import './Home.css';

const Home: React.FC = () => {
  const history = useHistory();
  const [topics, setTopics] = useState<string[]>([]);
  const [selectedTopic, setSelectedTopic] = useState<string>('');
  const [selectedDifficulty, setSelectedDifficulty] = useState<string>('medium');
  const [questionCount, setQuestionCount] = useState<string>('10');
  const [loading, setLoading] = useState(true);
  const [showToast, setShowToast] = useState(false);
  const [toastMessage, setToastMessage] = useState('');
  const [showDebugAlert, setShowDebugAlert] = useState(false);
  const [debugResult, setDebugResult] = useState<string>('');

  useEffect(() => {
    loadTopics();
  }, []);

  const loadTopics = async () => {
    try {
      const topicList = await apiService.getTopics();
      setTopics(topicList);
    } catch (error) {
      setToastMessage('Failed to load topics. Using default topics.');
      setShowToast(true);
      // Set default topics if API fails
      setTopics(['aws-shared-responsibility', 'aws-services', 'aws-storage', 'aws-security', 'aws-well-architected']);
    } finally {
      setLoading(false);
    }
  };

  const startQuiz = (topic: string) => {
    if (!selectedDifficulty) {
      setToastMessage('Please select a difficulty level');
      setShowToast(true);
      return;
    }
    
    const params = new URLSearchParams({
      count: questionCount
    });
    
    history.push(`/game/${topic}/${selectedDifficulty}?${params}`);
  };

  // Debug function to test questions API
  const debugQuestionAPI = async () => {
    try {
      console.log('🐛 Starting API debug test...');
      
      // Test current configuration
      const config = apiService.getConfig();
      console.log('🔧 Current API config:', config);
      
      // Test connection
      const connectionTest = await apiService.testConnection();
      console.log('🌐 Connection test:', connectionTest);
      
      // Test topics (we know this works)
      console.log('📋 Testing topics API...');
      const topicsResult = await apiService.getTopics();
      console.log('✅ Topics result:', topicsResult);
      
      // Test questions API with the parameters we'd use
      const testTopic = 'mixed';
      const testDifficulty = 'medium';
      const testCount = '5';
      
      console.log('❓ Testing questions API...');
      console.log(`📡 URL will be: ${config.baseUrl}/api/questions/${testTopic}/${testDifficulty}?count=${testCount}`);
      
      const questionsResult = await apiService.getQuestions(testTopic, testDifficulty, testCount);
      console.log('✅ Questions result:', questionsResult);
      
      setDebugResult(`✅ All tests passed!\n\nConfig: ${JSON.stringify(config, null, 2)}\n\nTopics: ${topicsResult.length} found\nQuestions: ${questionsResult.length} found\n\nFirst question: ${questionsResult[0]?.question?.substring(0, 100)}...`);
      setShowDebugAlert(true);
      
    } catch (error: any) {
      console.error('❌ Debug test failed:', error);
      setDebugResult(`❌ Debug test failed!\n\nError: ${error.message}\n\nConfig: ${JSON.stringify(apiService.getConfig(), null, 2)}\n\nCheck console for detailed logs.`);
      setShowDebugAlert(true);
    }
  };

  const formatTopicName = (topic: string) => {
    return topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase());
  };

  const getDifficultyColor = (difficulty: string) => {
    switch (difficulty) {
      case 'easy': return 'success';
      case 'medium': return 'warning';
      case 'hard': return 'danger';
      default: return 'medium';
    }
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar color="primary">
          <IonTitle>🎯 AWS Knowledge Quest</IonTitle>
        </IonToolbar>
      </IonHeader>
      
      <IonContent fullscreen className="home-content">
        <IonLoading isOpen={loading} message="Loading topics..." />
        
        <div className="header-section">
          <h1>Choose Your Learning Path</h1>
          <p>Select a topic and difficulty to start your quiz</p>
        </div>

        {/* Debug Section - Only show in development */}
        {(!!(window as any).Capacitor?.isNativePlatform?.() || import.meta.env.DEV) && (
          <IonCard className="debug-card" style={{margin: '16px', border: '2px dashed #ff6b6b'}}>
            <IonCardHeader>
              <IonCardTitle style={{color: '#ff6b6b', fontSize: '0.9rem'}}>
                🐛 Debug Tools (Dev Only)
              </IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <IonButton 
                size="small" 
                color="warning"
                onClick={debugQuestionAPI}
              >
                <IonIcon icon={bug} slot="start" />
                Test Questions API
              </IonButton>
              <p style={{fontSize: '0.8rem', marginTop: '8px', color: '#666'}}>
                If quiz loading fails, click this to debug the questions API
              </p>
            </IonCardContent>
          </IonCard>
        )}

        {/* Quiz Settings */}
        <IonCard className="settings-card">
          <IonCardHeader>
            <IonCardTitle>Quiz Settings</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <IonItem>
              <IonLabel>Difficulty Level</IonLabel>
              <IonSelect
                value={selectedDifficulty}
                onSelectionChange={e => setSelectedDifficulty(e.detail.value)}
                interface="popover"
              >
                <IonSelectOption value="easy">Easy (10 pts)</IonSelectOption>
                <IonSelectOption value="medium">Medium (20 pts)</IonSelectOption>
                <IonSelectOption value="hard">Hard (30 pts)</IonSelectOption>
              </IonSelect>
            </IonItem>
            
            <IonItem>
              <IonLabel>Number of Questions</IonLabel>
              <IonSelect
                value={questionCount}
                onSelectionChange={e => setQuestionCount(e.detail.value)}
                interface="popover"
              >
                <IonSelectOption value="5">5 Questions</IonSelectOption>
                <IonSelectOption value="10">10 Questions</IonSelectOption>
                <IonSelectOption value="15">15 Questions</IonSelectOption>
                <IonSelectOption value="20">20 Questions</IonSelectOption>
                <IonSelectOption value="30">30 Questions</IonSelectOption>
                <IonSelectOption value="all">All Available</IonSelectOption>
              </IonSelect>
            </IonItem>
          </IonCardContent>
        </IonCard>

        {/* Topic Selection */}
        <IonGrid>
          <IonRow>
            {topics.map((topic) => (
              <IonCol size="12" sizeMd="6" key={topic}>
                <IonCard button className="topic-card" onClick={() => startQuiz(topic)}>
                  <IonCardContent>
                    <div className="topic-icon">
                      <IonIcon icon={gameController} />
                    </div>
                    <h3>{formatTopicName(topic)}</h3>
                    <p>Master {formatTopicName(topic).toLowerCase()} concepts</p>
                  </IonCardContent>
                </IonCard>
              </IonCol>
            ))}
            
            {/* Mixed Review Card */}
            <IonCol size="12" sizeMd="6">
              <IonCard button className="topic-card mixed-review" onClick={() => startQuiz('mixed')}>
                <IonCardContent>
                  <div className="topic-icon">
                    <IonIcon icon={shuffle} />
                  </div>
                  <h3>🎲 Mixed Review</h3>
                  <p>Random questions from all topics</p>
                </IonCardContent>
              </IonCard>
            </IonCol>
          </IonRow>
        </IonGrid>

        {/* Quick Actions */}
        <div className="quick-actions">
          <IonButton
            expand="block"
            color={getDifficultyColor(selectedDifficulty)}
            onClick={() => startQuiz('mixed')}
            className="start-button"
          >
            <IonIcon icon={gameController} slot="start" />
            Start {selectedDifficulty.charAt(0).toUpperCase() + selectedDifficulty.slice(1)} Quiz
          </IonButton>
          
          <IonButton
            expand="block"
            fill="outline"
            color="medium"
            routerLink="/results"
          >
            <IonIcon icon={trophy} slot="start" />
            View Statistics
          </IonButton>
        </div>

        <IonToast
          isOpen={showToast}
          onDidDismiss={() => setShowToast(false)}
          message={toastMessage}
          duration={3000}
          position="bottom"
        />

        <IonAlert
          isOpen={showDebugAlert}
          onDidDismiss={() => setShowDebugAlert(false)}
          header="🐛 API Debug Results"
          message={debugResult}
          buttons={['OK']}
        />
      </IonContent>
    </IonPage>
  );
};

export default Home;