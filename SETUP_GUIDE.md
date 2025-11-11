# 🔥 Firebase Authentication Setup Guide

This guide will walk you through setting up Firebase for this Flutter application.

## ⚡ Quick Start (3 Steps)

### Step 1: Install FlutterFire CLI

Open PowerShell or Command Prompt and run:

```powershell
dart pub global activate flutterfire_cli
```

Make sure the Dart global bin directory is in your PATH. If not, add it:
- Windows: `C:\Users\<YourUsername>\AppData\Local\Pub\Cache\bin`

### Step 2: Login to Firebase (if needed)

If you haven't already, install Firebase CLI and login:

```powershell
npm install -g firebase-tools
firebase login
```

### Step 3: Configure Firebase

Navigate to your project directory and run:

```powershell
cd "c:\Users\ashir\Ashir Imran In Class Activity 16\firebase_auth_demo"
flutterfire configure
```

**What this does:**
1. Lists your Firebase projects (or prompts you to create one)
2. Asks you to select a project
3. Asks which platforms to support (select Android at minimum)
4. Generates `lib/firebase_options.dart` automatically
5. Configures Android and iOS apps in Firebase Console

**Follow the prompts:**
- Select or create a Firebase project
- Enter project ID (or use suggested one)
- Select platforms: **Android** (at minimum, iOS/Web optional)

---

## 🔐 Enable Email/Password Authentication

After running `flutterfire configure`:

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project
3. Click **Authentication** in left sidebar
4. Click **Get Started** (if first time)
5. Go to **Sign-in method** tab
6. Click on **Email/Password**
7. Toggle **Enable** switch
8. Click **Save**

---

## ✅ Verify Setup

Run these commands to verify everything is set up correctly:

```powershell
# 1. Check Flutter setup
flutter doctor

# 2. Verify dependencies
flutter pub get

# 3. Check for errors
flutter analyze

# 4. Try running the app
flutter run
```

---

## 📱 Running the App

### On Android Emulator:

1. **Start Android Emulator:**
   - Open Android Studio
   - AVD Manager → Start an emulator
   - Or use: `emulator -avd <device_name>`

2. **Run the app:**
   ```powershell
   flutter run
   ```

### On Physical Device:

1. **Enable Developer Mode:**
   - Settings → About Phone → Tap "Build Number" 7 times

2. **Enable USB Debugging:**
   - Settings → Developer Options → USB Debugging

3. **Connect device and run:**
   ```powershell
   flutter devices  # Check if device is detected
   flutter run
   ```

---

## 🏗️ Building APK

### For Testing (Debug APK):
```powershell
flutter build apk --debug
```

### For Submission (Release APK):
```powershell
flutter build apk --release
```

**APK Location:**
```
build\app\outputs\flutter-apk\app-release.apk
```

---

## 🐛 Common Issues & Solutions

### Issue 1: "flutterfire: command not found"
**Solution:** Add Dart global bin to PATH:
```powershell
$env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
```

### Issue 2: Firebase initialization fails
**Solution:** 
- Ensure `firebase_options.dart` exists in `lib/`
- Run `flutterfire configure` again
- Check internet connection

### Issue 3: Google Services error (Android)
**Solution:**
- Verify `google-services.json` in `android/app/`
- Run `flutterfire configure` to regenerate
- Clean and rebuild: `flutter clean && flutter pub get`

### Issue 4: Build fails with Gradle error
**Solution:**
```powershell
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter build apk
```

### Issue 5: Email/Password sign-in not working
**Solution:**
- Verify Email/Password provider is enabled in Firebase Console
- Check Firebase Auth rules
- Ensure internet connection

---

## 📋 Pre-Submission Checklist

Before submitting your assignment:

- [ ] Run `flutterfire configure` successfully
- [ ] Email/Password authentication enabled in Firebase Console
- [ ] App runs without errors: `flutter run`
- [ ] No compilation warnings: `flutter analyze`
- [ ] APK builds successfully: `flutter build apk --release`
- [ ] Test all features:
  - [ ] User registration with valid email
  - [ ] User login with correct credentials
  - [ ] Password change functionality
  - [ ] Profile screen displays user email
  - [ ] Logout redirects to login screen
- [ ] APK file saved: `build\app\outputs\flutter-apk\app-release.apk`
- [ ] GitHub repository created and code pushed
- [ ] README.md is complete

---

## 🎯 Testing the App

### Test User Registration:
1. Launch app → Click "Register"
2. Enter email: `test@gsu.com`
3. Enter password: `test123`
4. Confirm password: `test123`
5. Click "Register"
6. Should redirect to Login screen with success message

### Test Login:
1. Enter email: `test@gsu.com`
2. Enter password: `test123`
3. Click "Login"
4. Should redirect to Profile screen

### Test Password Change:
1. On Profile screen → Click "Change Password"
2. Enter new password (at least 6 characters)
3. Click "Change"
4. Should show success message

### Test Logout:
1. On Profile screen → Click "Logout"
2. Confirm logout
3. Should redirect to Login screen

---

## 🔗 Useful Resources

- **Firebase Console:** https://console.firebase.google.com
- **Flutter Documentation:** https://docs.flutter.dev
- **Firebase Auth Docs:** https://firebase.google.com/docs/auth
- **FlutterFire CLI:** https://firebase.flutter.dev/docs/cli

---

## 💡 Tips

1. **Keep Firebase Console Open:** You'll need it to manage users and auth settings
2. **Use Chrome DevTools:** For debugging Flutter apps
3. **Check Logs:** Use `flutter logs` to see real-time logs
4. **Hot Reload:** Press `r` in terminal while app is running to see changes instantly
5. **Clean Build:** Run `flutter clean` if you encounter strange build errors

---

## 📞 Getting Help

If you encounter issues:

1. Check this guide first
2. Read error messages carefully
3. Check Firebase Console for issues
4. Run `flutter doctor -v` for detailed diagnostics
5. Search StackOverflow for specific error messages
6. Contact course instructor or TA

---

**Good luck with your assignment! 🚀**
