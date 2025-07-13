# Testing Guide for Quiz Maker Backend

## Quick Start

```bash
# Run all tests
python -m pytest tests/ -v

# Run with coverage
python -m pytest tests/ --cov=app --cov=main --cov-report=html

# Use the convenient test runner
python run_tests.py --coverage

# Run end-to-end tests with Firebase emulator
python run_tests.py --e2e

# Run everything (unit tests + e2e tests)
python run_tests.py --all
```

## Test Structure

```
tests/
├── conftest.py           # Test configuration and fixtures
├── test_basic.py         # Basic setup tests
├── test_services.py      # Business logic tests (QuizService)
├── test_routes.py        # API endpoint tests
└── run_tests.py          # Test runner with emulator support
```

## What's Being Tested

### Business Logic (`test_services.py`)
- ✅ Quiz scoring calculations (single/multiple choice)
- ✅ Different difficulty point values (easy=10, medium=20, hard=30)
- ✅ Partial credit for multiple choice questions
- ✅ Database operations (getting topics, questions, saving scores)

### API Endpoints (`test_routes.py`)
- ✅ `GET /` - Getting available topics
- ✅ `GET /questions/<topic>/<difficulty>` - Getting questions
- ✅ `POST /submit-score` - Submitting quiz scores
- ✅ `GET /results` - Getting quiz statistics
- ✅ Error handling for all endpoints

### End-to-End Testing (`--e2e`)
- ✅ Firebase emulator integration
- ✅ Real HTTP endpoint testing
- ✅ Actual database responses
- ✅ Full request/response cycle

### Infrastructure (`test_basic.py`)
- ✅ App factory pattern works
- ✅ Dependency injection works
- ✅ Mock services work
- ✅ Test fixtures are available

## Running Tests

### All Unit Tests
```bash
python -m pytest tests/ -v
```

### With Coverage Report
```bash
python -m pytest tests/ --cov=app --cov=main --cov-report=html --cov-report=term-missing
```

### Specific Test Files
```bash
# Only business logic tests
python -m pytest tests/test_services.py -v

# Only API tests
python -m pytest tests/test_routes.py -v
```

### Using the Test Runner
```bash
python run_tests.py              # All unit tests with basic coverage
python run_tests.py --fast       # Fast tests without coverage
python run_tests.py --coverage   # Detailed coverage with HTML
python run_tests.py --unit       # Only unit tests
python run_tests.py --routes     # Only route tests
python run_tests.py --e2e        # End-to-end tests with emulator
python run_tests.py --all        # Unit tests + e2e tests
```

## End-to-End Testing

The `--e2e` option runs comprehensive tests against a real Firebase emulator:

1. **Starts Firebase Functions emulator**
2. **Tests all API endpoints with real HTTP requests**
3. **Verifies actual responses from your database**
4. **Automatically stops the emulator when done**

```bash
# Run end-to-end tests
python run_tests.py --e2e

# Example output:
# 🎯 Running End-to-End Tests
# ✅ Firebase project: quiz-maker-12470  
# 🚀 Starting Firebase emulator...
# ✅ Emulator is ready!
# 📡 Testing: Get Topics
#    ✅ Get Topics: Success
#    📄 Response: ["python", "javascript", "aws"]...
# 🎯 Results: 4/4 tests passed
# 🎉 All end-to-end tests passed!
```

## Coverage Reports

After running tests with coverage, open `htmlcov/index.html` in your browser to see:
- Line-by-line coverage
- Which parts of your code aren't tested
- Overall coverage percentage

## Adding New Tests

### For New Business Logic
Add tests to `tests/test_services.py`:

```python
def test_new_feature(self):
    """Test description."""
    service = QuizService(db_client=MagicMock())
    result = service.new_method()
    assert result == expected_value
```

### For New API Endpoints
Add tests to `tests/test_routes.py`:

```python
def test_new_endpoint(self, client, app):
    """Test new endpoint."""
    app.mock_quiz_service.new_method.return_value = mock_data
    response = client.get('/new-endpoint')
    assert response.status_code == 200
```

## Continuous Integration

The project includes GitHub Actions configuration in `.github/workflows/test.yml` that:
- Runs tests on Python 3.9, 3.11, and 3.12
- Requires 80% code coverage
- Runs on every push and pull request

## Testing Workflow

### Before Committing
```bash
# Run the full test suite
python run_tests.py --all
```

### Quick Development Testing
```bash
# Fast unit tests while developing
python run_tests.py --fast
```

### Before Deployment
```bash
# Full coverage + end-to-end verification
python run_tests.py --coverage
python run_tests.py --e2e
```

## Best Practices

1. **Run tests before committing**: `python run_tests.py --all`
2. **Aim for 80%+ coverage**: Check with `python run_tests.py --coverage`
3. **Test both success and failure cases**: Include error scenarios
4. **Keep tests simple**: One test should test one thing
5. **Use descriptive test names**: Anyone should understand what's being tested
6. **Run e2e tests before deployment**: Ensure everything works end-to-end

## Troubleshooting

### Firebase Initialization Errors
- Tests use mocked Firebase services
- Real Firebase is never contacted during testing
- If you see Firebase errors, check that `TESTING=true` is set

### Import Errors
- Make sure you're running from the `functions/` directory
- Ensure all `__init__.py` files exist
- Try: `export PYTHONPATH=.` before running tests

### Coverage Too Low
- Run `python run_tests.py --coverage`
- Open `htmlcov/index.html` to see what's not covered
- Add tests for uncovered code paths

### Emulator Issues
- Make sure Firebase CLI is installed: `npm install -g firebase-tools`
- Check that you're in a Firebase project directory
- Emulator timeouts are normal and don't indicate test failures
- Use `python run_tests.py --unit` for faster testing during development