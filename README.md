# Business Card Scanner App

A Flutter application that recreates the core functionality of the BusinessCode app, focusing on user authentication and business card management with local storage.

## Features

- ✅ **User Authentication**
  - Sign Up with email and password
  - Sign In with credential verification
  - Sign Out functionality
  - Session management with persistent login

- ✅ **Business Card Management**
  - Add new business cards (mock scanning)
  - View card details
  - Save cards locally
  - View all saved cards
  - Edit and update cards
  - Delete cards

- ✅ **Local Storage**
  - Hive database for structured data
  - SharedPreferences for session management
  - Offline-first architecture
  - No backend required

- ✅ **State Management**
  - BLoC pattern implementation
  - Clean architecture with features-based structure
  - Proper error handling with Either pattern

## Tech Stack

- **Framework:** Flutter 3.9.2+
- **State Management:** flutter_bloc ^8.1.6
- **Local Storage:** 
  - hive ^2.2.3
  - hive_flutter ^1.1.0
  - shared_preferences ^2.3.2
- **Routing:** go_router ^10.0.0
- **Utilities:**
  - uuid ^4.5.1 (unique ID generation)
  - crypto ^3.0.5 (password hashing)
  - equatable ^2.0.5 (value equality)
  - dartz ^0.10.1 (functional programming)

## Project Structure

```
lib/
├── core/
│   ├── constants/          # App constants
│   ├── error/             # Error handling (Failures)
│   ├── services/          # Core services (Storage, Localization)
│   ├── theme/             # App theme
│   └── utils/             # Utility functions (Validators, Password Helper)
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── mappers/   # Entity-Model mappers
│   │   │   └── repositories/  # Repository implementations
│   │   └── domain/
│   │       ├── entities/  # Domain entities
│   │       └── repositories/  # Repository interfaces
│   └── home/
│       ├── data/
│       │   ├── models/    # Hive models (User, BusinessCard)
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   └── repositories/
│       └── presentation/
│           ├── blocs/     # BLoC state management
│           └── screens/   # UI screens
├── router/                # App routing
└── main.dart             # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.9.0 or higher
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mosalah30/Business-Code-.git
   cd Business-Code-
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

**Android APK:**
```bash
flutter build apk --release
```
The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

**iOS:**
```bash
flutter build ios --release
```

## Usage

### First Time Setup

1. Launch the app
2. You'll see the splash screen with authentication check
3. If not logged in, you'll be redirected to the Sign In screen
4. Tap "Sign Up" to create a new account
5. Enter your name, email, and password (minimum 6 characters)
6. After successful registration, you'll be logged in automatically

### Managing Business Cards

1. From the dashboard, tap the "+" button to add a new card
2. The app will simulate card scanning (mock implementation)
3. Review and edit the card details
4. Tap "Save" to store the card locally
5. View all your saved cards in the card list
6. Tap on any card to view details or edit

### Sign Out

- Tap the logout icon in the app bar to sign out
- Your data remains stored locally and will be available when you sign in again

## Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

- **Presentation Layer:** UI components, BLoCs, and screens
- **Domain Layer:** Business logic, entities, and repository interfaces
- **Data Layer:** Repository implementations, models, and data sources

### Key Design Patterns

- **BLoC Pattern:** For state management and business logic
- **Repository Pattern:** For data access abstraction
- **Either Pattern:** For functional error handling
- **Factory Pattern:** For object creation (User, BusinessCard)
- **Mapper Pattern:** For converting between entities and models

## Data Models

### User
- ID (UUID)
- Name
- Email (unique, case-insensitive)
- Hashed Password (SHA-256)
- Created At

### Business Card
- ID (UUID)
- Name
- Company
- Phone
- Email
- Address
- Image URL (optional)
- User ID (owner)
- Created At
- Updated At

## Security

- Passwords are hashed using SHA-256 before storage
- Email validation with regex pattern
- Session management with secure token storage
- No sensitive data exposed in logs

## Testing

Run tests with:
```bash
flutter test
```

## Known Limitations

- Camera scanning is mocked (no actual OCR implementation)
- No backend synchronization
- No image upload functionality (placeholder only)
- Single device usage (no cloud sync)

## Future Enhancements

- [ ] Implement actual camera scanning with OCR
- [ ] Add image capture and storage
- [ ] Cloud backup and sync
- [ ] Export cards to contacts
- [ ] Share cards via QR code
- [ ] Dark mode support
- [ ] Multi-language support
- [ ] Card categories and tags
- [ ] Search and filter functionality

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is created for educational and demonstration purposes.

## Author

**Mohamed Salah**
- GitHub: [@mosalah30](https://github.com/mosalah30)

## Acknowledgments

- Inspired by the BusinessCode app
- Built with Flutter and the amazing Flutter community packages
- Clean Architecture principles by Robert C. Martin

---

**Note:** This is a demonstration project showcasing Flutter development skills, clean architecture, and local storage implementation. The app works completely offline and requires no backend setup.
