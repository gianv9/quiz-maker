# AWS Learning Game - Setup Guide

## Quick Start (5 minutes)

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

### 2. Create the project structure
```bash
# Create project directory
mkdir aws-game && cd aws-game

# Create templates directory
mkdir templates
```

### 3. Create the files

Copy the code from the artifacts above into these files:

```bash
# Main application
nano app.py              # Copy Python code
nano requirements.txt    # Copy requirements
nano Dockerfile          # Copy Dockerfile  
nano docker-compose.yml  # Copy docker-compose
nano init.sql           # Copy SQL initialization

# Templates
nano templates/index.html    # Copy index template
nano templates/game.html     # Copy game template  
nano templates/results.html  # Copy results template
```

### 4. Run the application
```bash
# Build and start the containers
docker-compose up --build

# Wait for startup messages, then open browser to:
# http://localhost:5000
```

## File Structure
```
aws-game/
├── app.py                 # Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile            # Container definition
├── docker-compose.yml    # Multi-container setup
├── init.sql             # Database initialization
└── templates/
    ├── index.html       # Main menu
    ├── game.html        # Quiz interface
    └── results.html     # Statistics page
```

## How it works

### Architecture
- **Flask Web App**: Serves HTML and provides REST API
- **PostgreSQL Database**: Stores questions, answers, and user scores
- **Docker Compose**: Orchestrates both containers with networking

### Database Schema
- `questions` table: Stores quiz questions with topics/difficulty
- `scores` table: Tracks user performance and statistics

### Key Features
- ✅ **Portable**: Runs anywhere with Docker
- ✅ **Simple**: Minimal code, easy to modify
- ✅ **Persistent**: Scores saved in PostgreSQL
- ✅ **Scalable**: Easy to add new questions/topics

## Adding Questions

Add questions directly to the database:
```sql
INSERT INTO questions (topic, difficulty, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, references) VALUES
('new-topic', 'easy', 'Your question here?', 'Option A', 'Option B', 'Option C', 'Option D', 0, 'Explanation here', 'Reference 1|Reference 2');
```

## Development Commands

```bash
# View logs
docker-compose logs

# Stop containers
docker-compose down

# Rebuild after code changes
docker-compose up --build

# Access database directly
docker-compose exec db psql -U postgres -d awsgame

# Reset database
docker-compose down -v && docker-compose up --build
```

## Customization

### Add new topics:
1. Insert questions in `init.sql` with new topic name
2. Questions appear automatically in the UI

### Change styling:
- Edit CSS in the HTML templates
- All styling is inline for simplicity

### Modify scoring:
- Edit the scoring logic in `app.py` (search for "getDifficultyMultiplier")

## Troubleshooting

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

Your AWS learning game will be running at `http://localhost:5000` with full PostgreSQL persistence!