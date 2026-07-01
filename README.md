# NovaMart

A production-style Flutter e-commerce application demonstrating modern Flutter development practices.

## Overview

NovaMart is a Flutter portfolio project designed to demonstrate clean architecture, state management, Firebase integration, and REST API consumption. The project follows a scalable structure suitable for modern mobile application development.

## Features

* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* REST API Integration
* Provider State Management
* Repository Pattern
* MVVM Architecture
* Product Search
* Wishlist Management
* Shopping Cart
* User Profile
* Dark Mode

## Tech Stack

* Flutter
* Dart
* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Provider
* REST API
* Shared Preferences
* HTTP

## Project Structure

```text
lib/
├── core/
├── models/
├── providers/
├── repositories/
├── services/
├── views/
├── app.dart
└── main.dart
```

## Architecture

The project follows the MVVM architecture combined with the Repository Pattern.

```text
UI
    ↓
Provider (ViewModel)
    ↓
Repository
    ↓
Firebase Services / REST API
```

## Core Modules

### Authentication

* Email and Password Authentication
* User Registration
* Secure Login and Logout

### Products

* Product Listing
* Product Search
* REST API Integration

### Wishlist

* Add and Remove Wishlist Items
* Firestore Synchronization

### Shopping Cart

* Add to Cart
* Remove from Cart
* State Management using Provider

### User Profile

* User Information
* Profile Image Upload using Firebase Storage

### Theme

* Light Theme
* Dark Theme

## Packages

* provider
* firebase_core
* firebase_auth
* cloud_firestore
* firebase_storage
* http
* shared_preferences
* cached_network_image
* image_picker

## Getting Started

```bash
flutter pub get

flutter run
```

## Future Improvements

* Stripe Payment Integration
* Order History
* Push Notifications
* Product Categories
* Admin Dashboard
* Offline Caching
* Unit Testing

## Developer

**Faizan Asif**

Flutter Developer

Email: [faizanasif3037@gmail.com](mailto:faizanasif3037@gmail.com)

GitHub: https://github.com/faizi037

LinkedIn: https://www.linkedin.com/in/faizan-asif-ba59a130b/

## License

This project is intended for learning and portfolio purposes.
