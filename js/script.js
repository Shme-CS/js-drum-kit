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

// Function to play sound
function playSound(soundName) {
    const audio = document.getElementById(soundName);
    
    if (audio) {
        // Reset audio to start if already playing
        audio.currentTime = 0;
        audio.play().catch(error => {
            console.error(`Error playing ${soundName}:`, error);
        });
    }
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
