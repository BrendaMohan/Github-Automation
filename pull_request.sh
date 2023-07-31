#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="private-repo"
FEATURE_BRANCH="feature"

# Create a pull request
curl -X POST -H "Authorization: token $GITHUB_ACCESS_TOKEN" -d "{\"title\":\"Feature Update\", \"body\":\"Please review this feature update.\", \"head\":\"$GITHUB_USERNAME:$FEATURE_BRANCH\", \"base\":\"main\"}" "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pulls"
