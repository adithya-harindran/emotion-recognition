# Emotion Recognition and Progression Tracking in Therapy Sessions

A comprehensive web application for analyzing emotional states during therapy sessions using machine learning-based emotion recognition from audio files.

## Features

### 🔐 Authentication System
- **Login Page** (`login.html`): Secure user authentication with username/password
- Form validation and error handling
- Session management with automatic redirection

### 🏠 Main Dashboard (`index.html`)
The main application includes three core sections accessible via a sidebar navigation:

#### 👤 Profiling Section
- User profile management and therapy session preferences
- Personal statistics and progress tracking
- Therapy goals with completion status
- User information display with avatar and role

#### 🎯 Emotion Prediction Section
- **File Upload**: Drag & drop or click to browse audio files
- **Supported Formats**: MP3, WAV, M4A (Max 10MB)
- **Real-time Processing**: Asynchronous analysis with loading states
- **Results Display**:
  - Dominant emotion with confidence percentage
  - Interactive bar chart showing emotion probability distribution
  - Detailed breakdown of all emotion probabilities

#### 📊 Session History Section
- Complete history of all emotion prediction sessions
- **Search & Filter**: Find sessions by filename or emotion type
- **Detailed View**: Modal popup with comprehensive session details
- **Data Management**: Individual record deletion and bulk history clearing
- **Export Ready**: Structured data for potential export functionality

## Technical Implementation

### Frontend Technologies
- **HTML5**: Semantic structure with accessibility considerations
- **CSS3**: Modern responsive design with CSS Grid and Flexbox
- **JavaScript ES6+**: Modular, event-driven architecture
- **Chart.js**: Interactive data visualization for emotion probabilities

### Key JavaScript Features
- **Fetch API**: Asynchronous communication with backend services
- **Session Management**: Secure authentication state handling
- **Local Storage**: Persistent session history storage
- **File Handling**: Advanced drag-and-drop file upload with validation
- **Dynamic UI Updates**: Real-time content rendering without page refresh

### Architecture Highlights
- **Single Page Application (SPA)**: Smooth navigation without page reloads
- **Responsive Design**: Mobile-first approach with breakpoint optimization
- **Progressive Enhancement**: Graceful degradation for older browsers
- **Accessibility**: ARIA labels, keyboard navigation, screen reader support

## Setup Instructions

### 1. Download the Project
```bash
# Navigate to your desired directory
cd /path/to/your/projects

# If you have the project as a zip file, extract it
# Otherwise, ensure all files are in the emotion-recognition-frontend folder
```

### 2. File Structure
```
emotion-recognition-frontend/
├── login.html              # Login page
├── index.html              # Main application
├── README.md               # Project documentation
├── css/
│   └── styles.css          # Complete styling
├── js/
│   ├── login.js           # Login functionality
│   └── app.js             # Main application logic
└── assets/                 # Future assets (images, etc.)
```

### 3. Running the Application

#### Option A: Simple HTTP Server (Recommended)
```bash
# Using Python (if installed)
python -m http.server 8000

# Using Node.js (if installed)
npx http-server

# Using PHP (if installed)
php -S localhost:8000
```

#### Option B: Live Server Extension (VS Code)
1. Install the "Live Server" extension in VS Code
2. Right-click on `login.html`
3. Select "Open with Live Server"

#### Option C: Direct File Access
- Simply open `login.html` in your web browser
- Note: Some features may be limited due to CORS restrictions

### 4. Access the Application
- Open your browser and navigate to: `http://localhost:8000/login.html`
- Use the demo credentials below to log in

## Demo Credentials

For testing and demonstration purposes, use any of these login combinations:

| Username | Password | User Type |
|----------|----------|-----------|
| `user` | `password` | Standard User |
| `demo` | `demo` | Demo User |
| `patient1` | `therapy123` | Therapy Patient |
| `admin` | `admin123` | Administrator |

## Usage Guide

### 1. Login
- Enter valid credentials from the demo table above
- Click "Sign In" or press Enter to authenticate
- Invalid credentials will show an error message

### 2. Navigation
- Use the sidebar menu to switch between sections
- **Profiling**: View user information and therapy progress
- **Emotion Prediction**: Upload and analyze audio files
- **Session History**: Review past analysis results

