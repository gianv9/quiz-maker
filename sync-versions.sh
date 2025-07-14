#!/bin/bash
# sync-versions.sh - Keep all package.json files in sync

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the main version from Ionic app
MAIN_VERSION=$(node -p "require('./ionic-frontend/quiz-app/package.json').version")

echo -e "${GREEN}📦 Syncing all package.json files to version: ${MAIN_VERSION}${NC}"

# List of files to sync (relative to root)
PACKAGE_FILES=(
    "ionic-frontend/quiz-app/package.json"
    # "firebase-backend/functions/package.json"  # No package.json for Python
    # Add other package.json paths here
    # "flask-backend/package.json"
)

# Python version files to sync
PYTHON_VERSION_FILES=(
    "firebase-backend/functions/__version__.py"
    # Add other Python version files here
)

# Function to update Python version file
update_python_version() {
    local file=$1
    local version=$2
    
    if [[ -f "$file" ]]; then
        echo -e "${YELLOW}  Updating: $file${NC}"
        
        # Update Python __version__ file
        echo "__version__ = \"$version\"" > "$file"
        
        echo -e "${GREEN}  ✅ Updated $file to v$version${NC}"
    else
        echo -e "${RED}  ❌ File not found: $file${NC}"
    fi
}
update_version() {
    local file=$1
    local version=$2
    
    if [[ -f "$file" ]]; then
        echo -e "${YELLOW}  Updating: $file${NC}"
        
        # Use node to update version in package.json
        node -e "
            const fs = require('fs');
            const pkg = require('./$file');
            pkg.version = '$version';
            fs.writeFileSync('./$file', JSON.stringify(pkg, null, 2) + '\n');
        "
        
        echo -e "${GREEN}  ✅ Updated $file to v$version${NC}"
    else
        echo -e "${RED}  ❌ File not found: $file${NC}"
    fi
}

# Update all package.json files
echo -e "${YELLOW}🔄 Updating package.json files...${NC}"
for file in "${PACKAGE_FILES[@]}"; do
    update_version "$file" "$MAIN_VERSION"
done

# Update all Python version files
echo -e "${YELLOW}🐍 Updating Python version files...${NC}"
for file in "${PYTHON_VERSION_FILES[@]}"; do
    update_python_version "$file" "$MAIN_VERSION"
done

echo -e "${GREEN}✅ All package.json and Python version files synced to v${MAIN_VERSION}${NC}"
echo -e "${YELLOW}📝 Don't forget to commit these changes!${NC}"