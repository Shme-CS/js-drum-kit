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

// Keyboard to sound mapping
const keyMap = {
    'a': 'kick',
    's': 'snare',
    'd': 'hihat',
    'f': 'tom',
    'g': 'clap',
    'h': 'ride'
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

/**
 * Handle keyboard press event
 * @param {KeyboardEvent} event - The keyboard event
 */
function handleKeyPress(event) {
    // Ignore if user is typing in an input field
    if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
        return;
    }
    
    // Prevent default behavior for mapped keys
    const key = event.key.toLowerCase();
    const soundName = keyMap[key];
    
    if (soundName) {
        event.preventDefault();
        console.log(`Key pressed: ${key}`);
        const pad = document.querySelector(`[data-key="${key}"]`);
        if (pad) {
            playSound(soundName);
            addVisualFeedback(pad);
        }
    }
}

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', initDrumKit);

// Listen for keyboard events
document.addEventListener('keydown', handleKeyPress);
