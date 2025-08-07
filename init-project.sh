#!/bin/bash

# === SETTINGS ===
TEMPLATE_DIR="$HOME/repos/js-project-template"
DEST_DIR="$HOME/repos"

# === INPUT ===
read -p "Enter new project name: " PROJECT_NAME
PROJECT_PATH="$DEST_DIR/$PROJECT_NAME"

# === CREATE GITHUB REPO ===
echo "🚀 Creating GitHub repo '$PROJECT_NAME'..."
gh repo create "$PROJECT_NAME" --private --confirm

# === COPY TEMPLATE ===
echo "📁 Copying template into project folder..."
mkdir -p "$PROJECT_PATH"
cp -r "$TEMPLATE_DIR"/. "$PROJECT_PATH"

# === INIT GIT ===
cd "$PROJECT_PATH" || exit
rm -rf .git
git init
git add .
git commit -m "Initial commit from template"
git branch -M main
git remote add origin "git@github.com:seezyxd/$PROJECT_NAME.git"
git push -u origin main --force

echo "✅ Project '$PROJECT_NAME' created successfully at $PROJECT_PATH"
