#!/bin/bash

# Replace these variables with your GitHub username and access token
GITHUB_USERNAME="BrendaMohan"
GITHUB_ACCESS_TOKEN="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"
REPO_NAME="Frozen"
FEATURE_BRANCH="feature"

# Create a pull request
curl -X POST -H "Authorization: token $GITHUB_ACCESS_TOKEN" -d "{\"title\":\"Feature Update\", \"body\":\"Please review this feature update.\", \"head\":\"$GITHUB_USERNAME:$FEATURE_BRANCH\", \"base\":\"main\"}" "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pulls"

# Request reviewers for a pull request
function add_reviewers() {
  local pr_number=$1
  local reviewers_json=$(jq -n --argjson reviewers '["'$(IFS=, ; echo "${REVIEWERS[*]}")'"]' \
    '{reviewers: $reviewers}')
  curl -X POST -H "Authorization: token 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" -H "Content-Type: application/json" \
    -d "$reviewers_json" "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pulls/$pr_number/requested_reviewers"
}
