// src/pages/Home.tsx
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
} from '@ionic/react';
import { gameController, trophy, shuffle } from 'ionicons/icons';
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
      </IonContent>
    </IonPage>
  );
};

export default Home;