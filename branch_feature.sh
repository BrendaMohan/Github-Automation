#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="private-repo"

# Clone the repository locally using the GitHub API
#git clone "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git remote set-url origin git@github.com:{BrendaMohan}/{private-repo}.git
cd "$REPO_NAME"

# Set the Git configuration to use the provided access token
git config user.name "$GITHUB_USERNAME"
git config user.email "mohanbrenda@gmail.com"
git config credential.helper store
git config credential.helper 'cache --timeout=3600'

# Create a new feature branch from the main branch
FEATURE_BRANCH="feature"
git checkout -b "$FEATURE_BRANCH"

# Make changes to the file and commit to the feature branch
echo "Feature update" >> hello.txt
git add hello.txt
git commit -m "Feature update"
git push origin "$FEATURE_BRANCH"
