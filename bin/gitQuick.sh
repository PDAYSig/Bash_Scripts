#!/usr/bin/env bash

# Quickly execute git add . + commit -m + push

# Make sure it's run inside git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
	echo "Error: Not inside git repository."
	exit 1
fi

# Make sure there is a commit message
if [ -z "$1" ]; then
	echo "Error: No commit message provided."
	exit 1
fi

echo
echo "changes:"
git status --short
echo

read -p "Commit and push? (y/n): " confirm

if [["$confirm" != "y"]]; then
	echo "Aborted"
	exit 0
fi

git add .
git commit -m "$1"
git push

echo "done. Any errors are now your fault."
