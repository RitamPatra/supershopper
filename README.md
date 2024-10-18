# SuperShopper

SuperShopper is a full-stack e-commerce app that allows users to browse products, manage a shopping cart, and securely login or sign up. The app offers a smooth shopping experience, including the ability to save the cart locally across app restarts and login sessions.

## Features

- **User Authentication**: Users can sign up, login and logout. The app validates credentials, detecting invalid email addresses or excessively short passwords. If the user logs in once and does not logout, they stay logged in even after restarting the app.
  
- **Product Browsing**: The home page lists products fetched from an API, displaying their images, titles and prices. Users can add products to their cart from the home page or the detailed product page.
  
- **Product Details**: Users can click on any product to view a larger image, detailed description and price. The product details page also includes an option to add the product to the cart.

- **Shopping Cart**: A dedicated shopping cart page allows users to view their selected products. Users can remove items from the cart, upon which the total price of the items is automatically updated. The cart is saved locally using the Hive database and is stored separately for each user.

- **Persistent Cart**: The cart is preserved even after an app restart, allowing users to resume their shopping session. Each user's cart is stored separately to maintain individual sessions.

- **Custom Icon**: The app includes a custom launcher icon for a polished look.

## Screenshots

Here are some screenshots of the SuperShopper e-commerce app:

| Login| Signup| Home Page| Product Details| Cart Page| Drawer|
|---|---|---|---|---|---|
| ![Login](https://github.com/user-attachments/assets/74d9eb4f-5fe6-4e92-8cfa-b9ae8a31aefb) | ![Signup](https://github.com/user-attachments/assets/ce6896d9-de91-48f9-8159-c38faa51a9d9) | ![Home Page](https://github.com/user-attachments/assets/22472b77-0470-440f-a69e-6289e6919d2c) | ![Product Details](https://github.com/user-attachments/assets/8b037667-4fbc-4ed3-bf84-467004087fae)| ![Cart Page](https://github.com/user-attachments/assets/75fda702-532b-4b40-8ce3-bd7bc333529a)| ![Drawer](https://github.com/user-attachments/assets/14e49e37-4a38-4fa7-a851-53bfc1fa82b0)|

## Pages

1. **Login Page**: Enables users to login with email and password.
2. **Sign-Up Page**: New users can create an account.
3. **Home Page**: Displays a list of products fetched from a dummy API. Each product has an add-to-cart button.
4. **Product Details Page**: Shows a larger image of the selected product, along with a description and price.
5. **Shopping Cart Page**: Displays the items added to the cart and the total price. Users can remove items as needed.
6. **Navigation Drawer**: Available on the home page for quick access to the logout option.

## Technologies Used

- **REST API**: Product details are fetched from a [dummy API](https://fakestoreapi.com/).
  
- **State Management**: Managed using the GetX package, ensuring smooth state transitions and data sharing across the app.

- **Local Storage**: The Hive database is used to store users' carts locally, allowing each user to maintain their cart independently.

- **Firebase Authentication**: Firebase is used to manage user login and sign-up processes, ensuring secure authentication.

- **Custom Navigation Bar**: The Google Nav Bar package is used to implement a modern and stylish bottom navigation bar.

## Dependencies

The following dependencies are used in the project as listed in the `pubspec.yaml` file:

### Main Dependencies
- **http**: `^1.2.2` - To make network requests and fetch data from a dummy API.
- **google_nav_bar**: `^5.0.6` - For a modern and customizable bottom navigation bar.
- **get**: `^4.6.6` - For state management.
- **hive**: `^2.2.3` - To store data locally for each user.
- **hive_flutter**: `^1.1.0` - For integrating Hive with Flutter.
- **firebase_core**: `^3.6.0` - To connect the app with Firebase.
- **firebase_auth**: `^5.3.1` - For handling user authentication.

### Dev Dependencies
- **hive_generator**: `^2.0.1` - To generate the necessary code for Hive's type adapters.
- **build_runner**: `^2.4.13` - To run code generation tasks for Hive.
- **flutter_launcher_icons**: `^0.14.1` - To set a custom app icon.

## Installation

### Prerequisites

Before running the app, make sure you have Flutter installed. You can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install) to set up Flutter on your system. You can set up Firebase by following [Firebase's official documentation](https://firebase.google.com/docs/flutter/setup).

### Steps

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/RitamPatra/supershopper.git
   cd supershopper
   ```

2. Install the required dependencies:

   ```bash
   flutter pub get
   ```

3. To generate the custom launcher icon, run:


   ```bash
   dart run flutter_launcher_icons
   ```

4. Run the app on an emulator or connected device:

   ```bash
   flutter run
   ```

## Usage

1. **Login** or **Sign-Up** if you don't have an account.
2. Browse the available products on the **Home Page**.
3. Add products to your **Cart** directly from the home page or the **Product Details Page**.
4. View the **Cart** to check your added items, modify the cart if required and see the total price.
5. **Logout** from the drawer when you're done.