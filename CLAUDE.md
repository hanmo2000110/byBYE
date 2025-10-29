# AlDente Flutter Project

## Overview
AlDente is a Flutter application for cross-platform mobile development.

## Project Structure
- **Platform**: Flutter 3.35.4
- **Language**: Dart 3.9.2
- **Package Name**: aldente
- **Version**: 1.0.0+1

## Development Commands

### Flutter Commands
```bash
# Install dependencies
flutter pub get

# Clean project
flutter clean

# Run app in debug mode
flutter run

# Build for iOS (no code signing)
flutter build ios --no-codesign

# Build for Android
flutter build apk

# Run tests
flutter test
```

### iOS Development
```bash
# Navigate to iOS directory
cd ios

# Install CocoaPods dependencies (if Podfile exists)
pod install

# Open in Xcode
open Runner.xcworkspace
```

## Dependencies
- **cupertino_icons**: ^1.0.8
- **flutter_lints**: ^5.0.0 (dev)

## Platform Support
- iOS (minimum deployment target: 13.0)
- Android
- Web
- Windows
- macOS
- Linux

## Environment Requirements
- Flutter SDK: ^3.6.0
- Dart SDK: 3.9.2
- iOS: Xcode and iOS Simulator
- Android: Android Studio and Android SDK