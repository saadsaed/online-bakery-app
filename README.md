# 🍰 Online Bakery App

> A beautiful Flutter mobile application for browsing and ordering bakery products, with powerful admin features for product management.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Integrated-orange?logo=firebase)](https://firebase.google.com)
[![Platform](https://img.shields.io/badge/Platform-Android-green)](https://www.android.com)

---

## ✨ Features

### For Customers
- 🔐 **Secure Authentication** - Email/password login and registration
- 🛍️ **Product Catalog** - Browse beautiful bakery products
- 📱 **Modern UI** - Clean Material Design interface
- 👤 **Profile Management** - View and edit personal information
- 🔍 **Product Details** - Detailed product descriptions and images

### For Administrators
- ➕ **Add Products** - Create new product listings
- ✏️ **Edit Products** - Update product information
- 🗑️ **Delete Products** - Remove discontinued items
- 📊 **Dashboard** - Overview of product categories
- ☁️ **Real-time Updates** - Changes sync instantly via Firebase

---

## 🚀 Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0.0+)
- [Android Studio](https://developer.android.com/studio) with Android SDK
- [Firebase Account](https://console.firebase.google.com/)

### Installation

1. **Clone or navigate to the project**:
   ```bash
   cd "c:\Users\R2H WOLF\Desktop\anti project"
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable **Authentication** (Email/Password provider)
3. Enable **Firestore Database** (start in test mode)
4. Enable **Firebase Storage**

For detailed Firebase setup, see [FIREBASE_SETUP.md](FIREBASE_SETUP.md)

---

## 📱 Building APK

To build a release APK:

```bash
flutter build apk --release
```

APK location: `build/app/outputs/flutter-apk/app-release.apk`

For detailed build instructions including code signing, see [APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md)

---

## 📖 Documentation

Comprehensive guides are available for all users:

| Guide | Description |
|-------|-------------|
| **[USER_GUIDE.md](USER_GUIDE.md)** | Complete guide for end users - installation, account creation, browsing products |
| **[ADMIN_GUIDE.md](ADMIN_GUIDE.md)** | Administrator guide - managing products, Firebase setup, security |
| **[APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md)** | Building and signing APKs, troubleshooting |
| **[DOCUMENTATION.md](DOCUMENTATION.md)** | Technical documentation - architecture, APIs, deployment |
| **[FIREBASE_SETUP.md](FIREBASE_SETUP.md)** | Firebase configuration details |

---

## 🏗️ Project Structure

```
lib/
├── core/              # Theme and constants
├── models/            # Data models (Product, User)
├── services/          # Firebase services (Auth, Database)
├── screens/           # UI screens
│   ├── auth/          # Login & Signup
│   ├── dashboard/     # Dashboard
│   ├── products/      # Product list
│   ├── admin/         # Product management
│   └── profile/       # User profile
└── main.dart          # App entry point
```

---

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
  - Storage
- **State Management**: Provider
- **UI**: Material Design 3
- **Fonts**: Google Fonts

---

## 🔐 Admin Access

To set up admin access:

1. Create a user account in the app
2. Go to Firebase Console → Firestore Database
3. Find the user in the `users` collection
4. Add field: `isAdmin: true`

For detailed admin setup, see [ADMIN_GUIDE.md](ADMIN_GUIDE.md#admin-access)

---

## 📸 Screenshots

*Screenshots will be added here in future updates*

---

## 🔮 Future Features

- 🛒 Shopping cart functionality
- 💳 Payment integration (Stripe/PayPal)
- 📦 Order tracking
- 🔔 Push notifications
- ⭐ Product favorites
- 💬 Reviews and ratings
- 🔍 Advanced search and filters

---

## 🐛 Troubleshooting

Having issues? Check these resources:

- **Build problems**: See [APK_BUILD_GUIDE.md](APK_BUILD_GUIDE.md#troubleshooting)
- **User issues**: See [USER_GUIDE.md](USER_GUIDE.md#troubleshooting)
- **Admin issues**: See [ADMIN_GUIDE.md](ADMIN_GUIDE.md#troubleshooting)
- **General issues**: See [DOCUMENTATION.md](DOCUMENTATION.md#troubleshooting)

Common fixes:
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

---

## 📄 Version

**Current Version**: 1.0.0+1

See `pubspec.yaml` for dependencies and version information.

---

## 🤝 Contributing

This project is currently maintained for educational purposes. For feature requests or bug reports, please contact the development team.

---

## 📞 Support

- **Users**: See [USER_GUIDE.md](USER_GUIDE.md)
- **Admins**: See [ADMIN_GUIDE.md](ADMIN_GUIDE.md)
- **Developers**: See [DOCUMENTATION.md](DOCUMENTATION.md)

---

## 📱 Requirements

- **Android**: 5.0 (API 21) or higher
- **iOS**: Coming soon
- **Internet**: Required for all features

---

**Made with Flutter** ❤️ | **Powered by Firebase** 🔥

