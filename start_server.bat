@echo off
cls
echo ============================================================
echo    EMOTION RECOGNITION FRONTEND - LOCAL SERVER STARTER
echo ============================================================
echo.
echo This script will try to start a local web server using
echo available tools on your system.
echo.
echo Demo Credentials:
echo   • Username: user      ^| Password: password
echo   • Username: demo      ^| Password: demo  
echo   • Username: patient1  ^| Password: therapy123
echo   • Username: admin     ^| Password: admin123
echo.
echo ============================================================
echo.

REM Try Python first
echo [1/4] Checking for Python...
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✓ Python found! Starting HTTP server...
    echo.
    echo Open your browser to: http://localhost:8000/login.html
    echo Press Ctrl+C to stop the server
    echo.
    python -m http.server 8000
    goto :end
)

REM Try Node.js
echo [2/4] Checking for Node.js...
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✓ Node.js found! Starting HTTP server...
    echo.
    echo Open your browser to: http://localhost:8000/login.html
    echo Press Ctrl+C to stop the server
    echo.
    npx http-server -p 8000
    goto :end
)

REM Try PHP
echo [3/4] Checking for PHP...
php --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✓ PHP found! Starting built-in server...
    echo.
    echo Open your browser to: http://localhost:8000/login.html
    echo Press Ctrl+C to stop the server
    echo.
    php -S localhost:8000
    goto :end
)

REM Fallback - open directly in browser
echo [4/4] No suitable HTTP server found.
echo.
echo ⚠️  Warning: Opening files directly in browser may have limitations
echo    due to CORS restrictions. Some features might not work properly.
echo.
echo Alternatives:
echo   1. Install Python: https://www.python.org/downloads/
echo   2. Install Node.js: https://nodejs.org/
echo   3. Use VS Code with Live Server extension
echo.
set /p choice="Open login.html directly in browser anyway? (y/N): "
if /i "%choice%"=="y" (
    echo Opening login.html in default browser...
    start login.html
) else (
    echo.
    echo Setup Instructions:
    echo 1. Install Python, Node.js, or PHP
    echo 2. Or use VS Code with Live Server extension
    echo 3. Or manually open login.html in your browser
)

:end
echo.
echo ============================================================
echo Thank you for testing the Emotion Recognition System!
echo ============================================================
pause
