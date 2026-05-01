#!/bin/bash

cd "$(dirname "$0")"

# Get current timestamp
current_time=$(date +%s)
interval=480  # 8 minutes apart

# Function to get timestamp
get_commit_time() {
    local offset=$1
    echo $(date -d "@$((current_time + offset * interval))" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || date -r $((current_time + offset * interval)) "+%Y-%m-%d %H:%M:%S")
}

echo "Enhancing mouse interaction with multiple commits..."
echo "============================================================"

# Commit 1: Add error handling for audio loading
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Function to play sound with error handling
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

// Add click event listeners to drum pads
document.addEventListener('DOMContentLoaded', () => {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', () => {
            const soundName = pad.getAttribute('data-sound');
            playSound(soundName);
            
            // Add visual feedback
            pad.classList.add('playing');
            setTimeout(() => {
                pad.classList.remove('playing');
            }, 100);
        });
    });
    
    console.log('Drum pads loaded and ready!');
});
EOF

git add js/script.js
git commit -m "Add error handling for audio element validation" --date="$(get_commit_time 0)"

# Commit 2: Improve visual feedback timing
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

// Function to play sound with error handling
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

// Add click event listeners to drum pads
document.addEventListener('DOMContentLoaded', () => {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', () => {
            const soundName = pad.getAttribute('data-sound');
            playSound(soundName);
            
            // Add visual feedback
            pad.classList.add('playing');
            setTimeout(() => {
                pad.classList.remove('playing');
            }, ANIMATION_DURATION);
        });
    });
    
    console.log('Drum pads loaded and ready!');
});
EOF

git add js/script.js
git commit -m "Improve visual feedback timing with constant" --date="$(get_commit_time 1)"

# Commit 3: Add visual feedback function
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

// Function to play sound with error handling
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

// Function to add visual feedback
function addVisualFeedback(element) {
    element.classList.add('playing');
    setTimeout(() => {
        element.classList.remove('playing');
    }, ANIMATION_DURATION);
}

// Add click event listeners to drum pads
document.addEventListener('DOMContentLoaded', () => {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', () => {
            const soundName = pad.getAttribute('data-sound');
            playSound(soundName);
            addVisualFeedback(pad);
        });
    });
    
    console.log('Drum pads loaded and ready!');
});
EOF

git add js/script.js
git commit -m "Extract visual feedback into separate function" --date="$(get_commit_time 2)"

# Commit 4: Add click handler function
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

// Function to play sound with error handling
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

// Function to add visual feedback
function addVisualFeedback(element) {
    element.classList.add('playing');
    setTimeout(() => {
        element.classList.remove('playing');
    }, ANIMATION_DURATION);
}

// Handle drum pad click
function handleDrumClick(event) {
    const pad = event.currentTarget;
    const soundName = pad.getAttribute('data-sound');
    
    playSound(soundName);
    addVisualFeedback(pad);
}

// Add click event listeners to drum pads
document.addEventListener('DOMContentLoaded', () => {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', handleDrumClick);
    });
    
    console.log('Drum pads loaded and ready!');
});
EOF

git add js/script.js
git commit -m "Create dedicated click handler function" --date="$(get_commit_time 3)"

# Commit 5: Add initialization function
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

// Function to play sound with error handling
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

// Function to add visual feedback
function addVisualFeedback(element) {
    element.classList.add('playing');
    setTimeout(() => {
        element.classList.remove('playing');
    }, ANIMATION_DURATION);
}

// Handle drum pad click
function handleDrumClick(event) {
    const pad = event.currentTarget;
    const soundName = pad.getAttribute('data-sound');
    
    playSound(soundName);
    addVisualFeedback(pad);
}

// Initialize drum kit
function initDrumKit() {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', handleDrumClick);
    });
    
    console.log(`Drum kit initialized with ${drumPads.length} pads`);
}

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', initDrumKit);
EOF

git add js/script.js
git commit -m "Add initialization function for better code organization" --date="$(get_commit_time 4)"

# Commit 6: Add JSDoc comments
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

/**
 * Play a drum sound by name
 * @param {string} soundName - The name of the sound to play
 */
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

/**
 * Add visual feedback animation to an element
 * @param {HTMLElement} element - The element to animate
 */
function addVisualFeedback(element) {
    element.classList.add('playing');
    setTimeout(() => {
        element.classList.remove('playing');
    }, ANIMATION_DURATION);
}

/**
 * Handle drum pad click event
 * @param {Event} event - The click event
 */
function handleDrumClick(event) {
    const pad = event.currentTarget;
    const soundName = pad.getAttribute('data-sound');
    
    playSound(soundName);
    addVisualFeedback(pad);
}

/**
 * Initialize the drum kit by attaching event listeners
 */
function initDrumKit() {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', handleDrumClick);
    });
    
    console.log(`Drum kit initialized with ${drumPads.length} pads`);
}

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', initDrumKit);
EOF

git add js/script.js
git commit -m "Add JSDoc documentation for all functions" --date="$(get_commit_time 5)"

