// JavaScript Drum Kit - Audio System
console.log('Drum Kit initialized');

// Global volume control
let masterVolume = 0.8;

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

/* Animation timing constant */
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
    
    // Apply master volume
    audio.volume = masterVolume;
    
    
    // Record if recording is active
    recordBeat(soundName);
    audio.play().catch(error => {
        console.error(`Error playing ${soundName}:`, error);
    });
}

/**
 * Add visual feedback animation to an element
 * @param {HTMLElement} element - The element to animate
 */
function addVisualFeedback(element) {
    // Remove existing class if present
    element.classList.remove('playing');
    
    // Force reflow to restart animation
    void element.offsetWidth;
    
    // Add playing class
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
 * Handle keyboard press event
 * @param {KeyboardEvent} event - The keyboard event
 */
function handleKeyPress(event) {
    // Ignore if user is typing in an input field
    if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
        return;
    }
    
    // Ignore repeated keydown events
    if (event.repeat) {
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

/**
 * Initialize the drum kit by attaching event listeners
 */
function initDrumKit() {
    const drumPads = document.querySelectorAll('.drum-pad');
    
    drumPads.forEach(pad => {
        pad.addEventListener('click', handleDrumClick);
    });
    
    console.log(`Drum kit initialized with ${drumPads.length} pads`);
    initVolumeControl();
    initSoundPackSelector();
    initRecordingControls();
}

// Wait for DOM to load
document.addEventListener('DOMContentLoaded', initDrumKit);

// Listen for keyboard events
document.addEventListener('keydown', handleKeyPress);

/**
 * Initialize volume control
 */
function initVolumeControl() {
    const volumeSlider = document.getElementById('volume-slider');
    const volumeValue = document.getElementById('volume-value');
    
    if (volumeSlider && volumeValue) {
        volumeSlider.addEventListener('input', (e) => {
            const volume = e.target.value;
            masterVolume = volume / 100;
            volumeValue.textContent = `${volume}%`;
            console.log(`Volume set to: ${volume}%`);
        });
    }
}

/**
 * Sound pack configurations
 */
const soundPacks = {
    classic: {
        kick: 'assets/sounds/kick.mp3',
        snare: 'assets/sounds/snare.mp3',
        hihat: 'assets/sounds/hihat.mp3',
        tom: 'assets/sounds/tom.mp3',
        clap: 'assets/sounds/clap.mp3',
        ride: 'assets/sounds/ride.mp3'
    },
    electronic: {
        kick: 'assets/sounds/electronic/kick.mp3',
        snare: 'assets/sounds/electronic/snare.mp3',
        hihat: 'assets/sounds/electronic/hihat.mp3',
        tom: 'assets/sounds/electronic/tom.mp3',
        clap: 'assets/sounds/electronic/clap.mp3',
        ride: 'assets/sounds/electronic/ride.mp3'
    },
    acoustic: {
        kick: 'assets/sounds/acoustic/kick.mp3',
        snare: 'assets/sounds/acoustic/snare.mp3',
        hihat: 'assets/sounds/acoustic/hihat.mp3',
        tom: 'assets/sounds/acoustic/tom.mp3',
        clap: 'assets/sounds/acoustic/clap.mp3',
        ride: 'assets/sounds/acoustic/ride.mp3'
    }
};

let currentSoundPack = 'classic';

/**
 * Switch sound pack
 * @param {string} packName - Name of the sound pack
 */
function switchSoundPack(packName) {
    if (!soundPacks[packName]) {
        console.error(`Sound pack not found: ${packName}`);
        return;
    }
    
    currentSoundPack = packName;
    const pack = soundPacks[packName];
    
    // Update audio sources
    Object.keys(pack).forEach(soundName => {
        const audio = document.getElementById(soundName);
        if (audio) {
            audio.src = pack[soundName];
        }
    });
    
    console.log(`Switched to ${packName} sound pack`);
}

/**
 * Initialize sound pack selector
 */
function initSoundPackSelector() {
    const selector = document.getElementById('sound-pack');
    
    if (selector) {
        selector.addEventListener('change', (e) => {
            switchSoundPack(e.target.value);
        });
    }
}

/**
 * Recording system
 */
let isRecording = false;
let recordedBeats = [];
let recordingStartTime = 0;

/**
 * Start recording
 */
function startRecording() {
    isRecording = true;
    recordedBeats = [];
    recordingStartTime = Date.now();
    
    const recordBtn = document.getElementById('record-btn');
    const stopBtn = document.getElementById('stop-btn');
    
    if (recordBtn) recordBtn.classList.add('recording');
    if (stopBtn) stopBtn.disabled = false;
    
    console.log('Recording started');
}

/**
 * Stop recording
 */
function stopRecording() {
    isRecording = false;
    
    const recordBtn = document.getElementById('record-btn');
    const stopBtn = document.getElementById('stop-btn');
    const playBtn = document.getElementById('play-btn');
    const clearBtn = document.getElementById('clear-btn');
    
    if (recordBtn) recordBtn.classList.remove('recording');
    if (stopBtn) stopBtn.disabled = true;
    if (playBtn) playBtn.disabled = recordedBeats.length === 0;
    if (clearBtn) clearBtn.disabled = recordedBeats.length === 0;
    
    console.log(`Recording stopped. Recorded ${recordedBeats.length} beats`);
}

/**
 * Record a beat
 * @param {string} soundName - Name of the sound
 */
function recordBeat(soundName) {
    if (isRecording) {
        const timestamp = Date.now() - recordingStartTime;
        recordedBeats.push({ soundName, timestamp });
        console.log(`Recorded: ${soundName} at ${timestamp}ms`);
    }
}

/**
 * Play recorded beats
 */
function playRecording() {
    if (recordedBeats.length === 0) {
        console.log('No recording to play');
        return;
    }
    
    const playBtn = document.getElementById('play-btn');
    if (playBtn) playBtn.disabled = true;
    
    console.log('Playing recording...');
    
    recordedBeats.forEach(beat => {
        setTimeout(() => {
            playSound(beat.soundName);
            const pad = document.querySelector(`[data-sound="${beat.soundName}"]`);
            if (pad) addVisualFeedback(pad);
        }, beat.timestamp);
    });
    
    // Re-enable play button after playback
    const lastBeat = recordedBeats[recordedBeats.length - 1];
    setTimeout(() => {
        if (playBtn) playBtn.disabled = false;
        console.log('Playback finished');
    }, lastBeat.timestamp + 500);
}

/**
 * Clear recorded beats
 */
function clearRecording() {
    recordedBeats = [];
    
    const playBtn = document.getElementById('play-btn');
    const clearBtn = document.getElementById('clear-btn');
    
    if (playBtn) playBtn.disabled = true;
    if (clearBtn) clearBtn.disabled = true;
    
    console.log('Recording cleared');
}

/**
 * Initialize recording controls
 */
function initRecordingControls() {
    const recordBtn = document.getElementById('record-btn');
    const stopBtn = document.getElementById('stop-btn');
    const playBtn = document.getElementById('play-btn');
    const clearBtn = document.getElementById('clear-btn');
    
    if (recordBtn) {
        recordBtn.addEventListener('click', startRecording);
    }
    
    if (stopBtn) {
        stopBtn.addEventListener('click', stopRecording);
    }
    
    if (playBtn) {
        playBtn.addEventListener('click', playRecording);
    }
    
    if (clearBtn) {
        clearBtn.addEventListener('click', clearRecording);
    }
    
    console.log('Recording controls initialized');
}
