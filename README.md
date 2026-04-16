# 🥁 JavaScript Drum Kit

<div align="center">

![Drum Kit Banner](https://img.shields.io/badge/Drum%20Kit-Interactive-purple?style=for-the-badge)
![Version](https://img.shields.io/badge/version-2.0.0-blue?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

**An advanced, interactive drum machine built with vanilla JavaScript**

[Live Demo](#) | [Report Bug](https://github.com/Shme-CS/js-drum-kit/issues) | [Request Feature](https://github.com/Shme-CS/js-drum-kit/issues)

</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Demo](#demo)
- [Technologies](#technologies)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Code Architecture](#code-architecture)
- [Responsive Design](#responsive-design)
- [Browser Support](#browser-support)
- [Contributing](#contributing)
- [Future Improvements](#future-improvements)
- [License](#license)
- [Contact](#contact)

---

## 🎯 Overview

JavaScript Drum Kit is a feature-rich, browser-based drum machine that allows users to create and play drum beats using either mouse clicks or keyboard inputs. Built with vanilla JavaScript, HTML5, and CSS3, this project demonstrates modern web development practices including modular code architecture, responsive design, and performance optimization.

### Why This Project?

- **Educational**: Perfect for learning JavaScript event handling, audio manipulation, and DOM interaction
- **Interactive**: Provides immediate visual and audio feedback
- **Accessible**: Works on desktop, tablet, and mobile devices
- **Extensible**: Modular architecture makes it easy to add new features


## ✨ Features

### Core Features

- 🎵 **6 Drum Sounds** - Kick, Snare, Hi-hat, Tom, Clap, and Ride
- ⌨️ **Keyboard Support** - Play drums using A, S, D, F, G, H keys
- 🖱️ **Mouse/Touch Support** - Click or tap drum pads
- 🎨 **Visual Feedback** - Animated glow effects when pads are triggered
- 🔊 **Volume Control** - Adjustable master volume (0-100%)

### Advanced Features

- 🎼 **Sound Pack Switcher** - Choose from Classic, Electronic, or Acoustic drum kits
- ⏺️ **Recording Mode** - Record your drum patterns with precise timing
- ▶️ **Playback** - Play back recorded rhythms
- 🗑️ **Clear Recording** - Reset and start fresh
- 📱 **Fully Responsive** - Optimized for all screen sizes and devices

### Technical Features

- ⚡ **Optimized Performance** - 60fps animations, minimal latency
- 🏗️ **Modular Architecture** - Clean, maintainable code structure
- 📝 **Comprehensive Documentation** - JSDoc comments throughout
- 🎯 **Touch Optimized** - 44px minimum touch targets
- 🌐 **Cross-Browser Compatible** - Works on all modern browsers


## 🎬 Demo

### Live Demo

👉 **[Try it live here](https://shme-cs.github.io/js-drum-kit/)**

### Screenshots

<div align="center">

#### Desktop View
![Desktop View](assets/screenshots/desktop.png)

#### Tablet View
![Tablet View](assets/screenshots/tablet.png)

#### Mobile View
![Mobile View](assets/screenshots/mobile.png)

</div>

### Video Demo

![Demo GIF](assets/demo.gif)


## 🛠️ Technologies

### Built With

- **HTML5** - Semantic markup and audio elements
- **CSS3** - Modern styling with Grid, Flexbox, and animations
- **JavaScript (ES6+)** - Vanilla JS with modular architecture

### Key Technologies & Concepts

| Technology | Purpose |
|------------|---------|
| **CSS Grid** | Responsive drum pad layout |
| **CSS Animations** | Visual feedback and transitions |
| **Web Audio API** | Audio playback and control |
| **Event Delegation** | Efficient event handling |
| **Module Pattern** | Code organization |
| **JSDoc** | Code documentation |
| **Responsive Design** | Mobile-first approach |
| **Touch Events** | Mobile device support |

### Development Tools

- Git & GitHub - Version control
- VS Code - Code editor
- Chrome DevTools - Debugging and testing


## 📦 Installation

### Prerequisites

- A modern web browser (Chrome, Firefox, Safari, Edge)
- Basic understanding of HTML/CSS/JavaScript (for development)

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/Shme-CS/js-drum-kit.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd js-drum-kit
   ```

3. **Open in browser**
   ```bash
   # Simply open index.html in your browser
   # Or use a local server (recommended)
   ```

### Using a Local Server

#### Option 1: Python
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

#### Option 2: Node.js (http-server)
```bash
npx http-server
```

#### Option 3: VS Code Live Server
- Install Live Server extension
- Right-click on `index.html`
- Select "Open with Live Server"

Then visit `http://localhost:8000` (or the port shown)

### Adding Sound Files

The project requires drum sound files. Place MP3 files in:

```
assets/sounds/
├── kick.mp3
├── snare.mp3
├── hihat.mp3
├── tom.mp3
├── clap.mp3
└── ride.mp3
```

**Free Sound Resources:**
- [Freesound.org](https://freesound.org/)
- [SampleSwap](https://sampleswap.org/)
- [99Sounds](https://99sounds.org/)


## 📖 Usage

### Playing Drums

#### Keyboard Controls

Press the following keys to play drum sounds:

| Key | Drum Sound |
|-----|------------|
| `A` | Kick Drum |
| `S` | Snare |
| `D` | Hi-hat |
| `F` | Tom |
| `G` | Clap |
| `H` | Ride Cymbal |

#### Mouse/Touch Controls

- Click or tap any drum pad to play the corresponding sound
- Visual feedback shows which pad is active

### Volume Control

1. Locate the volume slider in the controls panel
2. Drag the slider left (decrease) or right (increase)
3. Volume ranges from 0% to 100%

### Switching Sound Packs

1. Find the "Sound Pack" dropdown in the controls panel
2. Select from:
   - **Classic** - Traditional drum sounds
   - **Electronic** - 808/909 style electronic drums
   - **Acoustic** - Natural acoustic drum kit

### Recording & Playback

#### Recording a Pattern

1. Click the **⏺ Record** button
2. Play your drum pattern using keyboard or mouse
3. Click **⏹ Stop** when finished

#### Playing Back

1. After recording, click **▶ Play** to hear your pattern
2. The visual feedback will replay in sync with the audio

#### Clearing Recording

- Click **🗑 Clear** to delete the current recording

### Tips for Best Experience

- 🎧 Use headphones for better audio quality
- 🖱️ On desktop, keyboard is faster than mouse
- 📱 On mobile, use landscape mode for more space
- 🔊 Adjust volume before recording
- ⚡ Rapid key presses work smoothly (no lag)


## 📁 Project Structure

```
js-drum-kit/
│
├── index.html                 # Main HTML file
├── README.md                  # Project documentation
├── LICENSE                    # MIT License
│
├── css/
│   └── style.css             # All styles and responsive design
│
├── js/
│   ├── script.js             # Main application code
│   ├── performance-notes.md  # Performance documentation
│   └── code-quality.md       # Code quality standards
│
├── assets/
│   ├── sounds/               # Drum sound files
│   │   ├── kick.mp3
│   │   ├── snare.mp3
│   │   ├── hihat.mp3
│   │   ├── tom.mp3
│   │   ├── clap.mp3
│   │   ├── ride.mp3
│   │   ├── electronic/       # Electronic sound pack
│   │   └── acoustic/         # Acoustic sound pack
│   │
│   └── screenshots/          # Project screenshots
│       ├── desktop.png
│       ├── tablet.png
│       └── mobile.png
│
└── .gitignore                # Git ignore file
```

### File Descriptions

| File/Folder | Description |
|-------------|-------------|
| `index.html` | Main HTML structure with semantic markup |
| `css/style.css` | Complete styling including responsive breakpoints |
| `js/script.js` | Modular JavaScript with 6 main modules |
| `assets/sounds/` | Audio files for drum sounds |
| `assets/screenshots/` | Project screenshots for documentation |


## 🏗️ Code Architecture

### Modular Design

The application is organized into logical modules for maintainability:

```javascript
// 1. Constants & Configuration
const ANIMATION_DURATION = 150;
const KEY_MAP = { 'a': 'kick', ... };
const SOUND_PACKS = { classic: {...}, ... };

// 2. State Management
const state = {
    masterVolume: 0.8,
    currentSoundPack: 'classic',
    isRecording: false,
    recordedBeats: []
};

// 3. Audio Manager Module
const AudioManager = {
    playSound(soundName) { ... },
    setMasterVolume(volume) { ... }
};

// 4. Visual Feedback Module
const VisualFeedback = {
    trigger(soundName) { ... },
    addPlayingAnimation(element) { ... }
};

// 5. Recording Manager Module
const RecordingManager = {
    startRecording() { ... },
    playRecording() { ... }
};

// 6. Sound Pack Manager Module
const SoundPackManager = {
    switchPack(packName) { ... }
};

// 7. Event Handlers Module
const EventHandlers = {
    handleDrumClick(event) { ... },
    handleKeyPress(event) { ... }
};

// 8. Initializer Module
const Initializer = {
    initAll() { ... }
};
```

### Design Patterns

- **Module Pattern** - Encapsulation and organization
- **Observer Pattern** - Event-driven architecture
- **Singleton Pattern** - Single state object
- **Factory Pattern** - Sound pack creation

### Performance Optimizations

1. **Audio Playback** - Reset `currentTime` instead of creating new objects
2. **Animation** - Force reflow for smooth restart
3. **Event Delegation** - Single listener per control type
4. **State Management** - Centralized state reduces complexity
5. **DOM Queries** - Cached selectors where possible


## 📱 Responsive Design

### Breakpoints

| Device | Breakpoint | Layout |
|--------|------------|--------|
| Desktop | > 1024px | 3-column grid, full controls |
| Tablet | 768px - 1024px | 3-column grid, optimized spacing |
| Mobile | 480px - 768px | 2-column grid, stacked controls |
| Small Phone | < 480px | 2-column grid, compact layout |
| Landscape | height < 600px | Horizontal optimization |

### Touch Optimizations

- ✅ Minimum 44x44px touch targets (Apple HIG)
- ✅ Tap highlight removal
- ✅ Touch-action manipulation
- ✅ Active state feedback
- ✅ Optimized button spacing

### Responsive Features

- **Fluid Typography** - `clamp()` for scalable text
- **Auto-fit Grid** - Flexible drum pad layout
- **Aspect Ratio** - Maintained pad proportions
- **Viewport Units** - Responsive sizing
- **Orientation Support** - Landscape/portrait modes

### Performance on Mobile

- 60fps animations
- Hardware acceleration
- Minimal reflows
- Touch-action optimization
- High DPI support


## 🌐 Browser Support

| Browser | Version | Status |
|---------|---------|--------|
| Chrome | 90+ | ✅ Fully Supported |
| Firefox | 88+ | ✅ Fully Supported |
| Safari | 14+ | ✅ Fully Supported |
| Edge | 90+ | ✅ Fully Supported |
| Opera | 76+ | ✅ Fully Supported |

### Required Features

- CSS Grid Layout
- ES6 JavaScript
- HTML5 Audio API
- CSS Animations
- Touch Events

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### How to Contribute

1. **Fork the Project**
2. **Create your Feature Branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your Changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the Branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### Contribution Guidelines

- Follow existing code style
- Add JSDoc comments for new functions
- Test on multiple devices/browsers
- Update documentation as needed
- Keep commits atomic and descriptive

### Code Style

- Use 4 spaces for indentation
- Use camelCase for variables and functions
- Use PascalCase for modules
- Use UPPER_SNAKE_CASE for constants
- Add comments for complex logic


## 🚀 Future Improvements

### Planned Features

- [ ] **Save Recordings** - Export recordings to local storage
- [ ] **Share Recordings** - Generate shareable links
- [ ] **More Sound Packs** - Jazz, Rock, Hip-Hop kits
- [ ] **Metronome** - Built-in tempo guide
- [ ] **Loop Mode** - Continuous playback
- [ ] **Tempo Control** - Adjust playback speed
- [ ] **Visual Waveforms** - Display audio waveforms
- [ ] **MIDI Support** - Connect MIDI controllers
- [ ] **Export Audio** - Download recordings as MP3/WAV
- [ ] **Preset Patterns** - Pre-made drum patterns
- [ ] **Multi-track Recording** - Layer multiple recordings
- [ ] **Effects** - Reverb, delay, compression
- [ ] **Customization** - User-defined key mappings
- [ ] **Dark/Light Theme** - Theme switcher
- [ ] **Accessibility** - Screen reader support

### Technical Improvements

- [ ] Web Workers for recording processing
- [ ] Service Worker for offline support
- [ ] Audio sprites for faster loading
- [ ] IndexedDB for persistent storage
- [ ] WebRTC for real-time collaboration
- [ ] Progressive Web App (PWA)
- [ ] TypeScript migration
- [ ] Unit tests with Jest
- [ ] E2E tests with Cypress

### Community Requests

Have an idea? [Open an issue](https://github.com/Shme-CS/js-drum-kit/issues) or submit a pull request!


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### MIT License Summary

```
MIT License

Copyright (c) 2026 Shme-CS

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 📞 Contact

**Shme-CS** - Computer Science Student

- GitHub: [@Shme-CS](https://github.com/Shme-CS)
- Project Link: [https://github.com/Shme-CS/js-drum-kit](https://github.com/Shme-CS/js-drum-kit)

## 🙏 Acknowledgments

- Sound samples from [Freesound.org](https://freesound.org/)
- Inspiration from [JavaScript30](https://javascript30.com/)
- Icons from [Emoji](https://emojipedia.org/)
- Gradient from [UI Gradients](https://uigradients.com/)

---

<div align="center">

**⭐ Star this repo if you found it helpful!**

Made with ❤️ by [Shme-CS](https://github.com/Shme-CS)

</div>

