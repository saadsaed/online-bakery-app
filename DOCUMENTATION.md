# Online Bakery App - Complete Documentation

> **Version:** 1.0.0  
> **Last Updated:** December 2025  
> **Platform:** Android (Flutter)

---

## 📱 Application Overview

The **Online Bakery App** is a mobile application built with Flutter that allows customers to browse bakery products and manage their profiles. Administrators can manage the product catalog through an intuitive interface.

### Key Features

- 🔐 **User Authentication**: Secure email/password login and signup
- 🍰 **Product Catalog**: Browse bakery items with detailed information
- 👨‍💼 **Admin Panel**: Add, edit, and delete products
- 👤 **Profile Management**: View and edit user profiles
- 📱 **Material Design**: Modern, responsive UI
- ☁️ **Firebase Integration**: Real-time database and authentication

---

## 🏗️ Architecture

### Technology Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **Backend**: Firebase
  - Firebase Authentication
  - Cloud Firestore
  - Firebase Storage
- **State Management**: Provider
- **UI**: Material Design 3

### Project Structure

```
online_bakery_app/
├── lib/
│   ├── core/                    # Core app configuration
│   │   ├── constants.dart       # App-wide constants
│   │   └── theme.dart           # Material theme configuration
│   ├── models/                  # Data models
│   │   ├── product_model.dart   # Product data structure
│   │   └── user_model.dart      # User data structure
│   ├── services/                # Business logic layer
│   │   ├── auth_service.dart    # Authentication operations
│   │   └── database_service.dart # Firestore operations
│   ├── screens/                 # UI screens
│   │   ├── auth/                # Authentication screens
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   ├── dashboard/           # Dashboard
│   │   │   └── dashboard_screen.dart
│   │   ├── products/            # Product screens
│   │   │   └── products_screen.dart
│   │   ├── admin/               # Admin screens
│   │   │   └── add_edit_product_screen.dart
│   │   ├── profile/             # Profile screens
│   │   │   ├── profile_screen.dart
│   │   │   └── edit_profile_screen.dart
│   │   ├── home_screen.dart     # Main navigation
│   │   └── product_details_screen.dart
│   ├── firebase_options.dart    # Firebase configuration
│   └── main.dart                # Application entry point
├── android/                     # Android platform files
├── assets/                      # Static assets
│   └── images/                  # Image files
├── pubspec.yaml                 # Dependencies and metadata
└── README.md                    # Project overview
```

---

## 🔥 Firebase Configuration

### Firestore Database Structure

#### Users Collection

```javascript
users/
  └── {userId}/
      ├── email: string
      ├── fullName: string
      ├── createdAt: timestamp
      ├── phone: string (optional)
      ├── address: string (optional)
      └── isAdmin: boolean (optional, for admin users)
```

#### Products Collection

```javascript
products/
  └── {productId}/
      ├── name: string
      ├── description: string
      ├── price: number
      ├── imageUrl: string
      ├── category: string
      └── createdAt: timestamp
```

### Security Rules

