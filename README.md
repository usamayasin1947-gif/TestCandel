SwiftUI Login and Dashboard App

This is a SwiftUI-based iOS app featuring a login screen with email and password validation, Passkey sign-in functionality, and a dashboard with static data.

**Features**
Login Screen UI: The login screen includes text fields for email and password, and a button to sign in.\n
Passkey Sign-In: An option to sign in using Passkey (static data for now).
Dashboard Main Screen: Once logged in, the user is directed to the main dashboard with static content.
Validation: Email and password validation logic on the login screen


**Prerequisites**
Before you can run this app, make sure you have the following:
Xcode (latest version)
iOS 15.5 or later

**Installation**
git clone https://github.com/usamayasin1947-gif/TestCandel.git
Open the project in Xcode:open TestCandel.xcodeproj

**Features and Functionality**

**Login Screen**
UI: The login screen consists of:
Email field (TextField)
Password field (SecureField)
Sign-in button (performs login action)
Sign in with Passkey button (toggles between login and passkey sign-in)

**Validation Logic**
Email Validation: The entered email must match a valid email format.
Password Validation: Password must meet specified criteria (e.g., minimum length, alphanumeric).
If the email or password is invalid, an error message will be displayed using a Snackbar.

**Passkey Sign-In**
Option to use Passkey for authentication.
This feature will be implemented statically for now, but can be expanded in the future.

**Dashboard Main Screen**
After a successful login, the user is directed to the dashboard with static data.
Features a welcome message, user profile pictures, and several action buttons.

**Navigation Flow**
The app uses NavigationView for backward compatibility to manage the navigation between the login and dashboard screens.
After a successful login, users cannot go back to the login screen using the back button.

**SnackbarManager Implementation**
This manager will handle the logic for displaying Snackbar messages globally.


