/**
 * JavaScript Drum Kit - Advanced Interactive Drum Machine
 * 
 * Features:
 * - Multiple sound packs (Classic, Electronic, Acoustic)
 * - Volume control
 * - Recording and playback
 * - Keyboard and mouse interaction
 * - Visual feedback animations
 * 
 * @author Drum Kit Team
 * @version 2.0.0
 */

// ============================================================================
// CONSTANTS AND CONFIGURATION
// ============================================================================

/**
 * Animation duration for visual feedback (milliseconds)
 * @constant {number}
 */
const ANIMATION_DURATION = 150;

/**
 * Default master volume (0.0 to 1.0)
 * @constant {number}
 */
const DEFAULT_VOLUME = 0.8;

/**
 * Keyboard to sound mapping
 * Maps keyboard keys to drum sound names
 * @constant {Object.<string, string>}
 */
const KEY_MAP = {
    'a': 'kick',
    's': 'snare',
    'd': 'hihat',
    'f': 'tom',
    'g': 'clap',
    'h': 'ride'
};

// ============================================================================
// STATE MANAGEMENT
// ============================================================================

/**
 * Application state object
 * Centralizes all mutable state in one place
 */
const state = {
    masterVolume: DEFAULT_VOLUME,
    currentSoundPack: 'classic',
    isRecording: false,
    recordedBeats: [],
    recordingStartTime: 0
};

// ============================================================================
// SOUND PACK CONFIGURATIONS
// ============================================================================

/**
 * Sound pack configurations
 * Each pack contains paths to different drum sound files
 * @constant {Object.<string, Object.<string, string>>}
 */
