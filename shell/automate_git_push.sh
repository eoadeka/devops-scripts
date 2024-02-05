#!/bin/bash

git_file=.git

# Function to add, commit, and push changes to github
git_cmd () {
	local commit_message="$1"
	local branch="$2"

	if [ ! -e "$git_file" ]; then
		echo "$git_file does not exists"
	fi

	# Add changes to repo
	git add .

	# Commit added changes
	git commit -m "$commit_message"

	# Push changes to remote repository
	git push origin "$branch" # on first commit, ask for branch name and store in file. on subsequent commits, ask to use branch name in file or create new branch
}

read -p "Enter the commit message: " commit_message
read -p "Enter the branch name: " branch

git_cmd "$commit_message" "branch"
echo "$branch"