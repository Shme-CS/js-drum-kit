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