#### Recommended Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Products - anyone can read, only admins can write
    match /products/{productId} {
      allow read: if true;
      allow create, update, delete: if request.auth != null  
        && get(/databases/$(database)/documents/users/$(request.auth.uid)).data.isAdmin == true;
    }
    
    // Users - users can read/write their own data
    match /users/{userId} {
      allow read: if request.auth != null && request.auth.uid == userId;
      allow update: if request.auth != null  
        && request.auth.uid == userId
        && !request.resource.data.diff(resource.data).affectedKeys().hasAny(['isAdmin']);
      allow create: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

#### Firebase Storage Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /products/{allImages=**} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

---

## 🚀 Installation & Setup

### Prerequisites

1. **Flutter SDK** (version 3.0.0 or higher)
2. **Android Studio** with Android SDK
3. **Firebase Project** created at [Firebase Console](https://console.firebase.google.com/)
4. **Git** (optional, for version control)

### Step-by-Step Setup

#### 1. Clone or Download the Project

```bash
cd "c:\Users\R2H WOLF\Desktop\anti project"
```

#### 2. Install Dependencies

```bash
flutter pub get
```

#### 3. Firebase Setup

1. **Create Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project: "Online Bakery"

2. **Enable Services**:
   - **Authentication** → Enable Email/Password provider
   - **Firestore Database** → Create database (start in test mode)
   - **Storage** → Enable Firebase Storage

3. **Add Android App**:
   - Click Android icon
   - Package name: `com.example.online_bakery_app`
   - Download `google-services.json`
   - Place in `android/app/`

4. **Configure FlutterFire** (if regenerating config):
   ```bash
   flutterfire configure
   ```

#### 4. Run the Application

```bash
# For Chrome/Web
flutter run -d chrome

# For Android device/emulator
flutter run

# For specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

---

## 📦 Building the APK

### Quick Build

```bash
flutter build apk --release
```

APK Output: `build/app/outputs/flutter-apk/app-release.apk`

### For Detailed Instructions

See [APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md) for:
- Prerequisites
- Step-by-step build instructions
- Code signing for production
- Troubleshooting

---

## 👥 User Workflows

### Customer Workflow

1. **Sign Up / Login**
   - Open app → Create account or login
   - Email verification (if enabled)

2. **Browse Products**
   - Navigate to Products tab
   - View products by category
   - Tap product for details

3. **View Product Details**
   - See product information
   - Check pricing and description

4. **Manage Profile**
   - Navigate to Profile tab
   - Edit personal information
   - Update profile details

5. **Logout**
   - Tap logout icon
   - Return to login screen

### Admin Workflow

1. **Login as Admin**
   - Login with admin account
   - Account must have `isAdmin: true` in Firestore

2. **Add New Product**
   - Navigate to Products tab
   - Tap "+ Add Product" button
   - Fill in product details:
     - Name
     - Price
     - Category
     - Image URL
     - Description
   - Save product

3. **Edit Product**
   - Find product in list
   - Tap Edit icon (✏️)
   - Modify details
   - Save changes

4. **Delete Product**
   - Find product in list
   - Tap Delete icon (🗑️)
   - Confirm deletion

---

## 🎨 UI/UX Design

### Theme Configuration

The app uses custom Material Design theme defined in `lib/core/theme.dart`:

- **Primary Color**: Amber (#FFC107)
- **Accent Color**: Deep Orange
- **Typography**: Google Fonts (Roboto)
- **Card Elevation**: 4dp
- **Border Radius**: 12px

### Screen Layouts

#### Bottom Navigation
- **Dashboard**: Home overview
- **Products**: Product catalog
- **Profile**: User account

#### App Bar Actions
- **Edit**: Edit current item (context-sensitive)
- **Logout**: Sign out of account

---

## 🔧 Services & APIs

### AuthService (`lib/services/auth_service.dart`)

Handles all authentication operations:

```dart
// Sign Up
Future<UserCredential> signUp(String email, String password)

// Sign In
Future<UserCredential> signIn(String email, String password)

// Sign Out
Future<void> signOut()

// Auth State Stream
Stream<User?> get authStateChanges

// Current User
User? get currentUser
```

### DatabaseService (`lib/services/database_service.dart`)

Handles Firestore database operations:

```dart
// User Operations
Future<void> createUserDocument(String uid, String email, String fullName)
Future<void> updateUserProfile(String uid, Map<String, dynamic> data)
Stream<UserModel?> getUserStream(String uid)

// Product Operations
Future<void> addProduct(Product product)
Future<void> updateProduct(Product product)
Future<void> deleteProduct(String productId)
Stream<List<Product>> getProductsStream()
Stream<Product?> getProductStream(String productId)
```

---

## 📊 Data Models

### Product Model

```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
  
  // JSON serialization
  factory Product.fromJson(Map<String, dynamic> json, String id)
  Map<String, dynamic> toJson()
}
```

### User Model

```dart
class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final String? phone;
  final String? address;
  final bool isAdmin;
  
  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    this.phone,
    this.address,
    this.isAdmin = false,
  });
  
  // JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json)
  Map<String, dynamic> toJson()
}
```

---

## 🔐 Security Considerations

### Authentication
- ✅ Passwords are hashed by Firebase Auth
- ✅ Email verification available (optional)
- ✅ Session management handled by Firebase
- ✅ Secure token-based authentication

### Data Protection
- ✅ Firestore Security Rules enforce permissions
- ✅ Users can only access their own data
- ✅ Admin privileges checked server-side
- ✅ HTTPS encryption for all data transfer

### Best Practices
- 🔒 Never store passwords in code
- 🔒 Keep Firebase API keys secure
- 🔒 Validate all user inputs
- 🔒 Use security rules, not just client-side checks
- 🔒 Regular security audits

---

## 🐛 Troubleshooting

### Common Issues

#### Build Failures

**Gradle errors:**
```bash
flutter clean
flutter pub get
flutter build apk
```

**Dependency conflicts:**
```bash
flutter pub upgrade
```

#### Firebase Connection Issues

**Check Firebase initialization:**
- Verify `firebase_options.dart` is generated correctly
- Ensure `google-services.json` is in `android/app/`
- Check Firebase project configuration

**Firestore permission denied:**
- Review Firestore security rules
- Ensure user is authenticated
- Check admin privileges for admin operations

#### App Crashes

**Check logs:**
```bash
flutter logs
```

**Common causes:**
- Null safety violations
- Missing Firebase configuration
- Network connectivity issues
- Invalid data in Firestore

---

## 📱 Deployment

### Android Deployment

1. **Build Release APK**:
   ```bash
   flutter build apk --release
   ```

2. **Test on Device**:
   - Transfer APK to device
   - Enable "Unknown Sources"
   - Install and test

3. **For Play Store**:
   - Build App Bundle: `flutter build appbundle --release`
   - Sign with production keystore
   - Upload to Google Play Console

### Future: iOS Deployment

1. **Setup**: Add iOS config in Firebase
2. **Build**: `flutter build ios --release`
3. **Deploy**: Upload to App Store via Xcode

---

## 🔮 Future Enhancements

### Planned Features

- [ ] **Shopping Cart**: Multi-item ordering
- [ ] **Order History**: Track past orders
- [ ] **Payment Integration**: Stripe/PayPal
- [ ] **Push Notifications**: Order status updates
- [ ] **Product Search**: Search and filter products
- [ ] **Categories Filter**: Filter by category
- [ ] **Favorites**: Save favorite products
- [ ] **Reviews & Ratings**: Product reviews
- [ ] **Multiple Addresses**: Delivery addresses
- [ ] **Order Tracking**: Real-time order status
- [ ] **Loyalty Program**: Points and rewards
- [ ] **Analytics**: Admin analytics dashboard
- [ ] **Bulk Upload**: CSV product import
- [ ] **Image Upload**: In-app image upload
- [ ] **Dark Mode**: Theme switching
- [ ] **Multi-language**: Internationalization

---

## 📚 Additional Resources

### Documentation Files

- **[README.md](README.md)** - Quick start guide
- **[USER_GUIDE.md](USER_GUIDE.md)** - End-user documentation
- **[ADMIN_GUIDE.md](ADMIN_GUIDE.md)** - Administrator guide
- **[APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md)** - Build instructions
- **[FIREBASE_SETUP.md](FIREBASE_SETUP.md)** - Firebase configuration

### External Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)
- [Provider Package](https://pub.dev/packages/provider)

---

## 📄 License

This project is available for educational and personal use.

---

## 👨‍💻 Development

### Running in Development

```bash
flutter run --debug
```

### Hot Reload
- Press `r` in terminal for hot reload
- Press `R` for hot restart

### Testing

```bash
# Run tests
flutter test

# Check code quality
flutter analyze
```

---

## 📞 Support

For questions or issues:

- **Developer**: Check project documentation
- **Users**: See [USER_GUIDE.md](USER_GUIDE.md)
- **Admins**: See [ADMIN_GUIDE.md](ADMIN_GUIDE.md)
- **Build Issues**: See [APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md)

---

**Version**: 1.0.0  
**Last Updated**: December 2025  
**Built with**: Flutter ❤️
