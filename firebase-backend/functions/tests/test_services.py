"""Tests for QuizService business logic."""

# import pytest
from unittest.mock import MagicMock
from app.services import QuizService


class TestQuizService:
    """Test the main quiz business logic."""

    def test_calculate_score_single_choice_correct(self):
        """Test scoring a single-choice question correctly."""
        service = QuizService(db_client=MagicMock())
        
        # Test correct answer
        score = service.calculate_score(
            question_type='single-choice',
            correct_answers=['A'],
            user_answers=['A'],
            difficulty='easy'
        )
        assert score == 10  # Easy questions are worth 10 points

    def test_calculate_score_single_choice_wrong(self):
        """Test scoring a single-choice question incorrectly."""
        service = QuizService(db_client=MagicMock())
        
        # Test wrong answer
        score = service.calculate_score(
            question_type='single-choice',
            correct_answers=['A'],
            user_answers=['B'],
            difficulty='easy'
        )
        assert score == 0

    def test_calculate_score_different_difficulties(self):
        """Test that different difficulties give different points."""
        service = QuizService(db_client=MagicMock())
        
        # Easy = 10 points
        easy_score = service.calculate_score('single-choice', ['A'], ['A'], 'easy')
        assert easy_score == 10
        
        # Medium = 20 points
        medium_score = service.calculate_score('single-choice', ['A'], ['A'], 'medium')
        assert medium_score == 20
        
        # Hard = 30 points
        hard_score = service.calculate_score('single-choice', ['A'], ['A'], 'hard')
        assert hard_score == 30

    def test_calculate_score_multiple_choice_perfect(self):
        """Test perfect score on multiple choice."""
        service = QuizService(db_client=MagicMock())
        
        score = service.calculate_score(
            question_type='multiple-choice',
            correct_answers=['A', 'B'],
            user_answers=['A', 'B'],
            difficulty='medium'
        )
        assert score == 20  # Perfect score

    def test_calculate_score_multiple_choice_partial(self):
        """Test partial score on multiple choice."""
        service = QuizService(db_client=MagicMock())
        
        # Get 1 out of 2 correct
        score = service.calculate_score(
            question_type='multiple-choice',
            correct_answers=['A', 'B'],
            user_answers=['A'],
            difficulty='medium'
        )
        assert score == 10  # Half score (1/2 * 20 = 10)

    def test_calculate_score_multiple_choice_with_wrong_answers(self):
        """Test multiple choice with some wrong selections."""
        service = QuizService(db_client=MagicMock())
        
        # Get 1 correct, 1 wrong out of 2 total correct
        score = service.calculate_score(
            question_type='multiple-choice',
            correct_answers=['A', 'B'],
            user_answers=['A', 'C'],  # A is correct, C is wrong
            difficulty='medium'
        )
        # (1 correct - 1 wrong) / 2 total = 0/2 = 0 points
        assert score == 0

    def test_get_all_topics_empty(self):
        """Test getting topics when database is empty."""
        mock_db = MagicMock()
        mock_db.collection.return_value.stream.return_value = []
        
        service = QuizService(db_client=mock_db)
        topics = service.get_all_topics()
        
        assert topics == []

    def test_get_all_topics_with_data(self, sample_questions):
        """Test getting topics from sample data."""
        mock_db = MagicMock()
        
        # Create mock documents
        mock_docs = []
        for q in sample_questions:
            mock_doc = MagicMock()
            mock_doc.to_dict.return_value = q
            mock_docs.append(mock_doc)
        
        mock_db.collection.return_value.stream.return_value = mock_docs
        
        service = QuizService(db_client=mock_db)
        topics = service.get_all_topics()
        
        # Should return unique topics
        assert 'python' in topics
        assert len(topics) == 1  # Only one unique topic in sample data

    def test_get_questions_by_topic_and_difficulty(self, sample_questions):
        """Test getting questions filtered by topic and difficulty."""
        mock_db = MagicMock()
        
        # Create mock documents for easy Python questions
        easy_questions = [q for q in sample_questions if q['difficulty'] == 'easy']
        mock_docs = []
        for q in easy_questions:
            mock_doc = MagicMock()
            mock_doc.to_dict.return_value = q
            mock_doc.id = q['id']
            mock_docs.append(mock_doc)
        
        # Setup the mock query chain
        mock_collection = MagicMock()
        mock_db.collection.return_value = mock_collection
        mock_collection.where.return_value.where.return_value.limit.return_value.stream.return_value = mock_docs
        
        service = QuizService(db_client=mock_db)
        questions = service.get_questions_by_topic_and_difficulty('python', 'easy', 10)
        
        # Should return formatted questions
        assert len(questions) == 1  # One easy Python question in sample data
        assert questions[0]['id'] == 'q1'
        assert questions[0]['question'] == 'What is Python?'

    def test_submit_quiz_score_basic(self):
        """Test submitting a basic quiz score."""
        mock_db = MagicMock()
        mock_collection = MagicMock()
        mock_db.collection.return_value = mock_collection
        
        service = QuizService(db_client=mock_db)
        
        score_data = {
            'topic': 'python',
            'difficulty': 'easy',
            'score': 80,
            'correct': 4,
            'total': 5
        }
        
        result = service.submit_quiz_score(score_data)
        
        # Should return success
        assert result == {'status': 'success'}
        
        # Should have called Firestore to save the score
        mock_collection.add.assert_called_once()

    def test_submit_quiz_score_with_detailed_results(self):
        """Test submitting score with detailed question results."""
        mock_db = MagicMock()
        mock_collection = MagicMock()
        mock_db.collection.return_value = mock_collection
        
        service = QuizService(db_client=mock_db)
        
        score_data = {
            'topic': 'python',
            'difficulty': 'easy',
            'total': 2,
            'detailed_results': [
                {
                    'question_type': 'single-choice',
                    'correct_answers': ['A'],
                    'user_answers': ['A']
                },
                {
                    'question_type': 'single-choice',
                    'correct_answers': ['B'],
                    'user_answers': ['C']
                }
            ]
        }
        
        result = service.submit_quiz_score(score_data)
        
        # Should calculate score automatically
        assert score_data['score'] == 10  # One correct (10 points) + one wrong (0 points)
        assert score_data['correct'] == 1  # One question answered correctly
        assert result == {'status': 'success'}

    def test_get_quiz_statistics_empty(self):
        """Test getting statistics when no scores exist."""
        mock_db = MagicMock()
        mock_db.collection.return_value.stream.return_value = []
        
        service = QuizService(db_client=mock_db)
        stats = service.get_quiz_statistics()
        
        assert stats == []

    def test_get_quiz_statistics_with_data(self, sample_scores):
        """Test getting statistics with actual score data."""
        mock_db = MagicMock()
        
        # Create mock documents from sample scores
        mock_docs = []
        for score in sample_scores:
            mock_doc = MagicMock()
            mock_doc.to_dict.return_value = score
            mock_docs.append(mock_doc)
        
        mock_db.collection.return_value.stream.return_value = mock_docs
        
        service = QuizService(db_client=mock_db)
        stats = service.get_quiz_statistics()
        
        # Should return formatted statistics
        assert len(stats) == 2  # Two different topic/difficulty combinations
        
        # Check that averages are calculated correctly
        python_stats = next(s for s in stats if s['topic'] == 'python')
        assert python_stats['avg_score'] == 80.0
        assert python_stats['attempts'] == 1
        
        js_stats = next(s for s in stats if s['topic'] == 'javascript')
        assert js_stats['avg_score'] == 60.0
        assert js_stats['attempts'] == 1

    def test_calculate_score_edge_cases(self):
        """Test edge cases in score calculation."""
        service = QuizService(db_client=MagicMock())
        
        # Test empty user answers for single choice
        score = service.calculate_score('single-choice', ['A'], [], 'easy')
        assert score == 0
        
        # Test empty user answers for multiple choice
        score = service.calculate_score('multiple-choice', ['A', 'B'], [], 'medium')
        assert score == 0
        
        # Test unknown question type
        score = service.calculate_score('unknown-type', ['A'], ['A'], 'easy')
        assert score == 0
        
        # Test multiple choice with all wrong answers
        score = service.calculate_score('multiple-choice', ['A', 'B'], ['C', 'D'], 'hard')
        assert score == 0  # (0 correct - 2 wrong) / 2 = negative, so minimum 0