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
