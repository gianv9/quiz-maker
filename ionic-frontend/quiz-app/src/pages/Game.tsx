// src/pages/Game.tsx
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
  IonProgressBar,
  IonItem,
  IonLabel,
  IonCheckbox,
  IonRadio,
  IonRadioGroup,
  IonAlert,
  IonLoading,
  IonToast,
  IonIcon,
  IonBadge,
  IonGrid,
  IonRow,
  IonCol,
  IonList,
} from '@ionic/react';
import { useParams, useHistory } from 'react-router-dom';
import { 
  checkmarkCircle, 
  closeCircle, 
  arrowForward, 
  home,
  trophy,
  partlySunny
} from 'ionicons/icons';
import { apiService, Question, DetailedResult } from '../services/api';
import './Game.css';

interface GameParams {
  topic: string;
  difficulty: string;
}

const Game: React.FC = () => {
  const { topic, difficulty } = useParams<GameParams>();
  const history = useHistory();
  
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswers, setSelectedAnswers] = useState<number[]>([]);
  const [score, setScore] = useState(0);
  const [correctAnswers, setCorrectAnswers] = useState(0);
  const [detailedResults, setDetailedResults] = useState<DetailedResult[]>([]);
  const [showFeedback, setShowFeedback] = useState(false);
  const [gameFinished, setGameFinished] = useState(false);
  const [loading, setLoading] = useState(true);
  const [showToast, setShowToast] = useState(false);
  const [toastMessage, setToastMessage] = useState('');
  const [showExitAlert, setShowExitAlert] = useState(false);

  const urlParams = new URLSearchParams(window.location.search);
  const questionCount = urlParams.get('count') || '10';

  useEffect(() => {
    loadQuestions();
  }, [topic, difficulty, questionCount]);

  const loadQuestions = async () => {
    try {
      const questionList = await apiService.getQuestions(topic, difficulty, questionCount);
      setQuestions(questionList);
    } catch (error) {
      setToastMessage('Failed to load questions. Please try again.');
      setShowToast(true);
    } finally {
      setLoading(false);
    }
  };

  const currentQuestion = questions[currentIndex];
  const isMultipleChoice = currentQuestion?.question_type === 'multiple-choice';

  const handleAnswerChange = (answerIndex: number) => {
    if (showFeedback) return; // Prevent changes after submission

    if (isMultipleChoice) {
      setSelectedAnswers(prev => {
        const newAnswers = [...prev];
        const existingIndex = newAnswers.indexOf(answerIndex);
        
        if (existingIndex > -1) {
          newAnswers.splice(existingIndex, 1);
        } else {
          newAnswers.push(answerIndex);
        }
        
        return newAnswers;
      });
    } else {
      setSelectedAnswers([answerIndex]);
    }
  };

  const submitAnswer = () => {
    if (selectedAnswers.length === 0) {
      setToastMessage('Please select an answer');
      setShowToast(true);
      return;
    }

    const questionScore = apiService.calculateQuestionScore(
      currentQuestion.question_type,
      currentQuestion.correct_answers,
      selectedAnswers,
      difficulty
    );

    const basePoints = { easy: 10, medium: 20, hard: 30 }[difficulty] || 10;
    const isFullCredit = questionScore === basePoints;

    setScore(prev => prev + questionScore);
    if (isFullCredit) {
      setCorrectAnswers(prev => prev + 1);
    }

    // Store detailed result
    setDetailedResults(prev => [...prev, {
      question_type: currentQuestion.question_type,
      correct_answers: currentQuestion.correct_answers,
      user_answers: selectedAnswers,
      score: questionScore
    }]);

    setShowFeedback(true);
  };

  const nextQuestion = () => {
    if (currentIndex + 1 >= questions.length) {
      finishGame();
    } else {
      setCurrentIndex(prev => prev + 1);
      setSelectedAnswers([]);
      setShowFeedback(false);
    }
  };

  const finishGame = async () => {
    try {
      await apiService.submitScore({
        topic,
        difficulty,
        score,
        correct: correctAnswers,
        total: questions.length,
        detailed_results: detailedResults
      });
      setGameFinished(true);
    } catch (error) {
      setToastMessage('Failed to save score');
      setShowToast(true);
      setGameFinished(true);
    }
  };

  // Navigation function that works in tests
  const navigateToResults = () => {
    history.push('/results');
  };

  const getAnswerStatus = (index: number) => {
    if (!showFeedback) return '';
    
    const isCorrect = currentQuestion.correct_answers.includes(index);
    const isSelected = selectedAnswers.includes(index);
    
    if (isCorrect) return 'correct';
    if (isSelected && !isCorrect) return 'incorrect';
    return '';
  };

  const getFeedbackMessage = () => {
    if (!showFeedback) return null;

    const questionScore = apiService.calculateQuestionScore(
      currentQuestion.question_type,
      currentQuestion.correct_answers,
      selectedAnswers,
      difficulty
    );
    
    const basePoints = { easy: 10, medium: 20, hard: 30 }[difficulty] || 10;
    const isFullCredit = questionScore === basePoints;
    const isPartialCredit = questionScore > 0 && questionScore < basePoints;

    if (isFullCredit) {
      return { type: 'success', message: '✅ Correct!', icon: checkmarkCircle };
    } else if (isPartialCredit) {
      return { 
        type: 'warning', 
        message: `🟡 Partial Credit: ${questionScore}/${basePoints} points`,
        icon: partlySunny
      };
    } else {
      return { type: 'danger', message: '❌ Incorrect', icon: closeCircle };
    }
  };

  const progress = questions.length > 0 ? (currentIndex / questions.length) : 0;
  const percentage = Math.round((correctAnswers / questions.length) * 100);

  if (loading) {
    return (
      <IonPage>
        <IonHeader>
          <IonToolbar color="primary">
            <IonTitle>Loading Quiz...</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <IonLoading isOpen={loading} message="Loading questions..." />
        </IonContent>
      </IonPage>
    );
  }

  if (gameFinished) {
    return (
      <IonPage>
        <IonHeader>
          <IonToolbar color="primary">
            <IonTitle>Quiz Complete!</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent className="game-content">
          <div className="final-results">
            <IonCard>
              <IonCardHeader>
                <IonCardTitle className="text-center">
                  <IonIcon icon={trophy} className="trophy-icon" />
                  <h1>🎉 Quiz Complete!</h1>
                </IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <div className="score-display">
                  <h2>{correctAnswers}/{questions.length} ({percentage}%)</h2>
                  <h3>{score} points</h3>
                </div>
                
                <div className="final-message">
                  {percentage >= 90 && '🏆 Outstanding! You\'ve mastered this topic!'}
                  {percentage >= 80 && percentage < 90 && '🌟 Excellent work! Just a few areas to review.'}
                  {percentage >= 70 && percentage < 80 && '👍 Good job! Some concepts need more study.'}
                  {percentage < 70 && '📚 Keep studying! Review the reference materials.'}
                </div>
                
                <IonGrid>
                  <IonRow>
                    <IonCol>
                      <IonButton expand="block" color="primary" routerLink="/home">
                        <IonIcon icon={home} slot="start" />
                        Back to Menu
                      </IonButton>
                    </IonCol>
                    <IonCol>
                      <IonButton 
                        expand="block" 
                        fill="outline" 
                        onClick={navigateToResults}
                        data-testid="view-statistics-button"
                      >
                        <IonIcon icon={trophy} slot="start" />
                        View Statistics
                      </IonButton>
                    </IonCol>
                  </IonRow>
                </IonGrid>
              </IonCardContent>
            </IonCard>
          </div>
        </IonContent>
      </IonPage>
    );
  }

  if (questions.length === 0) {
    return (
      <IonPage>
        <IonHeader>
          <IonToolbar color="primary">
            <IonTitle>No Questions Available</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <div className="no-questions">
            <h2>No questions available for this topic and difficulty</h2>
            <IonButton routerLink="/home">Back to Menu</IonButton>
          </div>
        </IonContent>
      </IonPage>
    );
  }

  const feedback = getFeedbackMessage();

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar color="primary">
          <IonTitle>
            {topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase())} - {difficulty.charAt(0).toUpperCase() + difficulty.slice(1)}
          </IonTitle>
        </IonToolbar>
      </IonHeader>
      
      <IonContent className="game-content">
        {/* Stats Header */}
        <IonCard className="stats-card">
          <IonCardContent>
            <IonGrid>
              <IonRow>
                <IonCol>
                  <div className="stat">
                    <div className="stat-label">Score</div>
                    <div className="stat-value">{score}</div>
                  </div>
                </IonCol>
                <IonCol>
                  <div className="stat">
                    <div className="stat-label">Question</div>
                    <div className="stat-value">{currentIndex + 1}/{questions.length}</div>
                  </div>
                </IonCol>
                <IonCol>
                  <div className="stat">
                    <div className="stat-label">Correct</div>
                    <div className="stat-value">{correctAnswers}</div>
                  </div>
                </IonCol>
              </IonRow>
            </IonGrid>
          </IonCardContent>
        </IonCard>

        {/* Progress Bar */}
        <IonProgressBar value={progress} className="progress-bar" />

        {/* Question Card */}
        <IonCard className="question-card">
          <IonCardHeader>
            <div className="question-type-badge">
              <IonBadge color={isMultipleChoice ? 'warning' : 'primary'}>
                {isMultipleChoice ? 'Multiple Selection' : 'Single Choice'}
              </IonBadge>
            </div>
          </IonCardHeader>
          <IonCardContent>
            <h2 className="question-text">{currentQuestion.question}</h2>
            
            <IonList className="answers-list">
              {currentQuestion.answers.map((answer, index) => (
                <IonItem
                  key={index}
                  button
                  className={`answer-item ${getAnswerStatus(index)}`}
                  onClick={() => handleAnswerChange(index)}
                  disabled={showFeedback}
                >
                  {isMultipleChoice ? (
                    <IonCheckbox
                      checked={selectedAnswers.includes(index)}
                      onIonChange={() => handleAnswerChange(index)}
                      disabled={showFeedback}
                    />
                  ) : (
                    <IonRadio
                      value={index}
                      checked={selectedAnswers.includes(index)}
                      disabled={showFeedback}
                    />
                  )}
                  <IonLabel className="answer-text">{answer}</IonLabel>
                </IonItem>
              ))}
            </IonList>
          </IonCardContent>
        </IonCard>

        {/* Feedback */}
        {showFeedback && feedback && (
          <IonCard className={`feedback-card ${feedback.type}`}>
            <IonCardContent>
              <div className="feedback-header">
                <IonIcon icon={feedback.icon} />
                <strong>{feedback.message}</strong>
              </div>
              <p>{currentQuestion.explanation}</p>
              
              {currentQuestion.references.length > 0 && (
                <div className="references">
                  <h4>📚 Study Resources:</h4>
                  {currentQuestion.references.map((ref, index) => (
                    <div key={index}>{ref}</div>
                  ))}
                </div>
              )}
            </IonCardContent>
          </IonCard>
        )}

        {/* Action Buttons */}
        <div className="action-buttons">
          {!showFeedback ? (
            <IonButton
              expand="block"
              onClick={submitAnswer}
              disabled={selectedAnswers.length === 0}
              color="primary"
              data-testid="submit-answer-button"
            >
              Submit Answer
            </IonButton>
          ) : (
            <IonButton
              expand="block"
              onClick={nextQuestion}
              color="success"
              data-testid="next-question-button"
            >
              <IonIcon icon={arrowForward} slot="end" />
              {currentIndex + 1 >= questions.length ? 'Finish Quiz' : 'Next Question'}
            </IonButton>
          )}
          
          <IonButton
            expand="block"
            fill="outline"
            color="medium"
            onClick={() => setShowExitAlert(true)}
          >
            Exit Quiz
          </IonButton>
        </div>

        <IonAlert
          isOpen={showExitAlert}
          onDidDismiss={() => setShowExitAlert(false)}
          header="Exit Quiz"
          message="Are you sure you want to exit? Your progress will be lost."
          buttons={[
            {
              text: 'Cancel',
              role: 'cancel'
            },
            {
              text: 'Exit',
              handler: () => history.push('/home')
            }
          ]}
        />

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

export default Game;