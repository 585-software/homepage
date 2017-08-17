#!/usr/bin/env bash
set -e

echo 'Deploying updates to GitHub.'

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

(
  # Go To Public folder
  cd public || exit
  # Add changes to git.
  git add .

  # Commit changes.
  msg="rebuilding site $(date)"
  if [ $# -eq 1 ]
    then msg="$1"
  fi
  git commit -m "$msg"

  # Push source and build repos.
  git push origin master
)
