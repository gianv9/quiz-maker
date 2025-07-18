// src/pages/Results.tsx
import React, { useState, useEffect } from 'react';
import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonButton,
  IonItem,
  IonLabel,
  IonList,
  IonIcon,
  IonBadge,
  IonRefresher,
  IonRefresherContent,
  IonLoading,
  IonToast,
  RefresherEventDetail,
} from '@ionic/react';
import { home, refresh, trophy, trendingUp } from 'ionicons/icons';
import { useHistory } from 'react-router-dom';
import { apiService, Stats } from '../services/api';
import './Results.css';

const Results: React.FC = () => {
  const history = useHistory();
  const [stats, setStats] = useState<Stats[]>([]);
  const [loading, setLoading] = useState(true);
  const [showToast, setShowToast] = useState(false);
  const [toastMessage, setToastMessage] = useState('');

  useEffect(() => {
    loadStats();
  }, []);

  const loadStats = async () => {
    try {
      const statistics = await apiService.getStats();
      setStats(statistics || []); // Ensure stats is always an array
    } catch (error) {
      setToastMessage(`Failed to load statistics : ${error} || 'Please try again.'`);
      setShowToast(true);
      setStats([]); // Set empty array on error
    } finally {
      setLoading(false);
    }
  };

  const handleRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    await loadStats();
    event.detail.complete();
  };

  const formatTopicName = (topic: string) => {
    if (topic === 'mixed') return 'Mixed Review';
    return topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase());
  };

  const getDifficultyColor = (difficulty: string) => {
    switch (difficulty.toLowerCase()) {
      case 'easy': return 'success';
      case 'medium': return 'warning';
      case 'hard': return 'danger';
      default: return 'medium';
    }
  };

  const getDifficultyIcon = (difficulty: string) => {
    switch (difficulty.toLowerCase()) {
      case 'easy': return '🟢';
      case 'medium': return '🟡';
      case 'hard': return '🔴';
      default: return '⚪';
    }
  };

  const getPerformanceLevel = (percentage: number) => {
    if (percentage >= 90) return { text: 'Excellent', color: 'success', icon: '🏆' };
    if (percentage >= 80) return { text: 'Good', color: 'primary', icon: '⭐' };
    if (percentage >= 70) return { text: 'Average', color: 'warning', icon: '👍' };
    return { text: 'Needs Work', color: 'danger', icon: '📚' };
  };

  const calculateOverallStats = () => {
    // Add safety check for stats
    if (!stats || !Array.isArray(stats) || stats.length === 0) return null;

    const totalAttempts = stats.reduce((sum, stat) => sum + stat.attempts, 0);
    const avgPercentage = stats.reduce((sum, stat) => sum + (stat.avg_percentage * stat.attempts), 0) / totalAttempts;
    const avgScore = stats.reduce((sum, stat) => sum + (stat.avg_score * stat.attempts), 0) / totalAttempts;

    return {
      totalAttempts,
      avgPercentage: avgPercentage * 100,
      avgScore,
      topicsStudied: new Set(stats.map(s => s.topic)).size
    };
  };

  // Navigation functions for testability
  const navigateToHome = () => {
    history.push('/home');
  };

  const refreshStats = () => {
    loadStats();
  };

  const overallStats = calculateOverallStats();

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar color="primary">
          <IonTitle>📊 Your Learning Statistics</IonTitle>
        </IonToolbar>
      </IonHeader>
      
      <IonContent className="results-content">
        <IonRefresher slot="fixed" onIonRefresh={handleRefresh}>
          <IonRefresherContent></IonRefresherContent>
        </IonRefresher>

        <IonLoading isOpen={loading} message="Loading statistics..." />

        {/* Overall Stats Card */}
        {overallStats && (
          <IonCard className="overall-stats-card">
            <IonCardHeader>
              <IonCardTitle>
                <IonIcon icon={trendingUp} />
                Overall Performance
              </IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <div className="stats-grid">
                <div className="stat-item">
                  <div className="stat-number">{overallStats.totalAttempts}</div>
                  <div className="stat-label">Total Quizzes</div>
                </div>
                <div className="stat-item">
                  <div className="stat-number">{Math.round(overallStats.avgPercentage)}%</div>
                  <div className="stat-label">Average Score</div>
                </div>
                <div className="stat-item">
                  <div className="stat-number">{overallStats.topicsStudied}</div>
                  <div className="stat-label">Topics Studied</div>
                </div>
                <div className="stat-item">
                  <div className="stat-number">{Math.round(overallStats.avgScore)}</div>
                  <div className="stat-label">Average Points</div>
                </div>
              </div>
            </IonCardContent>
          </IonCard>
        )}

        {/* Individual Statistics */}
        {stats && stats.length > 0 ? (
          <IonCard className="detailed-stats-card">
            <IonCardHeader>
              <IonCardTitle>Detailed Statistics</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <IonList>
                {stats.map((stat, index) => {
                  const percentage = Math.round(stat.avg_percentage * 100);
                  const performance = getPerformanceLevel(percentage);
                  
                  return (
                    <IonItem key={index} className="stats-item">
                      <div className="stats-item-content">
                        <div className="topic-info">
                          <h3>{formatTopicName(stat.topic)}</h3>
                          <div className="difficulty-info">
                            <span className="difficulty-icon">
                              {getDifficultyIcon(stat.difficulty)}
                            </span>
                            <IonBadge color={getDifficultyColor(stat.difficulty)}>
                              {stat.difficulty.charAt(0).toUpperCase() + stat.difficulty.slice(1)}
                            </IonBadge>
                          </div>
                        </div>
                        
                        <div className="performance-info">
                          <div className="score-info">
                            <div className="main-score">
                              <span className="percentage">{percentage}%</span>
                              <span className="points">({Math.round(stat.avg_score)} pts)</span>
                            </div>
                            <div className="performance-badge">
                              <IonBadge color={performance.color}>
                                {performance.icon} {performance.text}
                              </IonBadge>
                            </div>
                          </div>
                          
                          <div className="attempts-info">
                            <IonLabel color="medium">
                              {stat.attempts} attempt{stat.attempts !== 1 ? 's' : ''}
                            </IonLabel>
                          </div>
                        </div>
                      </div>
                    </IonItem>
                  );
                })}
              </IonList>
            </IonCardContent>
          </IonCard>
        ) : !loading && (
          <IonCard className="no-stats-card">
            <IonCardContent>
              <div className="no-stats-content">
                <IonIcon icon={trophy} className="no-stats-icon" />
                <h2>No Statistics Yet!</h2>
                <p>Take some quizzes to see your progress here.</p>
                <IonButton 
                  expand="block" 
                  color="primary" 
                  onClick={navigateToHome}
                  className="start-quiz-button"
                  data-testid="start-first-quiz-button"
                >
                  Start Your First Quiz
                </IonButton>
              </div>
            </IonCardContent>
          </IonCard>
        )}

        {/* Action Buttons */}
        <div className="action-buttons">
          <IonButton 
            expand="block" 
            color="primary" 
            onClick={navigateToHome}
            data-testid="back-to-menu-button"
          >
            <IonIcon icon={home} slot="start" />
            Back to Menu
          </IonButton>
          
          <IonButton 
            expand="block" 
            fill="outline" 
            color="medium"
            onClick={refreshStats}
            data-testid="refresh-stats-button"
          >
            <IonIcon icon={refresh} slot="start" />
            Refresh Statistics
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

export default Results;