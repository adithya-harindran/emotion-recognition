@echo off
cls
echo ===============================================
echo    QUICK DEPLOY - EMOTION RECOGNITION APP
echo ===============================================
echo.
echo This script will help you deploy your app quickly!
echo.
echo Deployment Options:
echo 1. Create ZIP for drag-and-drop deployment
echo 2. Open Netlify in browser
echo 3. Open Vercel in browser
echo 4. Show deployment instructions
echo 5. Exit
echo.

:menu
set /p choice="Choose an option (1-5): "

if "%choice%"=="1" goto createzip
if "%choice%"=="2" goto netlify
if "%choice%"=="3" goto vercel
if "%choice%"=="4" goto instructions
if "%choice%"=="5" goto exit
echo Invalid choice. Please try again.
goto menu

:createzip
echo.
echo Creating deployment ZIP file...
powershell -command "Compress-Archive -Force -Path '*.html', 'css', 'js', 'assets', 'README.md', '_redirects' -DestinationPath 'emotion-recognition-deploy.zip'"
echo ✓ Created: emotion-recognition-deploy.zip
echo.
echo Next steps:
echo 1. Go to netlify.com and create account
echo 2. Drag emotion-recognition-deploy.zip to deployment area
echo 3. Get your live URL!
echo.
pause
goto menu

:netlify
echo.
echo Opening Netlify...
start https://app.netlify.com
echo Drag your emotion-recognition-deploy.zip file to deploy!
echo.
pause
goto menu

:vercel
echo.
echo Opening Vercel...
start https://vercel.com/new
echo Upload your project folder to deploy!
echo.
pause
goto menu

:instructions
echo.
echo ===============================================
echo           DEPLOYMENT INSTRUCTIONS
echo ===============================================
echo.
echo EASIEST METHOD - Netlify Drag & Drop:
echo 1. Run option 1 to create ZIP file
echo 2. Go to netlify.com and sign up
echo 3. Drag the ZIP file to deploy
echo 4. Get instant live URL!
echo.
echo ALTERNATIVE METHODS:
echo - Vercel: vercel.com (drag & drop)
echo - GitHub Pages: Push to GitHub repository
echo - Firebase: firebase deploy
echo.
echo For detailed instructions, see DEPLOYMENT.md
echo.
pause
goto menu

:exit
echo.
echo 🚀 Ready to deploy! Your emotion recognition app
echo    will be live in minutes!
echo.
echo Demo credentials for testing:
echo   - user / password
echo   - demo / demo
echo   - patient1 / therapy123
echo.
pause
