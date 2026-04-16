# JavaScript Drum Kit

A interactive drum kit built with vanilla JavaScript.

## Features

- 6 different drum sounds (Kick, Snare, Hi-hat, Tom, Clap, Ride)
- Click interaction with visual feedback
- Keyboard support (A, S, D, F, G, H keys)
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