const SOUND_PACKS = {
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

console.log('Drum Kit initialized');

// ============================================================================
// AUDIO MANAGEMENT MODULE
// ============================================================================

/**
 * Audio Manager
 * Handles all audio-related operations
 */
const AudioManager = {
    /**
     * Get audio element by sound name
     * @param {string} soundName - Name of the sound
     * @returns {HTMLAudioElement|null} Audio element or null if not found
     */
    getAudioElement(soundName) {
        return document.getElementById(soundName);
    },

    /**
     * Play a drum sound with current volume
     * @param {string} soundName - Name of the sound to play
     * @returns {boolean} True if sound played successfully
     */
    playSound(soundName) {
        const audio = this.getAudioElement(soundName);
        
        if (!audio) {
            console.error(`Audio element not found: ${soundName}`);
            return false;
        }
        
        // Reset to start for rapid playback
        audio.currentTime = 0;
        
        // Apply master volume
        audio.volume = state.masterVolume;
        
        // Play audio
        audio.play().catch(error => {
            console.error(`Error playing ${soundName}:`, error);
        });
        
        console.log(`Playing: ${soundName} at volume ${Math.round(state.masterVolume * 100)}%`);
        return true;
    },

    /**
     * Update volume for a specific audio element
     * @param {string} soundName - Name of the sound
     * @param {number} volume - Volume level (0.0 to 1.0)
     */
    setVolume(soundName, volume) {
        const audio = this.getAudioElement(soundName);
        if (audio) {
            audio.volume = Math.max(0, Math.min(1, volume));
        }
    },

    /**
     * Update master volume
     * @param {number} volume - Volume level (0.0 to 1.0)
     */
    setMasterVolume(volume) {
        state.masterVolume = Math.max(0, Math.min(1, volume));
        console.log(`Master volume set to: ${Math.round(state.masterVolume * 100)}%`);
    }
};

// ============================================================================
// VISUAL FEEDBACK MODULE
// ============================================================================

/**
 * Visual Feedback Manager
 * Handles all visual animations and effects
 */
const VisualFeedback = {
    /**
     * Add playing animation to a drum pad
     * Forces animation restart for rapid triggering
     * @param {HTMLElement} element - The drum pad element
     */
    addPlayingAnimation(element) {
        if (!element) return;
        
        // Remove existing class to force animation restart
        element.classList.remove('playing');
        
        // Force browser reflow to restart CSS animation
        void element.offsetWidth;
        
        // Add playing class for animation
        element.classList.add('playing');
        
        // Remove class after animation completes
        setTimeout(() => {
            element.classList.remove('playing');
        }, ANIMATION_DURATION);
    },

    /**
     * Find drum pad element by sound name
     * @param {string} soundName - Name of the sound
     * @returns {HTMLElement|null} Drum pad element or null
     */
    getDrumPad(soundName) {
        return document.querySelector(`[data-sound="${soundName}"]`);
    },

    /**
     * Trigger visual feedback for a sound
     * @param {string} soundName - Name of the sound
     */
    trigger(soundName) {
        const pad = this.getDrumPad(soundName);
        if (pad) {
            this.addPlayingAnimation(pad);
        }
    }
};

// ============================================================================
// RECORDING MODULE
// ============================================================================

/**
 * Recording Manager
 * Handles recording and playback of drum patterns
 */
const RecordingManager = {
    /**
     * Start recording drum beats
     */
    startRecording() {
        state.isRecording = true;
        state.recordedBeats = [];
        state.recordingStartTime = Date.now();
        
        this.updateRecordingUI(true);
        console.log('Recording started');
    },

    /**
     * Stop recording drum beats
     */
    stopRecording() {
        state.isRecording = false;
        this.updateRecordingUI(false);
        console.log(`Recording stopped. Captured ${state.recordedBeats.length} beats`);
    },

    /**
     * Record a beat with timestamp
     * @param {string} soundName - Name of the sound
     */
    recordBeat(soundName) {
        if (!state.isRecording) return;
        
        const timestamp = Date.now() - state.recordingStartTime;
        state.recordedBeats.push({ soundName, timestamp });
        console.log(`Recorded: ${soundName} at ${timestamp}ms`);
    },

    /**
     * Play back recorded beats
     */
    playRecording() {
        if (state.recordedBeats.length === 0) {
            console.log('No recording to play');
            return;
        }
        
        const playBtn = document.getElementById('play-btn');
        if (playBtn) playBtn.disabled = true;
        
        console.log(`Playing ${state.recordedBeats.length} recorded beats...`);
        
        // Schedule each beat for playback
        state.recordedBeats.forEach(beat => {
            setTimeout(() => {
                AudioManager.playSound(beat.soundName);
                VisualFeedback.trigger(beat.soundName);
            }, beat.timestamp);
        });
        
        // Re-enable play button after playback completes
        const lastBeat = state.recordedBeats[state.recordedBeats.length - 1];
        setTimeout(() => {
            if (playBtn) playBtn.disabled = false;
            console.log('Playback finished');
        }, lastBeat.timestamp + 500);
    },

    /**
     * Clear recorded beats
     */
    clearRecording() {
        state.recordedBeats = [];
        this.updatePlaybackUI();
        console.log('Recording cleared');
    },

    /**
     * Update recording UI state
     * @param {boolean} isRecording - Whether recording is active
     */
    updateRecordingUI(isRecording) {
        const recordBtn = document.getElementById('record-btn');
        const stopBtn = document.getElementById('stop-btn');
        
        if (recordBtn) {
            if (isRecording) {
                recordBtn.classList.add('recording');
            } else {
                recordBtn.classList.remove('recording');
            }
        }
        
        if (stopBtn) {
            stopBtn.disabled = !isRecording;
        }
        
        if (!isRecording) {
            this.updatePlaybackUI();
        }
    },

    /**
     * Update playback UI state
     */
    updatePlaybackUI() {
        const playBtn = document.getElementById('play-btn');
        const clearBtn = document.getElementById('clear-btn');
        const hasRecording = state.recordedBeats.length > 0;
        
        if (playBtn) playBtn.disabled = !hasRecording;
        if (clearBtn) clearBtn.disabled = !hasRecording;
    }
};
