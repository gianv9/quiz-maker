#!/bin/bash
# release.sh - Automated git flow release with version management

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check if version argument provided
if [ -z "$1" ]; then
    echo -e "${RED}❌ Usage: ./release.sh <version>${NC}"
    echo -e "${YELLOW}   Example: ./release.sh 1.1.0${NC}"
    exit 1
fi

NEW_VERSION=$1

echo -e "${GREEN}🚀 Starting release process for v${NEW_VERSION}${NC}"

# Ensure we're on develop and up to date
echo -e "${YELLOW}📥 Checking out develop branch...${NC}"
git checkout develop
git pull origin develop

# Start git flow release
echo -e "${YELLOW}🌿 Starting git flow release...${NC}"
git flow release start "$NEW_VERSION"

# Update main Ionic package.json
echo -e "${YELLOW}📝 Updating Ionic package.json version...${NC}"
cd ionic-frontend/quiz-app
npm version "$NEW_VERSION" --no-git-tag-version
cd ../..

# Sync other package.json files if sync script exists
if [ -f "./sync-versions.sh" ]; then
    echo -e "${YELLOW}🔄 Syncing all package.json files...${NC}"
    chmod +x ./sync-versions.sh
    ./sync-versions.sh
else
    echo -e "${YELLOW}ℹ️  Manual sync needed for other package.json files${NC}"
fi

# Build and test the release
echo -e "${YELLOW}🔨 Testing release build...${NC}"
cd ionic-frontend/quiz-app
npm run build
echo -e "${GREEN}✅ Build successful${NC}"
echo -e "${YELLOW}ℹ️ Add More Tests here! <----- Important/Pending ⚠️ ${NC}"
cd ../..

# Stage and commit version changes
echo -e "${YELLOW}📝 Committing version changes...${NC}"
git add .
git commit -m "🔖 bump version to ${NEW_VERSION}"

# Ask for confirmation before finishing release
echo -e "${YELLOW}❓ Ready to finish release and create tag v${NEW_VERSION}? (y/N)${NC}"
read -r confirmation

if [[ $confirmation =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}🏁 Finishing git flow release...${NC}"
    git flow release finish "$NEW_VERSION"
    
    echo -e "${YELLOW}📤 Pushing changes and tags...${NC}"
    git push origin main
    git push origin develop
    git push origin --tags
    
    echo -e "${GREEN}🎉 Release v${NEW_VERSION} completed successfully!${NC}"
    echo -e "${YELLOW}📦 GitHub Actions will automatically create the release with APK${NC}"
    echo -e "${YELLOW}🔗 Check: https://github.com/$(git remote get-url origin | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/actions${NC}"
else
    echo -e "${RED}❌ Release cancelled. You're still on release/${NEW_VERSION} branch${NC}"
    echo -e "${YELLOW}ℹ️  To resume: git flow release finish ${NEW_VERSION}${NC}"
fi