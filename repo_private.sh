#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="private-repo"

# Function to create a private repository
create_github_repository() {
    curl -X POST -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/user/repos" -d "{\"name\":\"$REPO_NAME\", \"private\": true}"
}

# Main script
create_github_repository
