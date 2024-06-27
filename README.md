# 📱 Payments Integration Example using Flutter and GetX

This Flutter project demonstrates integrating Stripe, PayPal, and Square payments using GetX for state management.

## 🚀 Features

- **🔄 Payment Option Switching**: Switch seamlessly between Stripe, PayPal, and Square payment methods within the app.
- **🔒 Secure Integration**: Ensures secure payment processing with API keys stored in Firebase Cloud Functions.
- **📊 State Management with GetX**: Efficient state management with GetX for reactive programming and dependency injection.
- **⚠️ Error Handling**: Manages payment failures and network errors with retry mechanisms and detailed error logging.
- **🛠️ Scalable Backend**: Node.js Firebase Cloud Function (`payments.js`) handles payment webhooks for scalability.

## 🏗️ Project Structure

- `lib/`
  - `controllers/`
    - `payment_controller.dart`: Manages payment logic and state with GetX
  - `services/`
    - `payment_service.dart`: Service to interact with payment gateways
  - `views/`
    - `payment_screen.dart`: UI for selecting payment options
    - `payment_details_screen.dart`: UI for entering payment details
    - `success_screen.dart`: UI for displaying successful payment confirmation
  - `constants.dart`: Constants file for API keys and configurations
  - `main.dart`: Entry point of the application

## 📋 Usage

- The app starts with a selection screen where users can choose between Stripe, PayPal, or Square for payment.
- Enter payment details in the respective screens, handled securely via Firebase Cloud Functions.
- The app provides feedback on successful payments and error messages for failed transactions.

## 💻 `payments.js` (Firebase Cloud Function)

A Node.js script deployed as a Firebase Cloud Function (`payments.js`) to handle payment webhooks securely.

## Features

- **Webhook Handling**: Receives and processes webhook notifications from Stripe, PayPal, and Square.
- **Secure Integration**: Ensures sensitive payment information is processed securely on the server.
- **Scalable Architecture**: Built on Firebase Cloud Functions for scalability and reliability.

## Deployment

Deploy `payments.js` to Firebase Cloud Functions using the Firebase CLI:

```bash
firebase deploy --only functions


## 💡 Contributing

Contributions are welcome! Please create an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev/)
- [GetX](https://pub.dev/packages/get)
- [Stripe](https://stripe.com/)
- [PayPal Checkout](https://developer.paypal.com/docs/checkout/)
- [Square](https://developer.squareup.com/)

## About the Developer 🌟

- **👨‍💻 Mo'men M.** is passionate about creating efficient and user-friendly mobile applications. With expertise in Flutter and Firebase, Mo'men focuses on delivering robust solutions that enhance user experiences and meet business objectives.
