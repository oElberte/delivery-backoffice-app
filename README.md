# Delivery Backoffice App

A modern delivery service backoffice application, made to suit this [Delivery app](https://github.com/oElberte/delivery-app), built with Flutter Web using Modular Architecture with MobX for state management.

## 📱 About

Delivery Backoffice App is a comprehensive web application that allows restaurant administrators to manage their delivery service operations. The app provides an intuitive interface for managing products, payment types, and orders. With a clean and responsive design, administrators can easily monitor and control their delivery business from any device.

## 🏗️ Architecture

This project follows **Modular Architecture with MobX** principles:

- **MobX**: Manages state and business logic, separating it from the UI
- **Flutter Modular**: Handles dependency injection and routing
- **Repository Pattern**: Abstracts data sources, providing a clean API for the domain layer
- **Service Layer**: Implements business logic and connects repositories with controllers
- **Feature-based Structure**: Organized by modules rather than technical concerns

## 🛠️ Tech Stack

- **Flutter**: UI framework
- **Dart**: Programming language
- **MobX**: State management
- **Flutter Modular**: Dependency injection and routing
- **Dio**: HTTP client for API communication
- **Flutter Dotenv**: Environment configuration
- **Validatorless**: Form validation
- **Brasil Fields**: Brazilian-specific form fields and validations
- **Loading Animation Widget**: Loading animations
- **Awesome Snackbar Content**: Enhanced snackbar notifications

## 🌟 Features

- User authentication (admin login)
- Product management (add, edit, delete)
- Payment type management (add, edit, delete)
- Order tracking and management
- Responsive design for desktop and mobile views
- Secure API communication
- Form validation

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=2.19.5 <3.0.0)
- Dart SDK
- Web browser
- Backend API service running

### Environment Setup

1. Clone the repository
2. Create a `.env` file in the root directory with the following variables:
   ```
   BACKEND_BASE_URL=your_api_base_url
   ```
3. Run `flutter pub get` to install dependencies
4. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate MobX code
5. Run `flutter run -d chrome` to start the application in development mode

## 📂 Project Structure

```
lib/
├── main.dart          # Entry point
├── src/
│   ├── app_module.dart # Main module configuration
│   ├── app_widget.dart # Main app widget
│   ├── core/          # Core functionality, configs, UI components, exceptions
│   │   ├── env/       # Environment configuration
│   │   ├── exceptions/ # Custom exceptions
│   │   ├── extensions/ # Dart extensions
│   │   ├── global/    # Global context and state
│   │   ├── rest_client/ # API client configuration
│   │   ├── storage/   # Local storage
│   │   ├── ui/        # Shared UI components and themes
│   ├── dto/           # Data transfer objects
│   ├── models/        # Data models
│   ├── modules/       # Feature modules
│   │   ├── core/      # Core module
│   │   ├── home/      # Home screen
│   │   ├── login/     # Authentication
│   │   ├── orders/    # Order management
│   │   ├── payment_type/ # Payment type management
│   │   ├── products/  # Product management
│   │   ├── template/  # Layout templates
│   ├── repositories/  # Data repositories
│   ├── services/      # Business logic services
```

## 🔐 Security

This app implements secure authentication and token-based API communication to ensure data protection and secure administrative operations.
