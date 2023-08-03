#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="Frozen"

# Function to check if the repository exists
check_repo_existence() {
    repo_url="https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME"
    response=$(curl -s -H "Authorization: token $GITHUB_ACCESS_TOKEN" "$repo_url")
    if [[ "$response" == *"Not Found"* ]]; then
        return 1  # Repository does not exist
    else
        return 0  # Repository exists
    fi
}

# Function to create a private repository
create_github_repository() {
    curl -X POST -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/user/repos" -d "{\"name\":\"$REPO_NAME\", \"private\": true, \"auto_init\": true }"
}

# Main script
check_repo_existence
if [ $? -eq 1 ]; then
    echo "Repository does not exist. Creating the repository..."
    create_github_repository
    echo "Repository created successfully!"
else
    echo "Repository already exists. Skipping repository creation."
fi
