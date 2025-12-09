# Manual Web Setup (No CLI)

Since the automated tools failed, you can configure Firebase for Web manually.

## 1. Get Configuration from Firebase Console
1.  Go to [Firebase Console](https://console.firebase.google.com/).
2.  Open your project.
3.  Click the **Web** icon (</>) to add a web app.
4.  Register the app (give it a name like "Bakery Web").
5.  You will see a code snippet with `const firebaseConfig = { ... };`.
    - Keep this page open or copy these values.

## 2. Update `lib/firebase_options.dart`
I have created a file named `lib/firebase_options.dart` in your project.
Open it and replace the placeholder values (`REPLACE_WITH_YOUR_...`) with the values from the Firebase Console.

Example mapping:
- `apiKey` -> `apiKey`
- `authDomain` -> `authDomain`
- `projectId` -> `projectId`
- `storageBucket` -> `storageBucket`
- `messagingSenderId` -> `messagingSenderId`
- `appId` -> `appId`

## 3. Run the App
Once you have saved `lib/firebase_options.dart` with your actual keys, run:

```bash
flutter run -d chrome
```
