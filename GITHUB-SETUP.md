# 🚀 GitHub Setup Guide

## Step 0: Install Git (If Not Already Installed)

**Check if Git is installed:**
```powershell
git --version
```

**If Git is not installed:**
1. **Download Git**: Go to [git-scm.com](https://git-scm.com/download/win)
2. **Install Git**: Run the downloaded installer with default settings
3. **Restart PowerShell** after installation
4. **Verify**: Run `git --version` to confirm installation

## Step 1: Prepare Your Local Repository

Open PowerShell in your project folder and run these commands:

```powershell
# Initialize git repository
git init

# Add all files to staging
git add .

# Make your first commit
git commit -m "Initial commit: Emotion Recognition Therapy App"

# Set main branch (modern standard)
git branch -M main
```

## Step 2: Create GitHub Repository

1. **Go to GitHub**: Visit [github.com](https://github.com) and sign in (create account if needed)
2. **Click "New"** button (green button) or go to [github.com/new](https://github.com/new)
3. **Repository Name**: `emotion-recognition-therapy`
4. **Description**: `Modern web application for emotion recognition and mental health tracking in therapy sessions`
5. **Set to Public** (so you can use GitHub Pages)
6. **Don't initialize** with README (we already have files)
7. **Click "Create Repository"**

## Step 3: Connect Local to GitHub

GitHub will show you commands, but here's what you need:

```powershell
# Add your GitHub repository as origin (replace USERNAME with your GitHub username)
git remote add origin https://github.com/USERNAME/emotion-recognition-therapy.git

# Push your code to GitHub
git push -u origin main
```

## Step 4: Enable GitHub Pages (Free Hosting)

1. **Go to your repository** on GitHub
2. **Click "Settings"** tab
3. **Scroll to "Pages"** in left sidebar
4. **Source**: Deploy from a branch
5. **Branch**: Select "main"
6. **Folder**: / (root)
7. **Click "Save"**

Your site will be live at: `https://USERNAME.github.io/emotion-recognition-therapy/`

## Step 5: Test Your Live Site

- Wait 5-10 minutes for deployment
- Visit your GitHub Pages URL
- Test login with: `user` / `password`
- Try uploading audio files and viewing charts

## Future Updates

When you make changes:
```powershell
git add .
git commit -m "Update: describe your changes"
git push
```

GitHub will automatically update your live site!
