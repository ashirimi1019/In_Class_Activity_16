# Firebase Authentication in Flutter (CSC 4360 – Activity 16)

A complete Flutter application demonstrating Firebase Authentication with Email/Password sign-in, user registration, password management, and profile display functionality.

## 🎯 Features

- ✅ **User Registration** - Create new accounts with email and password validation
- ✅ **User Login** - Secure authentication with Firebase Auth
- ✅ **Password Change** - Update password with validation
- ✅ **Profile Screen** - Display user information and account details
- ✅ **Logout Functionality** - Secure sign-out with confirmation
- ✅ **Material Design** - Blue and Gold color scheme
- ✅ **Error Handling** - Comprehensive Firebase exception handling
- ✅ **Form Validation** - Client-side validation for all inputs

## 📱 Screenshots

The app includes three main screens:
1. **Login Screen** - Email/Password authentication
2. **Register Screen** - New user registration
3. **Profile Screen** - User info, password change, and logout

## 🔧 Technologies Used

- **Flutter** - Cross-platform mobile framework
- **Firebase Core** (v2.19.0) - Firebase initialization
- **Firebase Auth** (v4.12.0) - Authentication services
- **Cloud Firestore** (v4.12.0) - Database (imported but not used in this demo)
- **Material Design 3** - Modern UI components

## 🚀 Setup Instructions

### Prerequisites

