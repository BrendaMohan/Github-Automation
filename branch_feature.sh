#!/bin/bash

GITHUB_USERNAME="BrendaMohan"
GITHUB_TOKEN="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"
REPO_OWNER="BrendaMohan"
REPO_NAME="AODevSecOps.CYA.CYA-Brenda"
MAIN_BRANCH="main"
FEATURE_BRANCH="feature"


# API endpoint for creating a new branch
create_branch_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/git/refs"

# API endpoint for creating a new file
create_file_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/dummy_file.txt"

# API endpoint for creating a pull request
create_pr_url="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls"

# Step 1: Create the feature branch
echo "Creating feature branch..."
branch_data="{\"ref\":\"refs/heads/$FEATURE_BRANCH\",\"sha\":\"$(curl -s -u $GITHUB_USERNAME:$GITHUB_TOKEN https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/git/ref/heads/$MAIN_BRANCH | jq -r '.object.sha')\"}"
curl -X POST -u $GITHUB_USERNAME:$GITHUB_TOKEN $create_branch_url -d "$branch_data"

# Step 2: Add a dummy file to the feature branch
echo "Adding a dummy file..."
file_data="{\"message\":\"Add dummy file\",\"content\":\"$(echo "This is a dummy file." | base64)\",\"branch\":\"$FEATURE_BRANCH\"}"
curl -X PUT -u $GITHUB_USERNAME:$GITHUB_TOKEN $create_file_url -d "$file_data"

# Step 3: Raise a pull request
echo "Creating a pull request..."
pr_data="{\"title\":\"Feature: Add a dummy file\",\"head\":\"$FEATURE_BRANCH\",\"base\":\"$MAIN_BRANCH\",\"body\":\"This is a pull request for adding a dummy file to the feature branch.\"}"
curl -X POST -u $GITHUB_USERNAME:$GITHUB_TOKEN $create_pr_url -d "$pr_data"

echo "End-to-end automation completed!"


# Clone the repository locally using the GitHub API
#git clone "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
#git remote set-url origin git@github.com:{BrendaMohan}/{private-repo}.git
#git remote add origin git@github.com:BrendaMohan/private-repo.git
#git clone git@github.com:BrendaMohan/private-repo.gi
#cd "$REPO_NAME"

# Set the Git configuration to use the provided access token
#git config user.name "$GITHUB_USERNAME"
#git config user.email "mohanbrenda@gmail.com"
#git config credential.helper store
#git config credential.helper 'cache --timeout=3600'

# Create a new feature branch from the main branch
#FEATURE_BRANCH="feature"
#git checkout -b "$FEATURE_BRANCH"

# Make changes to the file and commit to the feature branch
#echo "Feature update" >> hello.txt
#git add hello.txt
#git commit -m "Feature update"
#git push origin "$FEATURE_BRANCH"
