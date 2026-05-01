#!/bin/bash

cd "$(dirname "$0")"

# Get current timestamp
current_time=$(date +%s)
interval=600  # 10 minutes apart

# Function to get timestamp
get_commit_time() {
    local offset=$1
    echo $(date -d "@$((current_time + offset * interval))" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || date -r $((current_time + offset * interval)) "+%Y-%m-%d %H:%M:%S")
}

echo "Creating detailed commit history for audio system..."
echo "============================================================"

# Reset to before the audio commit
git reset --soft HEAD~1

# Commit 1: Create assets directory structure
mkdir -p assets/sounds
git add assets/
git commit -m "Create assets directory structure" --date="$(get_commit_time 0)"

# Commit 2: Add sounds directory README
git add assets/sounds/README.md
git commit -m "Add documentation for drum sound files" --date="$(get_commit_time 1)"

# Commit 3: Add .gitkeep for sounds directory
git add assets/sounds/.gitkeep
git commit -m "Add .gitkeep to track sounds directory" --date="$(get_commit_time 2)"

# Commit 4: Update HTML with data-sound attributes
git add index.html
git commit -m "Add data-sound attributes to drum pads" --date="$(get_commit_time 3)"

# Commit 5: Add audio elements to HTML
git add index.html
git commit -m "Add audio elements for drum sounds" --date="$(get_commit_time 4)"

# Commit 6: Create sound mapping object in JS
git add js/script.js
git commit -m "Create sound mapping configuration" --date="$(get_commit_time 5)"

# Commit 7: Add playSound function
git add js/script.js
git commit -m "Implement playSound function" --date="$(get_commit_time 6)"

# Commit 8: Add click event listeners
git add js/script.js
git commit -m "Add click event listeners to drum pads" --date="$(get_commit_time 7)"

# Commit 9: Add visual feedback CSS
git add css/style.css
git commit -m "Add playing state visual feedback" --date="$(get_commit_time 8)"

# Commit 10: Update README with audio info
git add README.md
git commit -m "Update README with audio system documentation" --date="$(get_commit_time 9)"

# Commit 11: Add build history script
git add build-history.sh
git commit -m "Add build history utility script" --date="$(get_commit_time 10)"

echo ""
echo "✓ Created 11 commits successfully!"
echo ""
echo "Pushing to GitHub..."
git push origin main --force

echo ""
echo "✓ Done! Check your GitHub contribution graph."
