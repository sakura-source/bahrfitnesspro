BahrFitnessPRO 🏋️‍♂️🌊

Redefining Fitness and Nutrition Management

Welcome to BahrFitnessPRO, the revolutionary fitness platform crafted to outshine MyFitnessPal. With advanced AI integrations, a sleek user interface, and culturally localized features, BahrFitnessPRO empowers you to take control of your health journey while delivering a seamless and engaging experience.

📚 Table of Contents
	1.	Introduction
	2.	Vision and Goals
	3.	Key Features
	4.	Technologies Used
	5.	Project Structure
	6.	Installation
	7.	Usage
	8.	Testing
	9.	CI/CD Pipeline
	10.	Firebase Setup
	11.	Contributing
	12.	License
	13.	Contact

🌟 Introduction

BahrFitnessPRO is your ultimate companion for fitness, nutrition, and health management. With a focus on AI-powered personalization, progress tracking, and holistic wellness, the platform brings a comprehensive solution for trainers, athletes, and fitness enthusiasts globally.

🚀 Vision and Goals

Vision

To be the world’s most comprehensive and innovative fitness platform, outshining competitors by offering tailored, data-driven, and culturally inclusive solutions.

Goals
	1.	Provide AI-powered fitness and nutrition plans for personalized experiences.
	2.	Integrate advanced analytics for tracking and real-time feedback.
	3.	Enable seamless communication between trainers and clients.
	4.	Empower holistic health management, including mental wellness and hormonal tracking.
	5.	Localize content to resonate with diverse audiences, particularly in the MENA region.

🏆 Key Features

1. Personalized Training and Nutrition Plans 🎯
	•	AI-powered workout and meal plans tailored to user goals, fitness levels, and preferences.
	•	Adaptive programming that evolves with user progress.

2. Comprehensive Progress Tracking 📊
	•	Interactive dashboards for metrics such as weight, calories, and muscle mass.
	•	Long-term trend analysis and weekly progress insights.

3. Trainer-Client Interaction 🤝
	•	Real-time chat and video call integration for seamless coaching.
	•	Session booking and management tools.

4. Diet Plan Management 🍽️
	•	Track calorie intake and macronutrient breakdown.
	•	AI-suggested meal plans tailored to fitness goals.

5. Gamified Fitness Challenges 🏆
	•	Leaderboards and gamified challenges to boost motivation.
	•	Fully customizable challenges for trainers and groups.

6. Body Stats and Progress Photos 📸
	•	Visualize key metrics like weight and fat percentage.
	•	Compare progress photos with side-by-side viewing.

7. Hormone Management 💉 (Upcoming)
	•	Track hormone doses, schedules, benefits, and risks.
	•	Medical warnings and AI-driven expert recommendations.

8. Mental Wellness Tools 🧘
	•	Tools for stress tracking, guided meditation, and relaxation.

9. Localization 🌍
	•	Multi-language support, including Arabic and Kuwaiti dialect.
	•	Content tailored for regional diets and preferences.

10. Integration with Wearables 📲
	•	Sync data from Fitbit, Apple Watch, and other devices.
	•	Display live stats like heart rate and calories burned.

🛠️ Technologies Used

Frontend
	•	Flutter: For seamless cross-platform mobile app development.
	•	Dart: The primary programming language for BahrFitnessPRO.

Backend
	•	Firebase: Authentication, Realtime Database, Cloud Functions, and Cloud Storage.
	•	Google Cloud AI: AI-driven recommendations and analytics.

AI Integration
	•	TensorFlow: Custom AI models for fitness-specific recommendations.
	•	Google Generative AI SDK: For real-time personalization and predictions.

📂 Project Structure

lib/
├── main.dart                  # App entry point
├── screens/                   # UI Screens
├── widgets/                   # Reusable widgets
├── services/                  # Backend integrations
├── models/                    # Data models
assets/                        # Static assets (images, fonts, etc.)
tests/                         # Unit and integration tests

⚙️ Installation
	1.	Clone the repository:

git clone https://github.com/Al-Awsaty/bahrfitnesspro.git
cd bahrfitnesspro


	2.	Install dependencies:

flutter pub get


	3.	Run the app:

flutter run

📋 Usage
	•	Login as a trainer or client to access tailored tools.
	•	Create workout and diet plans personalized for users.
	•	Track progress and visualize trends in the dashboard.

🧪 Testing

Unit Tests

Run unit tests for services:

flutter test test/services

UI Tests

Run UI tests for screens:

flutter test test/screens

🔄 CI/CD Pipeline
	•	Automated workflows using GitHub Actions:
	•	Runs lint checks, unit tests, and UI tests.
	•	Deploys to Firebase Hosting.

🔥 Firebase Setup
	1.	Create a Firebase project.
	2.	Download configuration files:
	•	google-services.json for Android.
	•	GoogleService-Info.plist for iOS.
	3.	Configure build files as outlined in the Firebase Documentation.

🤝 Contributing

We welcome contributions!
	•	Fork the repository and create a feature branch.
	•	Submit pull requests with detailed descriptions.

📄 License

This project is licensed under the Apache 2.0 License.

📞 Contact

For support or inquiries:
	•	Email: amir@alawsaty.com
	•	GitHub: github.com/Al-Awsaty/bahrfitnesspro
	•	Twitter: @AmirElokdsha

🌟 Ready to take your fitness journey to the next level? Join BahrFitnessPRO today! 🚀

