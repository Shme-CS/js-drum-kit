# JavaScript Drum Kit

An advanced interactive drum kit built with vanilla JavaScript featuring recording, multiple sound packs, and volume control.

## Features

- 6 different drum sounds (Kick, Snare, Hi-hat, Tom, Clap, Ride)
- Click interaction with visual feedback
- Keyboard support (A, S, D, F, G, H keys)
- **Volume control slider**
- **Multiple sound packs** (Classic, Electronic, Acoustic)
- **Recording mode** - Record your drum patterns
- **Playback** - Play back your recorded rhythms
- Responsive design for all devices
- Smooth animations and glow effects

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
│       ├── ride.mp3
│       ├── electronic/
│       └── acoustic/
└── README.md
```

## Getting Started

1. Clone the repository
2. Add drum sound files to `assets/sounds/` (see assets/sounds/README.md for sources)
3. Open `index.html` in your browser
4. Start playing and recording drums!

## How to Use

### Playing Drums
- **Click** on any drum pad to play the corresponding sound
- **Press keyboard keys** (A, S, D, F, G, H) to play drums
- Each pad shows the keyboard key and drum name
- Visual feedback shows when a pad is activated

### Keyboard Mapping

- **A** - Kick Drum
- **S** - Snare
- **D** - Hi-hat
- **F** - Tom
- **G** - Clap
- **H** - Ride Cymbal

### Volume Control
- Use the volume slider to adjust the master volume (0-100%)
- Volume changes apply to all sounds

### Sound Packs
- Select different sound packs from the dropdown
- Available packs: Classic, Electronic, Acoustic
- Each pack has unique drum sounds

### Recording
1. Click **Record** button to start recording
2. Play your drum pattern
3. Click **Stop** to finish recording
4. Click **Play** to hear your recording
5. Click **Clear** to delete the recording

## Technologies Used

- HTML5
- CSS3 (Grid Layout, Animations, Flexbox)
- JavaScript (ES6+)
- Web Audio API

## Browser Support

Works on all modern browsers that support:
- CSS Grid
- ES6 JavaScript
- HTML5 Audio

## Advanced Features

- **Modular JavaScript** - Clean, organized code with separate functions
- **Real-time recording** - Captures timing and rhythm accurately
- **Multiple sound packs** - Easy to add more sound collections
- **Visual feedback** - Glow effects and animations
- **Responsive design** - Works on desktop, tablet, and mobile

## Future Enhancements

- Save recordings to local storage
- Export recordings as audio files
- Metronome and tempo control
- Loop playback
- More sound packs

## Code Architecture

### Modular Design

The application is organized into logical modules:

1. **Audio Manager** - Handles all audio playback operations
2. **Visual Feedback** - Manages animations and visual effects
3. **Recording Manager** - Controls recording and playback
4. **Sound Pack Manager** - Switches between sound collections
5. **Event Handlers** - Centralized event handling
6. **Initializer** - Application setup and initialization

### Performance Optimizations

- Optimized audio playback with `currentTime` reset
- Force reflow for animation restart
- Centralized state management
- Efficient event delegation
- Minimal DOM manipulation

### Code Quality

- Comprehensive JSDoc documentation
- Consistent naming conventions
- Modular architecture
- Error handling and validation
- Clean, maintainable code

## Development

### Code Structure

```
js/
├── script.js              # Main application code
├── performance-notes.md   # Performance documentation
└── code-quality.md        # Quality standards
```

### Adding New Features

1. Create a new module in the appropriate section
2. Add JSDoc comments for all functions
3. Update the Initializer if needed
4. Test thoroughly
5. Update documentation

### Performance Guidelines

- Keep functions small and focused
- Avoid unnecessary DOM queries
- Use event delegation where possible
- Minimize global variables
- Profile before optimizing
