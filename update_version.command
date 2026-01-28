#!/bin/bash
# Update ETL App from Git
# This script pulls the latest changes from the upstream repository

echo "========================================"
echo "ETL App - Git Update Script"
echo "========================================"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "Current directory: $PWD"
echo ""

# Fetch latest changes from upstream
echo "Fetching latest changes from upstream..."
if ! git fetch upstream; then
    echo ""
    echo "ERROR: Failed to fetch from upstream"
    echo "Make sure you have added the upstream remote:"
    echo "  git remote add upstream [UPSTREAM_URL]"
    read -p "Press any key to exit..."
    exit 1
fi

echo ""
echo "Checking out main branch..."
if ! git checkout main; then
    echo ""
    echo "ERROR: Failed to checkout main branch"
    read -p "Press any key to exit..."
    exit 1
fi

echo ""
echo "Rebasing with upstream/main..."
if ! git rebase upstream/main; then
    echo ""
    echo "ERROR: Rebase failed"
    echo "You may need to resolve conflicts manually"
    read -p "Press any key to exit..."
    exit 1
fi

echo ""
echo "========================================"
echo "Update completed successfully!"
echo "========================================"
echo ""

read -p "Press any key to exit..."