## New Features and Screens

### Authentication
- **Login Screen**: Email/password login form with Firebase Auth.
- **Signup Screen**: Registration form with email and password fields.
- **Forgot Password Screen**: Reset password functionality.

### Dashboard
- **Home Screen**: Display progress cards (calories, steps, workouts) and a carousel for motivational tips.

### Tracking
- **Workout Tracking Screen**: Log completed workouts.
- **Diet Tracking Screen**: Track meals and calorie intake.

### User Profile
- **Profile Screen**: Edit user details (name, email, weight, height) and upload profile pictures.

### Advanced Features
- **Hormone Management Screen**: Manage doses, schedules, and track benefits/risks.
- **Mental Wellness Screen**: Tools for stress and mood tracking, guided meditation, and relaxation content.
- **Gamified Challenges Screen**: Create challenges and display leaderboards.

### Settings
- **Settings Screen**: Toggle language (English/Arabic) and theme (dark/light).

### Reusable Widgets
- **Custom Button**: A customizable button with animations.
- **Progress Card**: For displaying stats like calories burned.
- **Diet Card**: For showing meals.
- **Line Chart**: For progress tracking (e.g., weight).
- **Bar Chart**: For weekly calories.
- **Loading Indicator**: A sleek loading spinner.
- **Error Widget**: For displaying errors gracefully.

### Firebase Integration
- **Authentication**: Email/password login and signup, password recovery via email.
- **Firestore**: Store user data (e.g., weight, progress, goals), workout and meal logs.
- **Cloud Storage**: Save progress photos and profile pictures.
- **App Check**: Enable App Check for security.

### Navigation
- **State Management**: Use `flutter_riverpod` or `provider` for state management.
- **Bottom Navigation Bar**: Switch between Dashboard, Profile, and Settings.

### Animations
- **Screen Transitions**: Use `flutter_animations` for transitions between screens.
- **Hover Effects**: Add hover effects for buttons and cards (on supported platforms).

### Testing
- **Unit Tests**: Write unit tests for `auth_service.dart` and `firestore_service.dart`.
- **UI Tests**: Write UI tests for `login_screen.dart` and `home_screen.dart`.

### CI/CD Pipeline
- **GitHub Actions**: Automate workflows to run `flutter test`, build APK and IPA files, and deploy the web version to Firebase Hosting.

### Deployment
- **Build APK for Android**:
  ```bash
  flutter build apk
  ```

- **Build IPA for iOS**:
  ```bash
  flutter build ios
  ```

- **Deploy the web version**:
  ```bash
  flutter build web
  firebase deploy --only hosting
  ```

### Deliverables
- A fully functional BahrFitnessPRO app with:
  - Authentication.
  - Tracking (workouts, diet, hormones).
  - Gamified challenges.
  - Progress tracking and analytics.
  - Ready-to-deploy builds for Android, iOS, and Web.
  - Comprehensive documentation in README.md.

## Overview of the `bahrfitnesspro` Repository

### Project Structure

- `lib/main.dart`: Initializes the app and sets up the home screen.
- `lib/screens/`: Contains various screens like `login_screen.dart`, `signup_screen.dart`, `home_screen.dart`, and more.
- `lib/models/user_model.dart`: Defines the `User` class.
- `lib/providers/user_provider.dart`: Handles user-related operations.
- `lib/services/`: Contains services like `auth_service.dart`, `firestore_service.dart`, and more.
- `lib/theme.dart`: Defines the app's theme.
- `README.md`: Provides detailed information about the project, including installation and usage instructions.

### Getting Started

To get started, follow the instructions in the `README.md`.

### Completed Tasks
- **Authentication**: Login, Signup, and Forgot Password screens are implemented.
- **Dashboard**: Home screen with progress cards and motivational tips carousel.
- **Tracking**: Workout and Diet Tracking screens are implemented.
- **User Profile**: Profile screen for editing user details and uploading profile pictures.
- **Advanced Features**: Hormone Management, Mental Wellness, and Gamified Challenges screens are implemented.
- **Settings**: Settings screen for toggling language and theme.
- **Reusable Widgets**: Custom Button, Progress Card, Diet Card, Line Chart, Bar Chart, Loading Indicator, and Error Widget are implemented.
- **Firebase Integration**: Authentication, Firestore, Cloud Storage, and App Check are set up.
- **Navigation**: State management using `flutter_riverpod` or `provider`, and Bottom Navigation Bar are implemented.
- **Animations**: Screen transitions and hover effects are added.
- **Testing**: Unit tests for services and UI tests for screens are written.
- **CI/CD Pipeline**: GitHub Actions workflows for running tests, building APK and IPA files, and deploying the web version to Firebase Hosting are set up.
- **Deployment**: Instructions for building APK for Android, IPA for iOS, and deploying the web version are provided.

### Next Steps
- **AI Integration**: Implement AI-driven recommendations and analytics using TensorFlow and Google Generative AI SDK.
- **Localization**: Ensure multi-language support, including Arabic and Kuwaiti dialect, and tailor content for regional diets and preferences.
- **Wearables Integration**: Sync data from Fitbit, Apple Watch, and other devices, and display live stats like heart rate and calories burned.
- **Additional Testing**: Write more unit and UI tests to cover all features and edge cases.
- **Documentation**: Update and expand the documentation to include detailed usage instructions, API references, and developer guides.
- **User Feedback**: Collect and incorporate user feedback to improve the app's usability and functionality.
