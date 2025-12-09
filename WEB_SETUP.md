# Running on Web (Chrome)

To run the app on Chrome, you need to configure Firebase for Web.

## 1. Install FlutterFire CLI
If you haven't already:
```bash
dart pub global activate flutterfire_cli
```

## 2. Configure Firebase
Run this command in your project root:
```bash
flutterfire configure
```
- Select your Firebase project.
- Select **Web** (and Android/iOS if needed).
- This will generate `lib/firebase_options.dart`.

## 3. Update main.dart
Open `lib/main.dart` and update the initialization:

1.  Import the generated file:
    ```dart
    import 'firebase_options.dart';
    ```

2.  Update `main()`:
    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const MyApp());
    }
    ```

## 4. Run the App
```bash
flutter run -d chrome
```
