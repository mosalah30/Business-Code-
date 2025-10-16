# Setup Guide - Business Card Scanner App

This guide will help you set up and run the Business Card Scanner app on your local machine.

## Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Flutter SDK** (version 3.9.2 or higher)

   - Download from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter --version`

2. **Dart SDK** (version 3.9.0 or higher)

   - Comes bundled with Flutter
   - Verify: `dart --version`

3. **Git**

   - Download from: https://git-scm.com/downloads
   - Verify: `git --version`

4. **IDE** (Choose one)
   - Android Studio (recommended): https://developer.android.com/studio
   - VS Code with Flutter extension: https://code.visualstudio.com/

### For Android Development

5. **Android SDK**

   - Installed via Android Studio
   - Minimum SDK: API 21 (Android 5.0)
   - Target SDK: API 34

6. **Android Emulator or Physical Device**
   - Set up via Android Studio AVD Manager
   - Or connect a physical Android device with USB debugging enabled

### For iOS Development (macOS only)

7. **Xcode** (latest version)

   - Download from Mac App Store
   - Install command line tools: `xcode-select --install`

8. **CocoaPods**

   - Install: `sudo gem install cocoapods`
   - Verify: `pod --version`

9. **iOS Simulator or Physical Device**
   - Comes with Xcode
   - Or connect a physical iOS device

## Step-by-Step Setup

### 1. Clone the Repository

```bash
git clone https://github.com/mosalah30/Business-Code-.git
cd Business-Code-
```

### 2. Verify Flutter Installation

```bash
flutter doctor
```

This command checks your environment and displays a report. Fix any issues marked with ❌ before proceeding.

### 3. Install Dependencies

```bash
flutter pub get
```

This will download all the required packages listed in `pubspec.yaml`.

### 4. Generate Hive Type Adapters

The app uses Hive for local storage, which requires generated code:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This generates the following files:

- `lib/features/home/data/models/user.g.dart`
- `lib/features/home/data/models/business_card.g.dart`

**Note:** These files are already included in the repository, but you may need to regenerate them if you modify the models.

### 5. Run the App

#### On Android

```bash
# List available devices
flutter devices

# Run on connected device/emulator
flutter run
```

#### On iOS (macOS only)

```bash
# Install iOS dependencies
cd ios
pod install
cd ..

# Run on simulator/device
flutter run
```

#### On Web (Optional)

```bash
flutter run -d chrome
```

### 6. Build for Release

#### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

#### Android App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

#### iOS (macOS only)

```bash
flutter build ios --release
```

Then open `ios/Runner.xcworkspace` in Xcode to archive and distribute.

## Troubleshooting

### Common Issues and Solutions

#### 1. "flutter: command not found"

**Solution:** Add Flutter to your PATH

```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

Add this line to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.)

#### 2. "Gradle build failed"

**Solution:**

- Clean the build: `flutter clean`
- Get dependencies: `flutter pub get`
- Try again: `flutter run`

#### 3. "CocoaPods not installed" (iOS)

**Solution:**

```bash
sudo gem install cocoapods
pod setup
```

#### 4. "Hive type adapter not found"

**Solution:** Regenerate the adapters

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

#### 5. "Version solving failed"

**Solution:**

- Delete `pubspec.lock`
- Run `flutter pub get`
- If still failing, check Flutter version compatibility

#### 6. Android license issues

**Solution:**

```bash
flutter doctor --android-licenses
```

Accept all licenses when prompted.

#### 7. iOS signing issues

**Solution:**

- Open `ios/Runner.xcworkspace` in Xcode
- Select your development team in Signing & Capabilities
- Ensure you have a valid provisioning profile

## Project Structure Overview

```
business_code_by_mohamed_salah/
├── android/              # Android native code
├── ios/                  # iOS native code
├── lib/                  # Flutter application code
│   ├── core/            # Core utilities and services
│   ├── features/        # Feature modules
│   │   ├── auth/       # Authentication feature
│   │   └── home/       # Home/Cards feature
│   ├── router/         # App routing
│   └── main.dart       # App entry point
├── test/                # Test files
├── pubspec.yaml         # Dependencies
└── README.md           # Project documentation
```

## Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/unit/models/user_test.dart
```

## Development Workflow

1. **Make changes** to the code
2. **Hot reload** - Press `r` in the terminal or save the file
3. **Hot restart** - Press `R` for a full restart
4. **Debug** - Use IDE debugger or `print()` statements
5. **Test** - Run tests before committing
6. **Commit** - Use meaningful commit messages

## Useful Commands

```bash
# Check for updates
flutter upgrade

# Clean build files
flutter clean

# Analyze code
flutter analyze

# Format code
flutter format .

# Check outdated packages
flutter pub outdated

# Update packages
flutter pub upgrade
```

## Environment Variables

This app doesn't require any environment variables or API keys as it works completely offline with local storage.

## Database Location

Hive databases are stored in:

- **Android:** `/data/data/com.example.business_code_by_mohamed_salah/app_flutter/`
- **iOS:** `~/Library/Containers/com.example.businessCodeByMohamedSalah/Data/Documents/`

## Support

If you encounter any issues:

1. Check the [Flutter documentation](https://flutter.dev/docs)
2. Search [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
3. Open an issue on [GitHub](https://github.com/mosalah30/Business-Code-/issues)

## Next Steps

After successful setup:

1. Explore the codebase
2. Run the app and test features
3. Read the architecture documentation in README.md
4. Try modifying the UI or adding new features
5. Write tests for your changes

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter BLoC Package](https://bloclibrary.dev/)
- [Hive Documentation](https://docs.hivedb.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

**Happy Coding! 🚀**
