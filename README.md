# iFood - Food Delivery App

iFood is a minimalistic and comprehensive platform for users to browse restaurants, view food items, manage their cart, and handle orders seamlessly. It leverages Firebase for backend services, providing authentication and database management.

## Features

- User authentication (login and registration)
- Food browsing with detailed views
- Cart management and order processing
- Dark mode support for better accessibility.
- Easy navigation between screens

## Screenshots

| **Home screen** | **Food screen** | **Cart screen** | **Login light** | **Check out** |
| --- | --- | --- | --- | --- |
| ![Home screen](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/home.png) | ![Food screen](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/food_light.png) | ![Cart screen](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/cart.png) | ![Login light](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/login_light.png) | ![ Checkout](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/payment.png) |

| **AppBar collapsed** | **Signup screen** | **Empty Cart** | **Delivery** | **About screen** | 
| --- | --- | --- | --- | --- |
| ![AppBar collapsed](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/collapsed_appbar_light.png) | ![Login screen](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/signup.png) | ![Empty Cart](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/empty_cart_light.png) | ![Delivery](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/delivery.png) | ![About screen](https://github.com/MrMDrX/iFood/blob/main/readme-assets/screenshots/about_light.png) |

## Getting Started

### Prerequisites

- Flutter SDK [official Flutter website](https://flutter.dev/docs/get-started/install).
- Firebase account and project set up

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/MrMDrX/iFood.git
   ```

2. Navigate into the project directory:

   ```bash
   cd iFood
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Configure Firebase using FlutterFire:
   - Follow the official [FlutterFire setup guide](https://firebase.flutter.dev/docs/overview/) to integrate Firebase with your Flutter project.
   - Create a new Firebase project in the Firebase console.
   - Add the necessary Firebase services (Authentication, Firestore, etc.) to your project.
   - Install Firebase Tools : ```npm i -g firebase-tools``` 
   - Run the `firebase login` command to authenticate with Firebase.
   - Install the CLI if not already done : ```dart pub global activate flutterfire_cli```
   - Run the `configure` command, select a Firebase project and platforms : ```flutterfire configure```

5. Run the application:

   ```bash
   flutter run
   ```

## Contributing

We welcome contributions! If you have suggestions or improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.