# Online Bakery App - Quick Setup for APK Build

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Name: `online-bakery-app` (or any name you prefer)
3. Make it **Private** or **Public** (your choice)
4. **DO NOT** initialize with README, .gitignore, or license (we already have these)
5. Click **Create repository**

## Step 2: Push Your Code to GitHub

After creating the repo, you'll see a page with commands. Use these commands in PowerShell:

```powershell
# Navigate to your project (if not already there)
cd "c:\Users\R2H WOLF\Desktop\anti project"

# Initialize git (if not already initialized)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Online Bakery App"

# Add your GitHub repository as remote
# Replace YOUR-USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR-USERNAME/online-bakery-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Wait for Build

1. After pushing, go to your GitHub repository
2. Click on the **Actions** tab
3. You'll see "Build Android APK" workflow running
4. Wait 5-10 minutes for it to complete

## Step 4: Download Your APK

1. Once the build is complete (green checkmark ✓)
2. Click on the workflow run
3. Scroll down to **Artifacts** section
4. Click **app-release-apk** to download
5. Extract the ZIP file to get your APK!

## Troubleshooting

If git is not installed:
- Download from https://git-scm.com/download/win
- Install with default settings
- Restart PowerShell

---

**Total Time**: ~10-15 minutes
