import 'package:get/get.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:square_in_app_payments/in_app_payments.dart' as Square;
import '../consts.dart';

class PaymentService extends GetxService {
  // Stripe
  Future<Map<String, dynamic>> createStripePaymentMethod(
      String cardNumber, int expMonth, int expYear, String cvc) async {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: Constants.stripePublishableKey,
        androidPayMode: 'test', // 'test' or 'production'
      ),
    );

    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(
          card: CreditCard(
            number: cardNumber,
            expMonth: expMonth,
            expYear: expYear,
            cvc: cvc,
          ),
        ),
      );

      // Replace with actual Stripe payment method creation logic
      // Example: Handle response from Stripe API
      if (paymentMethod != null) {
        return {'success': true, 'paymentMethodId': paymentMethod.id};
      } else {
        return {'success': false, 'error': 'Failed to create payment method'};
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // PayPal
  Future<Map<String, dynamic>> executePayPalPayment(String orderId) async {
    try {
      var result = await FlutterPaypalCheckout.startPayPalCheckout(
        clientId: Constants.paypalClientId,
        environment:
            PaypalEnvironment.sandbox, // or PaypalEnvironment.production
        currency: 'USD', // Replace with your currency
        amount: '10.0', // Replace with your amount
        captureIntent: CaptureIntent.authorize, // or CaptureIntent.capture
        enablePayNow: true, // Enable or disable Pay Now button
      );

      if (result['status'] == 'success') {
        return {'success': true, 'orderId': result['orderId']};
      } else {
        return {'success': false, 'error': result['error'] ?? 'Unknown error'};
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // Square
  Future<Map<String, dynamic>> processSquarePayment(double amount) async {
    Square.InAppPayments.setSquareApplicationId(Constants.squareApplicationId);

    try {
      var result = await Square.InAppPayments.startCardEntryFlow(
        onCompleteCardEntry: (result) {
          // Handle result from Square SDK
          if (result.isSuccess) {
            return {'success': true, 'paymentId': result.paymentId};
          } else {
            return {'success': false, 'error': result.errorCode};
          }
        },
        onCardNonceRequestSuccess: (CardDetails result) {},
        onCardEntryCancel: () {},
      );

      // Replace with actual Square payment processing logic
      // Example: Handle result from Square SDK
      return result;
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }
}