### 3. Emotion Analysis
1. Navigate to the "Emotion Prediction" section
2. Upload an audio file by:
   - Dragging and dropping the file onto the upload area
   - Clicking the upload area to browse files
3. Click "Analyze Emotion" to start processing
4. View results including:
   - Primary detected emotion with confidence level
   - Detailed probability chart for all emotions
   - Timestamp and file information

### 4. Session Management
- All predictions are automatically saved to history
- Search through sessions using the search box
- Filter by specific emotions using the dropdown
- Click "View" to see detailed analysis results
- Delete individual sessions or clear all history

## API Integration

### Current Implementation
- **Simulation Mode**: The application currently uses simulated emotion recognition
- **Random Results**: Generates realistic but random emotion probabilities
- **Processing Delay**: 2-second delay to simulate real API processing time

### Real API Integration
To connect to an actual emotion recognition API:

1. **Update the `simulateEmotionPrediction()` function** in `js/app.js`:
```javascript
async function performEmotionPrediction() {
    const formData = new FormData();
    const fileInput = document.getElementById('audioFile');
    formData.append('audio', fileInput.files[0]);
    
    try {
        const response = await fetch('/api/emotion-predict', {
            method: 'POST',
            body: formData
        });
        
        const result = await response.json();
        return result;
    } catch (error) {
        throw new Error('API request failed');
    }
}
```

2. **Expected API Response Format**:
```json
{
    "dominantEmotion": "happy",
    "confidence": 85.3,
    "probabilities": {
        "happy": 85.3,
        "neutral": 8.7,
        "sad": 3.2,
        "angry": 1.8,
        "fear": 0.6,
        "surprise": 0.3,
        "disgust": 0.1
    }
}
```

## Customization

### Themes and Styling
- Modify CSS variables in `styles.css` for color scheme changes
- Responsive breakpoints can be adjusted in the media queries
- Add custom animations by extending the existing keyframe definitions

### Adding New Emotions
1. Update the `emotions` array in the prediction simulation
2. Add corresponding icons in `getEmotionIcon()` function
3. Define colors in `getEmotionColor()` function
4. Update the emotion filter dropdown in `index.html`

### Additional Features
The codebase is structured to easily accommodate:
- User registration and profile editing
- Audio playback capabilities
- Data export functionality (CSV, PDF reports)
- Advanced analytics and trend visualization
- Multi-language support

## Browser Compatibility

### Fully Supported
- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

### Partially Supported
- Internet Explorer 11 (with polyfills)
- Older mobile browsers

### Required Features
- ES6 JavaScript support
- CSS Grid and Flexbox
- Local Storage API
- File API for uploads

## Security Considerations

### Current Implementation
- Session-based authentication using sessionStorage
- Client-side validation with server-side verification recommended
- CSRF protection should be implemented for production use

### Production Recommendations
1. **HTTPS**: Always use HTTPS in production
2. **JWT Tokens**: Replace sessionStorage with secure JWT tokens
3. **Input Validation**: Implement comprehensive server-side validation
4. **File Upload Security**: Add virus scanning and file type verification
5. **Rate Limiting**: Implement API rate limiting for prediction endpoints

## Performance Optimization

### Current Optimizations
- Lazy loading of chart components
- Efficient DOM manipulation
- Debounced search functionality
- Optimized CSS with minimal reflows

### Further Improvements
- Service Worker for offline functionality
- Image compression for avatar uploads
- CDN integration for Chart.js library
- Bundle optimization with webpack or similar tools

## Contributing

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Follow the existing code style and structure
4. Test thoroughly across different browsers
5. Submit a pull request with detailed description

### Code Style Guidelines
- Use ES6+ features where appropriate
- Follow consistent naming conventions
- Add comments for complex logic
- Maintain responsive design principles
- Ensure accessibility standards compliance

## License

This project is developed for educational and therapeutic purposes. Please ensure compliance with healthcare data protection regulations (HIPAA, GDPR) when implementing in production environments.

## Support

For technical support or feature requests, please refer to the project documentation or contact the development team.

---

**Last Updated**: October 2024
**Version**: 1.0.0
