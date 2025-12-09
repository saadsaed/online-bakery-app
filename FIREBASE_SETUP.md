# Firebase Integration Guide

Since the `flutter` command is not available in this environment, I could not generate the Android and iOS platform folders. You will need to perform the following steps on your local machine to complete the Firebase integration.

## 1. Generate Platform Folders
Open your terminal in the project folder (`anti project`) and run:
```bash
flutter create .
```
This will generate the `android` and `ios` directories.

## 2. Firebase Console Setup
1.  Go to [Firebase Console](https://console.firebase.google.com/).
2.  Create a new project (e.g., "Online Bakery").
3.  Enable **Authentication**:
    - Go to Build > Authentication > Get Started.
    - Enable **Email/Password** provider.
4.  Enable **Firestore Database**:
    - Go to Build > Firestore Database > Create Database.
    - Start in **Test Mode** (for development).

## 3. Android Setup
1.  In Firebase Console, click the **Android** icon to add an app.
2.  Register app with package name: `com.example.online_bakery_app` (check `android/app/build.gradle` to confirm the `applicationId` after running `flutter create`).
3.  Download `google-services.json`.
4.  Place it in: `android/app/google-services.json`.
5.  Modify `android/build.gradle` (Project level):
    ```gradle
    dependencies {
        // ... other dependencies
        classpath 'com.google.gms:google-services:4.3.15'
    }
    ```
6.  Modify `android/app/build.gradle` (App level):
    ```gradle
    plugins {
        id 'com.android.application'
        id 'com.google.gms.google-services' // Add this line
        // ...
    }
    ```

## 4. iOS Setup (If using Mac)
1.  In Firebase Console, click the **iOS** icon.
2.  Register app with Bundle ID (check `ios/Runner.xcodeproj`).
3.  Download `GoogleService-Info.plist`.
4.  Open `ios/Runner.xcworkspace` in Xcode.
5.  Drag and drop `GoogleService-Info.plist` into the `Runner` folder in Xcode.

## 5. Run the App
Now you can run the app on your device or emulator:
```bash
flutter run
```
