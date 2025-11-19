#!/bin/bash

# Script to push the master branch to GitHub
# This script should be run with appropriate GitHub credentials

set -e

echo "======================================"
echo "Push Master Branch to GitHub"
echo "======================================"
echo ""

# Check if master branch exists
if ! git rev-parse --verify master >/dev/null 2>&1; then
    echo "Error: Master branch does not exist locally."
    echo "Please ensure the master branch has been created first."
    exit 1
fi

# Get the current branch
current_branch=$(git branch --show-current)

# Show master branch information
echo "Master branch information:"
echo "-------------------------"
git log master --oneline -3
echo ""

# Ask for confirmation
read -p "Do you want to push the master branch to origin? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Push cancelled."
    exit 0
fi

# Push the master branch
echo ""
echo "Pushing master branch to origin..."
git push -u origin master

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Master branch successfully pushed to GitHub!"
    echo ""
    echo "You can now view it at:"
    echo "https://github.com/holk26/vidamia-shopify/tree/master"
    echo ""
    
    # Return to original branch if different
    if [ "$current_branch" != "master" ]; then
        echo "Returning to branch: $current_branch"
        git checkout "$current_branch"
    fi
else
    echo ""
    echo "✗ Failed to push master branch."
    echo "Please check your GitHub authentication and try again."
    exit 1
fi
