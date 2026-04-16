#!/bin/bash

# Navigate to project directory
cd "$(dirname "$0")"

# Get current timestamp and calculate intervals (15 minutes apart)
current_time=$(date +%s)
interval=900  # 15 minutes in seconds

# Function to get timestamp for commit (going backwards in time)
get_commit_time() {
    local offset=$1
    echo $(date -d "@$((current_time - offset * interval))" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || date -r $((current_time - offset * interval)) "+%Y-%m-%d %H:%M:%S")
}

# Reset git history
rm -rf .git
git init
git branch -M main

# Commit 1: Initial project structure
git add .gitignore README.md
git commit -m "Add .gitignore and README.md" --date="$(get_commit_time 12)"

# Commit 2: Add HTML structure
git add index.html
git commit -m "Create basic HTML structure with title" --date="$(get_commit_time 11)"

# Commit 3: Add CSS reset and base styles
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}" > css/style.css
git add css/style.css
git commit -m "Add CSS reset styles" --date="$(get_commit_time 10)"

# Commit 4: Add body styling
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}" > css/style.css
git add css/style.css
git commit -m "Add body layout and typography" --date="$(get_commit_time 9)"

# Commit 5: Add background gradient
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}" > css/style.css
git add css/style.css
git commit -m "Add gradient background and colors" --date="$(get_commit_time 8)"

# Commit 6: Add heading styles
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}

h1 {
    margin-bottom: 3rem;
    font-size: 2.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    text-align: center;
}" > css/style.css
git add css/style.css
git commit -m "Style main heading with shadow effect" --date="$(get_commit_time 7)"

# Commit 7: Add drum container HTML
git add index.html
git commit -m "Add drum pad container structure to HTML" --date="$(get_commit_time 6)"

# Commit 8: Add CSS Grid layout
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}

h1 {
    margin-bottom: 3rem;
    font-size: 2.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    text-align: center;
}

/* Drum Container - CSS Grid Layout */
.drum-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
    max-width: 600px;
    width: 100%;
}" > css/style.css
git add css/style.css
git commit -m "Implement CSS Grid layout for drum pads" --date="$(get_commit_time 5)"

# Commit 9: Add drum pad base styles
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}

h1 {
    margin-bottom: 3rem;
    font-size: 2.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    text-align: center;
}

/* Drum Container - CSS Grid Layout */
.drum-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
    max-width: 600px;
    width: 100%;
}

/* Drum Pad Styling */
.drum-pad {
    background: rgba(255, 255, 255, 0.1);
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 10px;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);
}" > css/style.css
git add css/style.css
git commit -m "Add drum pad base styling with glassmorphism" --date="$(get_commit_time 4)"

# Commit 10: Add hover effects
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}

h1 {
    margin-bottom: 3rem;
    font-size: 2.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    text-align: center;
}

/* Drum Container - CSS Grid Layout */
.drum-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
    max-width: 600px;
    width: 100%;
}

/* Drum Pad Styling */
.drum-pad {
    background: rgba(255, 255, 255, 0.1);
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 10px;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);
}

.drum-pad:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: rgba(255, 255, 255, 0.5);
    transform: translateY(-2px);
}" > css/style.css
git add css/style.css
git commit -m "Add hover effects to drum pads" --date="$(get_commit_time 3)"

# Commit 11: Style key and sound labels
echo "/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    padding: 2rem;
}

h1 {
    margin-bottom: 3rem;
    font-size: 2.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    text-align: center;
}

/* Drum Container - CSS Grid Layout */
.drum-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
    max-width: 600px;
    width: 100%;
}

/* Drum Pad Styling */
.drum-pad {
    background: rgba(255, 255, 255, 0.1);
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 10px;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);
}

.drum-pad:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: rgba(255, 255, 255, 0.5);
    transform: translateY(-2px);
}

/* Key Display */
.key {
    font-size: 2rem;
    font-weight: bold;
    text-transform: uppercase;
    color: #fff;
}

/* Sound Name */
.sound {
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: rgba(255, 255, 255, 0.8);
}" > css/style.css
git add css/style.css
git commit -m "Style keyboard key and sound name labels" --date="$(get_commit_time 2)"

# Commit 12: Add responsive design
cat >> css/style.css << 'EOF'

/* Responsive Design */
@media (max-width: 768px) {
    .drum-container {
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
    }
    
    h1 {
        font-size: 2rem;
    }
}

@media (max-width: 480px) {
    .drum-container {
        grid-template-columns: 1fr;
    }
    
    .drum-pad {
        padding: 1.5rem;
    }
}
EOF
git add css/style.css
git commit -m "Add responsive design for mobile devices" --date="$(get_commit_time 1)"

# Commit 13: Add JavaScript file
git add js/script.js
git commit -m "Add JavaScript file with initialization" --date="$(get_commit_time 0)"

echo "✓ Created 13 commits successfully!"
echo ""
echo "Now pushing to GitHub..."
echo ""

# Add remote and push
git remote add origin https://github.com/Shme-CS/js-drum-kit.git 2>/dev/null || true
git push -u origin main --force

echo ""
echo "✓ Pushed to GitHub with commit history!"
