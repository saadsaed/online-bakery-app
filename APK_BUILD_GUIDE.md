# APK Build Guide - Online Bakery App

This guide provides step-by-step instructions for building the Android APK file for the Online Bakery App.

## Prerequisites

Before building the APK, ensure you have the following installed:

### 1. Flutter SDK
- Download from: https://flutter.dev/docs/get-started/install
- Verify installation: `flutter doctor`
- Minimum Flutter version: 3.0.0+

### 2. Android Studio & SDK
- Download Android Studio from: https://developer.android.com/studio
- Install Android SDK through Android Studio
- Set `ANDROID_HOME` environment variable
- Accept Android licenses: `flutter doctor --android-licenses`

### 3. Java Development Kit (JDK)
- JDK 17 or later recommended
- Can be installed via Android Studio

## Verify Your Setup

Run the following command to check your environment:

```bash
flutter doctor -v
```

Ensure you see checkmarks (✓) for:
- Flutter
- Android toolchain
- Android Studio

## Build Instructions

### Step 1: Navigate to Project Directory

```bash
cd "c:\Users\R2H WOLF\Desktop\anti project"
```

### Step 2: Get Dependencies

```bash
flutter pub get
```

This will download all required packages listed in `pubspec.yaml`.

### Step 3: Clean Previous Builds (Optional)

```bash
flutter clean
```

This removes previous build artifacts and can help resolve build issues.

### Step 4: Build the Release APK

```bash
flutter build apk --release
```

This command will:
- Compile the Dart code
- Bundle all assets and resources
- Create an optimized, minified APK
- Output the APK to `build/app/outputs/flutter-apk/`

**Build time:** Typically 2-5 minutes depending on your system.

### Alternative: Build App Bundle (For Google Play Store)

If you plan to publish on Google Play Store, build an App Bundle instead:

```bash
flutter build appbundle --release
```

The `.aab` file will be in `build/app/outputs/bundle/release/`

## APK Output Location

After a successful build, you'll find the APK at:

```
build/app/outputs/flutter-apk/app-release.apk
```

**File size:** Approximately 20-40 MB (depends on included assets and libraries)

## Installing the APK

### On Physical Android Device

1. **Transfer the APK** to your device via:
   - USB cable (copy to Downloads folder)
   - Email attachment
   - Cloud storage (Google Drive, Dropbox)
   - ADB: `adb install build/app/outputs/flutter-apk/app-release.apk`

2. **Enable installation from unknown sources**:
   - Go to Settings → Security → Unknown Sources
   - Or Settings → Apps → Special Access → Install Unknown Apps
   - Enable for the app you're using to install (e.g., File Manager)

3. **Install the APK**:
   - Open the APK file using a file manager
   - Tap "Install"
   - Wait for installation to complete
   - Tap "Open" to launch the app

### Using ADB (Android Debug Bridge)

```bash
# Make sure device is connected and USB debugging is enabled
adb devices

# Install the APK
adb install build/app/outputs/flutter-apk/app-release.apk

# Or to reinstall/update:
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

## Code Signing for Production

> [!IMPORTANT]
> The APK built with the commands above is **NOT signed** with a production key and cannot be published to Google Play Store.

To create a signed release APK for production:

### Step 1: Create a Keystore

```bash
keytool -genkey -v -keystore c:\Users\R2H WOLF\Desktop\release-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bakery-app
```

You'll be prompted for:
- Keystore password (remember this!)
- Alias password
- Your name and organization details

### Step 2: Create key.properties File

Create `android/key.properties`:

```properties
storePassword=<your-keystore-password>
keyPassword=<your-key-password>
keyAlias=bakery-app
storeFile=c:/Users/R2H WOLF/Desktop/release-keystore.jks
```

> [!CAUTION]
> Never commit `key.properties` to version control! Add it to `.gitignore`.

### Step 3: Configure build.gradle

Edit `android/app/build.gradle.kts`:

```kotlin
// Add before android block
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    // ... existing config ...
    
    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }
    
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}
```

### Step 4: Build Signed APK

```bash
flutter build apk --release
```

Now the APK will be signed with your production key.

## Troubleshooting

### Issue: "No Android SDK found"

**Solution:**
- Install Android Studio
- Open Android Studio → SDK Manager → Install latest SDK
- Add to environment variables:
  ```
  ANDROID_HOME = C:\Users\<YourUsername>\AppData\Local\Android\Sdk
  ```
- Add to PATH: `%ANDROID_HOME%\platform-tools` and `%ANDROID_HOME%\tools`

### Issue: "Android license status unknown"

**Solution:**
```bash
flutter doctor --android-licenses
```
Press 'y' to accept all licenses.

### Issue: Build fails with "Gradle error"

**Solution:**
1. Delete `android/.gradle` folder
2. Run `flutter clean`
3. Run `flutter pub get`
4. Try building again

### Issue: "Execution failed for task ':app:minifyReleaseWithR8'"

**Solution:**
Add to `android/gradle.properties`:
```properties
android.enableR8.fullMode=false
```

### Issue: APK won't install on device

**Solution:**
- Check if device runs Android 5.0 (API 21) or higher
- Uninstall any previous version of the app
- Ensure "Install from Unknown Sources" is enabled

## Build Variants

### Debug Build
```bash
flutter build apk --debug
```
- Larger file size
- Includes debugging symbols
- Not optimized
- Good for testing

### Profile Build
```bash
flutter build apk --profile
```
- Good for performance testing
- Includes some debugging capabilities

### Release Build
```bash
flutter build apk --release
```
- Smallest file size
- Fully optimized
- No debugging symbols
- For production/distribution

## Split APKs (Per ABI)

To create smaller APKs for specific device architectures:

```bash
flutter build apk --split-per-abi
```

This creates separate APKs for:
- `app-armeabi-v7a-release.apk` (32-bit ARM)
- `app-arm64-v8a-release.apk` (64-bit ARM)
- `app-x86_64-release.apk` (64-bit Intel)

Users download only the APK for their device, reducing download size.

## Next Steps

After building the APK:

1. **Test thoroughly** on multiple devices
2. **Check Firebase configuration** is working
3. **Verify all features** (login, products, checkout)
4. **Test offline behavior**
5. **Review app permissions**

For publishing to Google Play Store, refer to:
https://docs.flutter.dev/deployment/android

## Additional Resources

- [Flutter Build Modes](https://docs.flutter.dev/testing/build-modes)
- [Android App Bundle](https://developer.android.com/guide/app-bundle)
- [Flutter Deployment](https://docs.flutter.dev/deployment)
