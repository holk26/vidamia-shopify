#!/bin/bash
# Helper script to push master branch
# This script is designed to be run with GitHub Actions credentials

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN is not set"
    exit 1
fi

# Configure git to use the token
git config --global url."https://x-access-token:${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"

# Fetch to ensure we're up to date
git fetch origin

# Check if master branch exists locally
if git rev-parse --verify master >/dev/null 2>&1; then
    echo "Master branch found locally"
    
    # Push master branch
    git push origin master
    
    if [ $? -eq 0 ]; then
        echo "Successfully pushed master branch to origin"
    else
        echo "Failed to push master branch"
        exit 1
    fi
else
    echo "Master branch does not exist locally"
    exit 1
fi
