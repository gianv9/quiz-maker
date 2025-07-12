# 🎯 Quiz Maker - Interactive Learning Platform

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Python-3.11-green?logo=python)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-2.3.3-lightgrey?logo=flask)](https://flask.palletsprojects.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A modern, containerized quiz platform for interactive learning experiences. Currently featuring AWS knowledge assessments with plans to expand into a multi-topic educational platform.

![AWS Quiz Demo](https://via.placeholder.com/800x400/667eea/ffffff?text=AWS+Knowledge+Quest+Demo)

## 🌟 Features
### Current Features

- ✅ Interactive Quiz Interface - Clean, responsive UI with real-time feedback
- ✅ Multiple Difficulty Levels - Easy, Medium, and Hard questions
- ✅ Multiple Selection Questions - Single-choice and multiple-choice with penalty scoring
- ✅ Topic-Based Learning - AWS Shared Responsibility, Services, Storage, Security, Well-Architected
- ✅ Progress Tracking - Detailed statistics and performance analytics
- ✅ Containerized Deployment - Full Docker support for easy deployment
- ✅ Persistent Storage - PostgreSQL database for scores and questions
- ✅ Mixed Review Mode - Random questions across all topics
- ✅ Links to Resources - External study resources displayed after questions
- ✅ Customizable Question Count - Choose 5, 10, 15, 20, or all available questions per quiz

### Work in Progress

- ⏳ Database Schema Redesign - Quiz-centric model for multi-topic support and better analytics
- ⏳ Analytics Dashboard - Metabase integration for advanced data analysis

### 🚀 Planned Features

- 🔄 Automated Analytics Setup - Script-based Metabase initialization with pre-configured dashboards and queries
- 🔄 Customizable Time Limit - Set a time limit for the quiz (default 30 minutes, max 120 minutes)
- 🔄 Quiz Progress Tracking - Keep track of the progress when taking a quiz and resume if something happens
- 🔄 Migration Strategies Support - Implement migration strategies for schema changes
- 🔄 Multi-Topic Support - Quiz system supporting mixed technology domains
- 🔄 Admin Panel - CRUD interface for managing quizzes, questions, and topics
- 🔄 Question Generator - AI-powered question generation for new topics
- 🔄 User Management - Registration, profiles, and progress tracking
- 🔄 Export/Import - Question bank management and sharing
- 🔄 Testing Suite - Comprehensive unit and integration tests
- 🔄 CI/CD Pipeline - Automated testing, building, and deployment
- 🔄 API Documentation - OpenAPI/Swagger integration
- 🔄 Cloud Deployment - Production-ready deployment guides
- 🔄 API Versioning - Versioning for API endpoints to handle changes and compatibility

## 🗺 Roadmap
### Phase 1: Core Platform (Current)

- Basic quiz functionality
- Docker containerization
- AWS topic questions
- Statistics tracking
- Multiple selection questions with penalty scoring

### Phase 2: Enhanced Architecture (Next)

- Database schema migration to quiz-centric model
- Unit testing with pytest
- Integration testing for API endpoints
- CI/CD pipeline with GitHub Actions
- Code coverage reporting

### Phase 3: Platform Expansion (Following)

- Admin panel for question management
- Multi-topic support architecture
- User authentication system
- API versioning and documentation

### Phase 4: Advanced Features (Future)

- AI-powered question generation
- Metabase analytics integration
- Cloud deployment automation
- Performance optimizations

### Phase 5: Scale & Community (Long-term)

- Community-contributed questions
- Advanced learning paths
- Integration with learning management systems
- Mobile application

## 🛠 Tech Stack

- **Backend**: Python 3.11, Flask 2.3.3
- **Database**: PostgreSQL 15
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Containerization**: Docker & Docker Compose
- **Testing**: pytest (planned), coverage.py (planned)
- **CI/CD**: GitHub Actions (planned)
- **Code Quality**: flake8, black (planned)
- **Future**: Metabase for analytics

## 📋 Prerequisites

- Docker 20.0+ 
- Docker Compose 1.25+
- 2GB RAM minimum
- Modern web browser

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/quiz-maker.git
cd quiz-maker

# Start the application
docker-compose up --build

# Access the application
open http://localhost:5000
```

## 📖 Usage

1. **Choose a Topic**: Select from AWS topics or Mixed Review
2. **Select Difficulty**: Easy (10 pts), Medium (20 pts), or Hard (30 pts)
3. **Take the Quiz**: Answer questions with instant feedback
4. **Review Results**: View explanations and study resources
5. **Track Progress**: Check statistics and performance trends

## 🏗 Architecture

```
quiz-maker/
├── app.py                 # Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile            # Container definition
├── docker-compose.yml    # Multi-container setup
├── data                  # Application Schema And Initial Data
│   ├── init.sql                    # Database initialization
│   └── *.sql    # Additional questions
├── templates/           # HTML templates
│   ├── index.html       # Main menu
│   ├── game.html        # Quiz interface
│   └── results.html     # Statistics page
└── README.md           # This file
```

### Database Schema

- **questions**: Stores quiz questions with topics, difficulty, and references
- **scores**: Tracks user performance and statistics

## 🎯 Development

### Adding New Questions

```sql
INSERT INTO questions (topic, difficulty, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, study_references) VALUES
('new-topic', 'easy', 'Your question here?',LIMIT 10 'Option A', 'Option B', 'Option C', 'Option D', 0, 'Explanation here', 'Reference 1|Reference 2');
```

### Development Commands

```bash
# View logs
docker-compose logs

# Access database
docker-compose exec db psql -U postgres -d awsgame
LIMIT 10

# Execute a single SQL Outside of the container (example, to insert more questions)
cat 02-aws_clf_c02_practice_exam_03.sql | docker-compose exec -T db psql -U postgres -d awsgame

# Execute a single SQL inside the conainer (logged in to the database)
\i /docker-entrypoint-initdb.d/02-aws_clf_c02_practice_exam_02.sql

# Rebuild after changes
docker-compose up --build

# Reset database
docker-compose down -v && docker-compose up --build

# Run tests (planned)
pytest tests/
pytest tests/ --cov=app --cov-report=html

# Code quality checks (planned)
flake8 app.py
black app.py --check
```

### Environment Variables

```bash
DB_HOST=db
DB_NAME=awsgame
DB_USER=postgres
DB_PASSWORD=password
SECRET_KEY=your-secret-key-here
```

## 📱 Mobile Development (Ionic Frontend)

### Prerequisites for Android Development

**Install Android Command-Line Tools:**
```bash
# Download official Android SDK command-line tools
cd /tmp
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip commandlinetools-linux-11076708_latest.zip

# Install in proper SDK directory structure
sudo mkdir -p /usr/lib/android-sdk/cmdline-tools/latest
sudo mv cmdline-tools/* /usr/lib/android-sdk/cmdline-tools/latest/

# Set environment variables (add to ~/.bashrc for persistence)
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
```

**Accept licenses and install required packages:**
```bash
# Accept all Android SDK licenses
/usr/lib/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses

# Install required Android packages
/usr/lib/android-sdk/cmdline-tools/latest/bin/sdkmanager \
  "platforms;android-35" \
  "build-tools;34.0.0" \
  "platform-tools"

# Set SDK location for Ionic project
echo "sdk.dir=/usr/lib/android-sdk" > ionic-frontend/quiz-app/android/local.properties
```

### Android APK Generation

**Build Android APK:**
```bash
# Navigate to Ionic project
cd ionic-frontend/quiz-app

# Add Android platform (first time only)
ionic capacitor add android

# Build for Android
ionic capacitor build android

# Generate debug APK
cd android
./gradlew assembleDebug
```

**APK Output Location:**
```
ionic-frontend/quiz-app/android/app/build/outputs/apk/debug/app-debug.apk
```

**One Liner to sync, build, and install**
```
ionic capacitor sync android && ionic capacitor sync android && cd android && ./gradlew assembleDebug && adb install app/build/outputs/apk/debug/app-debug.apk
```

### Install APK on Device

**USB Installation:**
```bash
# Enable Developer Options & USB Debugging on device
# Connect device via USB

# Install APK
adb install app/build/outputs/apk/debug/app-debug.apk

# Or copy APK to device and install manually
```

**File Transfer:**
```bash
# Copy APK to device
adb push app/build/outputs/apk/debug/app-debug.apk /sdcard/Download/

# Then install from device file manager
```

### Development Workflow

**Ionic Development:**
```bash
# Start development server
ionic serve

# Test in browser at http://localhost:8100
```

**Mobile Testing:**
```bash
# Sync changes to mobile project
ionic capacitor sync android

# Rebuild and install
ionic capacitor build android
cd android && ./gradlew assembleDebug
adb install app/build/outputs/apk/debug/app-debug.apk
```

### Troubleshooting

**Common Issues:**

1. **License not accepted:**
   ```bash
   /usr/lib/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses
   ```

2. **SDK location not found:**
   ```bash
   echo "sdk.dir=/usr/lib/android-sdk" > android/local.properties
   ```

3. **Build tools version mismatch:**
   ```bash
   # Install specific version
   /usr/lib/android-sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;34.0.0"
   ```

4. **Gradle build fails:**
   ```bash
   # Clean and rebuild
   cd android
   ./gradlew clean
   ./gradlew assembleDebug
   ```

**Environment Variables:**
```bash
# Add to ~/.bashrc for permanent setup
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## 🧪 Testing & CI/CD

### Testing Strategy (Planned)
- **Unit Tests**: pytest for testing individual functions and components
- **Integration Tests**: API endpoint testing with test database
- **Coverage Reports**: Code coverage tracking and reporting
- **Test Data**: Factory patterns for generating test questions and scores
- **Mocking**: Database and external service mocking for isolated tests

### CI/CD Pipeline (Planned)
- **GitHub Actions**: Automated workflows for testing and deployment
- **Pull Request Checks**: Automated testing on all PRs
- **Code Quality**: Linting with flake8/black, security scanning
- **Container Testing**: Docker image building and testing
- **Deployment**: Automated deployment to staging and production environments
- **Monitoring**: Health checks and performance monitoring

### Planned Testing Structure
```
tests/
├── unit/
│   ├── test_app.py
│   ├── test_database.py
│   └── test_utils.py
├── integration/
│   ├── test_api.py
│   ├── test_quiz_flow.py
│   └── test_database_integration.py
├── fixtures/
│   └── test_data.py
└── conftest.py
```

## 🚀 Deployment

This project is designed for easy deployment on various platforms:

- **Development**: Docker Compose (current setup)
- **Production**: Planned support for AWS ECS, Kubernetes, Railway, etc.
- **Analytics**: Metabase integration for advanced reporting

### 🤖📦 Android Production Builds

#### Current Status
- ✅ Development builds working (`npm run android:dev`)
- ✅ Web builds working
- ⏳ Production builds require signing configuration

#### TODO - Production Build Setup
- [ ] Configure Android keystore for production builds
- [ ] Set up signing configuration in build.gradle
- [ ] Create production build scripts
- [ ] Test production APK generation
- [ ] Document Play Store publishing process
- [ ] Set up CI/CD for automated builds (optional)

#### Production Build Options

##### Option 1: Configure Signing in build.gradle (Recommended)

1. **Generate a keystore** (one-time setup):
   ```bash
   cd android/app
   keytool -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
   ```

2. **Update `android/app/build.gradle`**:
   ```gradle
   android {
       signingConfigs {
           release {
               if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
                   storeFile file(MYAPP_RELEASE_STORE_FILE)
                   storePassword MYAPP_RELEASE_STORE_PASSWORD
                   keyAlias MYAPP_RELEASE_KEY_ALIAS
                   keyPassword MYAPP_RELEASE_KEY_PASSWORD
               }
           }
       }
       
       buildTypes {
           release {
               signingConfig signingConfigs.release
               minifyEnabled true
               // ... other release config
           }
       }
   }
   ```

3. **Create `android/gradle.properties`**:
   ```properties
   MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
   MYAPP_RELEASE_STORE_PASSWORD=your_keystore_password
   MYAPP_RELEASE_KEY_ALIAS=my-key-alias
   MYAPP_RELEASE_KEY_PASSWORD=your_key_password
   ```
   ⚠️ **Add `android/gradle.properties` to `.gitignore`**

4. **Update package.json scripts**:
   ```json
   {
     "scripts": {
       "android:prod": "npm run build && npx cap sync android && cd android && ./gradlew assembleRelease"
     }
   }
   ```

##### Option 2: Environment Variables (CI/CD Friendly)

Use environment variables in `android/gradle.properties`:
```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_STORE_PASSWORD=${env.KEYSTORE_PASSWORD}
MYAPP_RELEASE_KEY_ALIAS=${env.KEY_ALIAS}
MYAPP_RELEASE_KEY_PASSWORD=${env.KEY_PASSWORD}
```

Build with:
```bash
export KEYSTORE_PASSWORD="your_password"
export KEY_ALIAS="my-key-alias"
export KEY_PASSWORD="your_key_password"
npm run android:prod
```

##### Option 3: Android Studio GUI (Beginner Friendly)

1. **Update script to open Android Studio**:
   ```json
   {
     "scripts": {
       "android:prod": "npm run build && npx cap sync android && npx cap open android"
     }
   }
   ```

2. **In Android Studio**:
   - Build → Generate Signed Bundle/APK
   - Follow wizard to create/use keystore
   - Generate production APK/AAB

##### Option 4: Debug Build for Testing

For testing production code without signing:
```json
{
  "scripts": {
    "android:prod:debug": "npm run build && npx cap sync android && cd android && ./gradlew assembleDebug"
  }
}
```

#### Play Store Distribution

For Play Store submission, create an Android App Bundle (AAB):
```bash
npm run build && npx cap sync android && cd android && ./gradlew bundleRelease
```

**Output locations:**
- **AAB**: `android/app/build/outputs/bundle/release/`
- **APK**: `android/app/build/outputs/apk/release/`

#### Security Notes

- **Never commit** keystore files or passwords to version control
- Store keystore files securely (backup multiple copies)
- Use environment variables or secure CI/CD secrets for credentials
- Consider using Google Play App Signing for additional security

#### References

- [Capacitor Android Documentation](https://capacitorjs.com/docs/android)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)
- [Google Play App Signing](https://support.google.com/googleplay/android-developer/answer/9842756)

## 📊 Analytics & Monitoring

Future Metabase dashboard will include:
- Quiz completion rates by topic and difficulty
- Learning progress trends
- Question difficulty analysis
- User engagement metrics

## 🤝 Contributing

Contributions are welcome! This is a public repository used for:
- Learning and experimentation
- Testing deployment strategies
- Practicing SQL and data analysis
- Demonstrating containerized applications

### Development Setup

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests for new functionality (when testing is implemented)
4. Ensure all tests pass and maintain code coverage
5. Commit your changes following commit conventions
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📁 Data Management
Large Question Sets:

Store in data/seed_questions.sql for 100+ questions
Use numbered Docker entrypoint files: 01-init.sql, 02-seed.sql
Sample/development data belongs in repository
Production datasets >10MB should use external storage (S3, releases)

Repository Guidelines:

✅ Core questions defining app functionality
✅ Test/sample data for development setup
❌ User-generated content or sensitive question banks
❌ Large production datasets

### Commit Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/) with [Gitmoji](https://gitmoji.dev/):

```bash
🎉 feat: add new quiz topic
🐛 fix: resolve database connection issue
📝 docs: update API documentation
♻️ refactor: improve question loading logic
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## 📞 Support

- 📧 Email: [your-email@domain.com]
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/quiz-maker/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/quiz-maker/discussions)

## 🙏 Acknowledgments

- AWS documentation and best practices
- Flask and PostgreSQL communities
- Docker for containerization
- Open source contributors

---

## 📋 Detailed Setup Guide

<details>
<summary>Click to expand detailed installation instructions</summary>

### 1. Install Docker and Docker Compose
```bash
# Update system
sudo apt update

# Install Docker
sudo apt install docker.io docker-compose

# Add your user to docker group (to run without sudo)
sudo usermod -aG docker $USER

# Log out and back in, or run:
newgrp docker

# Verify installation
docker --version
docker-compose --version
```

### 2. Clone and Setup
```bash
# Clone repository
git clone https://github.com/yourusername/quiz-maker.git
cd quiz-maker

# Verify file structure
ls -la
```

### 3. Run Application
```bash
# Build and start containers
docker-compose up --build

# Wait for startup messages, then open browser to:
# http://localhost:5000
```

### 4. Troubleshooting

**Port already in use:**
```bash
# Change ports in docker-compose.yml
ports:
  - "5001:5000"  # Change first number
```

**Database connection issues:**
```bash
# Check containers are running
docker-compose ps

# View database logs
docker-compose logs db
```

**Permission denied errors:**
```bash
# Ensure docker group membership
sudo usermod -aG docker $USER
newgrp docker
```

### 5. Development Workflow

**Adding Questions:**
```bash
# Connect to database
docker-compose exec db psql -U postgres -d awsgame

# Insert new question
INSERT INTO questions (...) VALUES (...);

# Exit database
\q
```

**Viewing Logs:**
```bash
# All logs
docker-compose logs

# Specific service
docker-compose logs web
docker-compose logs db
```

**Database Management:**
```bash
# Reset database (removes all data)
docker-compose down -v
docker-compose up --build

# Backup database
docker-compose exec db pg_dump -U postgres awsgame > backup.sql

# Restore database
docker-compose exec -T db psql -U postgres awsgame < backup.sql
```

</details>