#!/bin/bash

git init

git config user.name "Nevil"
git config user.email "nevilitaliya00@gmail.com"

commit_date="2024-01-01T09:00:00"

declare -a commits=(
    "Initialize project structure:."
    "Add initial HTML/CSS structure:public/"
    "Set up base React components:src/components/"
    "Add login and authentication logic:src/pages/login/"
    "Implement dashboard view:src/pages/dashboard/"
    "Add API integration:src/api/"
    "Refactor utility functions:src/utils/"
    "Improve styling with responsive design:src/styles/"
    "Optimize performance and lazy load components:src/components/"
    "Update README and documentation:README.md"
)

for entry in "${commits[@]}"; do
    IFS=":" read -r message path <<< "$entry"

    if [[ ! -e "$path" ]]; then
      mkdir -p "$path"
      if [[ "$path" == *"/"* ]]; then
        echo "// dummy file for $message" > "$path/dummy.txt"
      else
        echo "// dummy file for $message" > "$path"
      fi
    fi

    git add "$path"
    GIT_COMMITTER_DATE="$commit_date" git commit -m "$message" --date="$commit_date"
    echo "Committed: $message at $commit_date"

    commit_date=$(date -d "$commit_date + 1 day" "+%Y-%m-%dT%H:%M:%S")
done

echo "🎉 Finished creating a realistic commit history!"
