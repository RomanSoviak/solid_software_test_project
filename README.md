# Solid Software Test App

## Build and run preconditions(my local setup):

### Generate signed APK

fvm flutter build apk --flavor production -t lib/main.dart --release

### Generate signed APP BUNDLE

fvm flutter build appbundle --flavor production -t lib/main.dart --release

### Environment:
Xcode Version 16.4 - 16F6   
Android Studio Narwhal | 2025.1.1 Patch 1  
macOS: Sequoia 15.5  

### Flutter:
fvm flutter --version

Flutter 3.32.7 • channel stable • https://github.com/flutter/flutter.git  
Framework • revision d7b523b356 (5 днів тому) • 2025-07-15 17:03:46 -0700  
Engine • revision 39d6d6e699 (5 днів тому) • 2025-07-15 15:39:12 -0700  
Tools • Dart 3.8.1 • DevTools 2.45.1