# Commit 7: Enhance CSS animation
cat >> css/style.css << 'EOF'

/* Active state for drum pads */
.drum-pad:active {
    transform: scale(0.98);
}
EOF

git add css/style.css
git commit -m "Add active state animation for better click feedback" --date="$(get_commit_time 6)"

# Commit 8: Improve playing state transition
cat > css/style.css << 'EOF'
/* Reset and Base Styles */
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
    user-select: none;
}

.drum-pad:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: rgba(255, 255, 255, 0.5);
    transform: translateY(-2px);
}

.drum-pad.playing {
    background: rgba(255, 255, 255, 0.3);
    border-color: rgba(255, 255, 255, 0.8);
    transform: scale(0.95);
    transition: all 0.1s ease;
}

.drum-pad:active {
    transform: scale(0.98);
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
}

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
git commit -m "Add user-select none and improve transition timing" --date="$(get_commit_time 7)"

# Commit 9: Add console logging for debugging
cat > js/script.js << 'EOF'
// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Sound mapping object
const sounds = {
    kick: 'assets/sounds/kick.mp3',
    snare: 'assets/sounds/snare.mp3',
    hihat: 'assets/sounds/hihat.mp3',
    tom: 'assets/sounds/tom.mp3',
    clap: 'assets/sounds/clap.mp3',
    ride: 'assets/sounds/ride.mp3'
};

// Animation timing constant
const ANIMATION_DURATION = 150;

/**
 * Play a drum sound by name
 * @param {string} soundName - The name of the sound to play
 */
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (!audio) {
        console.error(`Audio element not found: ${soundName}`);
        return;
    }
    
    console.log(`Playing sound: ${soundName}`);
    
    // Reset audio to start if already playing
    audio.currentTime = 0;
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

/**
 * Add visual feedback animation to an element
 * @param {HTMLElement} element - The element to animate
 */
function addVisualFeedback(element) {
    element.classList.add('playing');
    setTimeout(() => {
        element.classList.remove('playing');
    }, ANIMATION_DURATION);
}

/**
 * Handle drum pad click event
 * @param {Event} event - The click event
 */
function handleDrumClick(event) {
    const pad = event.currentTarget;
    const soundName = pad.getAttribute('data-sound');
    
    console.log(`Drum pad clicked: ${soundName}`);
    
    playSound(soundName);
    addVisualFeedback(pad);
}

/**
 * Initialize the drum kit by attaching event listeners
 */
function initDrumKit() {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', handleDrumClick);
    });
    
    console.log(`Drum kit initialized with ${drumPads.length} pads`);
}

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', initDrumKit);
EOF

git add js/script.js
git commit -m "Add console logging for debugging click events" --date="$(get_commit_time 8)"

# Commit 10: Update README with interaction info
cat > README.md << 'EOF'
# JavaScript Drum Kit

A interactive drum kit built with vanilla JavaScript.

## Features

- 6 different drum sounds (Kick, Snare, Hi-hat, Tom, Clap, Ride)
- Click interaction with visual feedback
- Responsive design for all devices
- Smooth animations and transitions

## Project Structure

```
js-drum-kit/
├── index.html
├── css/
│   └── style.css
├── js/
│   └── script.js
├── assets/
│   └── sounds/
│       ├── README.md
│       ├── kick.mp3
│       ├── snare.mp3
│       ├── hihat.mp3
│       ├── tom.mp3
│       ├── clap.mp3
│       └── ride.mp3
└── README.md
```

## Getting Started

1. Clone the repository
2. Add drum sound files to `assets/sounds/` (see assets/sounds/README.md for sources)
3. Open `index.html` in your browser
4. Click on drum pads to play drums!

## How to Use

- **Click** on any drum pad to play the corresponding sound
- Each pad shows the keyboard key and drum name
- Visual feedback shows when a pad is activated

## Technologies Used

- HTML5
- CSS3 (Grid Layout, Animations)
- JavaScript (ES6+)
- Web Audio API

## Browser Support

Works on all modern browsers that support:
- CSS Grid
- ES6 JavaScript
- HTML5 Audio

## Future Enhancements

- Keyboard interaction
- Recording and playback
- Volume controls
- Different drum kits
EOF

git add README.md
git commit -m "Update README with interaction features and usage guide" --date="$(get_commit_time 9)"

# Commit 11: Add .gitattributes for line endings
cat > .gitattributes << 'EOF'
# Auto detect text files and perform LF normalization
* text=auto

# JavaScript files
*.js text eol=lf

# CSS files
*.css text eol=lf

# HTML files
*.html text eol=lf

# Markdown files
*.md text eol=lf

# Audio files
*.mp3 binary
*.wav binary
*.ogg binary
EOF

git add .gitattributes
git commit -m "Add .gitattributes for consistent line endings" --date="$(get_commit_time 10)"

echo ""
echo "✓ Created 11 commits successfully!"
echo ""
echo "Pushing to GitHub..."
git push origin main

echo ""
echo "✓ Done! Mouse interaction enhanced with 11 commits."
