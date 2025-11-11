# 📦 Submission Instructions for In-Class Activity 16

## 🎯 What to Submit

You need to submit **TWO** items:

1. **APK File** → Upload to iCollege Dropbox
2. **GitHub Repository Link** → Include in iCollege submission comments

---

## 📱 Part 1: Build and Submit APK

### Step 1: Build Release APK

Open PowerShell in your project directory and run:

```powershell
cd "c:\Users\ashir\Ashir Imran In Class Activity 16\firebase_auth_demo"
flutter build apk --release
```

**Wait for build to complete.** You should see:
```
✓ Built build\app\outputs\flutter-apk\app-release.apk (XX.XMB)
```

### Step 2: Locate the APK

The APK file is located at:
```
c:\Users\ashir\Ashir Imran In Class Activity 16\firebase_auth_demo\build\app\outputs\flutter-apk\app-release.apk
```

### Step 3: Rename APK (Optional but Recommended)

Rename the APK to something meaningful:
```
firebase_auth_demo_ashir_imran.apk
```

### Step 4: Upload to iCollege

1. Go to iCollege → CSC 4360 Course
2. Navigate to **In-Class Activity 16** assignment
3. Click **Dropbox** or **Submit Assignment**
4. Upload `app-release.apk` (or your renamed file)
5. **DO NOT click Submit yet** - add GitHub link first

---

## 🐙 Part 2: Create GitHub Repository

### Option A: Using GitHub Desktop (Easier)

1. **Download and Install GitHub Desktop:**
   - Download from: https://desktop.github.com
   - Install and sign in with your GitHub account

2. **Create Repository:**
   - Click **File** → **Add Local Repository**
   - Click **Choose...** and select: `c:\Users\ashir\Ashir Imran In Class Activity 16\firebase_auth_demo`
   - Click **Add Repository**
   - If it says "not a Git repository," click **Create Repository**

3. **Configure Repository:**
   - Repository name: `firebase_auth_demo_flutter`
   - Description: `Firebase Authentication Demo for CSC 4360 Activity 16`
   - Keep "Git ignore" as: `None` (we already have .gitignore)
   - Click **Create Repository**

4. **Make Initial Commit:**
   - You'll see all files listed
   - Summary: `Initial commit - Firebase Auth Demo`
   - Click **Commit to main**

5. **Publish to GitHub:**
   - Click **Publish repository**
   - **Uncheck** "Keep this code private" (make it public for submission)
   - Click **Publish Repository**

6. **Get Repository Link:**
   - Click **Repository** → **View on GitHub**
   - Copy the URL from your browser
   - Example: `https://github.com/yourusername/firebase_auth_demo_flutter`

### Option B: Using Git Command Line

1. **Initialize Git (if not already):**
   ```powershell
   cd "c:\Users\ashir\Ashir Imran In Class Activity 16\firebase_auth_demo"
   git init
   ```

2. **Add all files:**
   ```powershell
   git add .
   ```

3. **Commit:**
   ```powershell
   git commit -m "Initial commit - Firebase Auth Demo for CSC 4360 Activity 16"
   ```

4. **Create GitHub Repository:**
   - Go to: https://github.com/new
   - Repository name: `firebase_auth_demo_flutter`
   - Description: `Firebase Authentication Demo for CSC 4360 Activity 16`
   - Select **Public**
   - **DO NOT** initialize with README (we have one)
   - Click **Create repository**

5. **Push to GitHub:**
   ```powershell
   git remote add origin https://github.com/YOUR_USERNAME/firebase_auth_demo_flutter.git
   git branch -M main
   git push -u origin main
   ```

6. **Get Repository Link:**
   - Copy URL from GitHub: `https://github.com/YOUR_USERNAME/firebase_auth_demo_flutter`

---

## ✅ Part 3: Complete iCollege Submission

1. Return to iCollege assignment page
2. In **Comments** or **Submission Text** box, paste:
   ```
   GitHub Repository: https://github.com/YOUR_USERNAME/firebase_auth_demo_flutter
   
   All requirements completed:
   ✓ User registration with email/password
   ✓ User login functionality
   ✓ Password change feature
   ✓ Profile screen with user email display
   ✓ Logout functionality
   ✓ Blue and Gold color scheme
   ✓ Firebase integration
   ✓ APK attached
   ```

3. **Verify both items:**
   - [ ] APK file is attached
   - [ ] GitHub link is in comments

4. Click **Submit Assignment**

---

## 🔍 Verify Your Submission

### Check Your GitHub Repo:

Visit your repository URL and verify:
- [ ] All `.dart` files are present in `lib/` folder
- [ ] `README.md` is visible and formatted correctly
- [ ] `pubspec.yaml` shows Firebase dependencies
- [ ] Repository is **Public** (not private)

### Check Your APK:

Test the APK before submitting:
1. Transfer APK to Android device
2. Install it (may need to enable "Install from Unknown Sources")
3. Open app and test:
   - Registration works
   - Login works
   - Profile displays correctly
   - Password change works
   - Logout works

---

## 📋 Pre-Submission Checklist

Before clicking Submit on iCollege:

### Code Quality:
- [ ] No compilation errors: `flutter analyze`
- [ ] All features working
- [ ] Blue/Gold theme applied throughout
- [ ] Error messages display correctly

### Files:
- [ ] `lib/main.dart` - Complete
- [ ] `lib/auth_service.dart` - Complete
- [ ] `lib/login_screen.dart` - Complete
- [ ] `lib/register_screen.dart` - Complete
- [ ] `lib/profile_screen.dart` - Complete
- [ ] `lib/firebase_options.dart` - Generated
- [ ] `README.md` - Complete
- [ ] `pubspec.yaml` - Firebase dependencies added

### APK:
- [ ] Built successfully: `flutter build apk --release`
- [ ] File size reasonable (10-50 MB)
- [ ] Tested on device or emulator

### GitHub:
- [ ] Repository is public
- [ ] All code files pushed
- [ ] README displays correctly
- [ ] Repository link works

### iCollege:
- [ ] APK uploaded
- [ ] GitHub link in comments
- [ ] Submitted before deadline (Nov 10 @ 7:30 PM)

---

## ⏰ Important Deadlines

**Due Date:** November 10, 2025 @ 7:30 PM

**Late Policy:** Check syllabus for late submission policy

---

## 🆘 Troubleshooting

### "APK file too large"
- Release APK should be 15-30 MB
- If larger, ensure you used `--release` flag
- Try: `flutter build apk --release --split-per-abi`

### "GitHub repository shows as private"
- Go to repository **Settings**
- Scroll to **Danger Zone**
- Click **Change visibility**
- Select **Public**

### "APK won't install on device"
- Enable **Unknown Sources** in Android settings
- Check minimum Android version
- Try debug APK: `flutter build apk --debug`

### "Git push authentication fails"
- Use Personal Access Token instead of password
- GitHub Settings → Developer Settings → Personal Access Tokens
- Generate token with 'repo' permissions
- Use token as password when pushing

---

## 📧 Need Help?

If you encounter issues:

1. Check this guide thoroughly
2. Review `SETUP_GUIDE.md` for Firebase setup
3. Check `README.md` for project documentation
4. Contact course instructor or TA
5. Post in course discussion forum

---

## 🎉 You're Done!

Once you've:
1. ✅ Uploaded APK to iCollege
2. ✅ Added GitHub link to iCollege
3. ✅ Clicked Submit

You're all set! Good job! 🚀

---

**Student Name:** _______________________

**GitHub Username:** _______________________

**Repository Link:** _______________________

**Submission Date:** _______________________

**Submission Time:** _______________________