Before you begin, ensure you have the following installed:
- Flutter SDK (latest stable version)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code with Flutter extensions
- Firebase CLI (optional but recommended)
- A Firebase project created at [Firebase Console](https://console.firebase.google.com)

### Step 1: Clone or Download the Project

```bash
cd "path/to/project"
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Firebase Configuration

#### Option A: Using FlutterFire CLI (Recommended)

1. Install FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

2. Configure Firebase:
```bash
flutterfire configure
```

This will:
- Connect to your Firebase project
- Generate `lib/firebase_options.dart` with your credentials
- Configure Android and iOS apps automatically

#### Option B: Manual Configuration

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project or select existing one
3. Add an Android app (and/or iOS app)
4. Download `google-services.json` (Android) and place it in `android/app/`
5. Download `GoogleService-Info.plist` (iOS) and place it in `ios/Runner/`
6. Update `lib/firebase_options.dart` with your Firebase credentials

### Step 4: Enable Email/Password Authentication

1. Go to Firebase Console > Authentication
2. Click on "Get Started" (if first time)
3. Go to "Sign-in method" tab
4. Enable "Email/Password" provider
5. Save changes

### Step 5: Run the Application

```bash
flutter run
```

For specific device:
```bash
flutter run -d <device_id>
```

To see available devices:
```bash
flutter devices
```

## 📦 Build APK

### Debug APK
```bash
flutter build apk --debug
```

### Release APK (Recommended for submission)
```bash
flutter build apk --release
```

The APK will be located at:
```
build/app/outputs/flutter-apk/app-release.apk
```

### Build App Bundle (For Google Play Store)
```bash
flutter build appbundle --release
```

## 🗂️ Project Structure

```
firebase_auth_demo/
├── lib/
│   ├── main.dart                 # App entry point with Firebase initialization
│   ├── firebase_options.dart     # Firebase configuration (generated)
│   ├── auth_service.dart         # Authentication service layer
│   ├── login_screen.dart         # Login UI and logic
│   ├── register_screen.dart      # Registration UI and logic
│   └── profile_screen.dart       # Profile, password change, and logout
├── android/                       # Android platform files
├── ios/                          # iOS platform files
├── assets/                       # Asset files (if any)
├── pubspec.yaml                  # Dependencies and configuration
└── README.md                     # This file
```

## 🎨 Color Scheme

The app follows a professional Blue and Gold theme:

- **Primary Blue**: `Color(0xFF1565C0)` - Used for AppBar, buttons, and accents
- **Accent Gold**: `Color(0xFFFFD600)` - Used for secondary elements
- **Background**: Grey variations for modern look

## 🧪 Test Cases

### Registration Tests
| Test Case | Input | Expected Result |
|-----------|-------|----------------|
| Valid registration | test@gsu.com + test123 | Success message + redirect to login |
| Invalid email format | testgsu.com + test123 | Error: "Email must contain @" |
| Missing .com | test@gsu + test123 | Error: "Email must contain .com" |
| Weak password | test@gsu.com + 12345 | Error: "Password must be at least 6 characters" |
| Existing email | duplicate@gsu.com + test123 | Error: "Email already in use" |
| Password mismatch | Different passwords | Error: "Passwords do not match" |

### Login Tests
| Test Case | Input | Expected Result |
|-----------|-------|----------------|
| Valid credentials | correct email/password | Redirect to Profile Screen |
| Invalid email | wrong@email.com | Error: "Invalid credentials" |
| Wrong password | correct email + wrong password | Error: "Invalid password" |
| Empty fields | Empty email or password | Validation error |

### Password Change Tests
| Test Case | Input | Expected Result |
|-----------|-------|----------------|
| Valid new password | Password > 6 chars | Success: "Password changed successfully" |
| Weak password | Password < 6 chars | Error: "Password must be at least 6 characters" |
| Recent login required | After long session | Prompt to logout and login again |

### Logout Test
| Test Case | Input | Expected Result |
|-----------|-------|----------------|
| Logout confirmation | Click logout + confirm | Redirect to Login Screen |
| Logout cancellation | Click logout + cancel | Stay on Profile Screen |

## 🔐 Security Features

- ✅ Password field obscuring
- ✅ Form validation before submission
- ✅ Firebase authentication rules
- ✅ Secure password storage (handled by Firebase)
- ✅ Re-authentication requirement for sensitive operations
- ✅ Error message handling without exposing sensitive data

## 📝 Code Quality

- ✅ No compile errors
- ✅ No deprecated API usage
- ✅ Proper error handling with try-catch blocks
- ✅ Code documentation and comments
- ✅ Follows Flutter best practices
- ✅ Material Design 3 guidelines

## 🐛 Troubleshooting

### Firebase Connection Issues
- Ensure `google-services.json` (Android) is in the correct location
- Verify `flutterfire configure` was run successfully
- Check Firebase project settings match your app

### Build Errors
- Run `flutter clean` then `flutter pub get`
- Check that all dependencies are compatible
- Ensure Android SDK and tools are up to date

### Authentication Errors
- Verify Email/Password provider is enabled in Firebase Console
- Check internet connection
- Ensure Firebase project is active

### APK Installation Issues
- Enable "Install from Unknown Sources" on Android device
- Use `--release` flag for production builds
- Check minimum SDK version compatibility

## 🎓 Assignment Submission Checklist

- ✅ All features implemented as per requirements
- ✅ Blue and Gold color scheme applied
- ✅ Firebase Authentication working
- ✅ No compilation errors or warnings
- ✅ APK builds successfully
- ✅ README.md completed
- ✅ GitHub repository created
- ✅ All test cases verified

## 📚 Documentation References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Flutter Setup](https://firebase.google.com/docs/flutter/setup)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Material Design 3](https://m3.material.io/)

## 👨‍💻 Developer Information

**Course**: CSC 4360 - Mobile App Development  
**Assignment**: In-Class Activity 16 - Firebase Authentication  
**Due Date**: November 10, 2025 @ 7:30 PM  

## 📄 License

This project is created for educational purposes as part of CSC 4360 coursework.

## 🙏 Acknowledgments

- Georgia State University - CSC 4360 Course
- Firebase Team for excellent documentation
- Flutter Team for the amazing framework

---

## 🔗 Additional Resources

### Useful Commands

```bash
# Check Flutter doctor
flutter doctor

# List all devices
flutter devices

# Run on specific device
flutter run -d <device_id>

# Build for different modes
flutter build apk --debug
flutter build apk --profile
flutter build apk --release

# Clean build cache
flutter clean

# Update dependencies
flutter pub upgrade

# Analyze code
flutter analyze

# Format code
flutter format lib/
```

### Firebase Commands (if using Firebase CLI)

```bash
# Login to Firebase
firebase login

# Initialize Firebase in project
firebase init

# Deploy security rules
firebase deploy --only firestore:rules
```

## 📧 Support

For questions or issues related to this assignment, please contact your course instructor or TA.

---

**Happy Coding! 🚀**
