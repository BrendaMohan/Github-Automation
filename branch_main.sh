#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="private_repo"

# Clone the repository locally using the GitHub API
git clone "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
cd "$REPO_NAME"

# Set the Git configuration to use the provided access token
git config user.name "$GITHUB_USERNAME"
git config user.email "mohanbrenda@gmail.com"
git config credential.helper store
git config credential.helper 'cache --timeout=3600'

# Create a new file and commit it to the main branch
echo "Hello World" > hello.txt
git add hello.txt
git commit -m "Initial commit"
git push origin main
