import 'package:flutter_pay/views/success_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_pay/services/payment_service.dart';

class PaymentController extends GetxController {
  final PaymentService _paymentService = PaymentService();

  // Payment option selection
  RxString selectedPaymentOption = ''.obs;

  // Stripe
  Future<void> makeStripePayment(
      String cardNumber, int expMonth, int expYear, String cvc) async {
    final result = await _paymentService.createStripePaymentMethod(
        cardNumber, expMonth, expYear, cvc);
    handlePaymentResult(result);
  }

  // PayPal
  Future<void> executePayPalPayment(String orderId) async {
    final result = await _paymentService.executePayPalPayment(orderId);
    handlePaymentResult(result);
  }

  // Square
  Future<void> processSquarePayment(double amount) async {
    final result = await _paymentService.processSquarePayment(amount);
    handlePaymentResult(result);
  }

  void handlePaymentResult(Map<String, dynamic> result) {
    // Example handling
    if (result['success']) {
      Get.offAll(() => SuccessScreen());
    } else {
      Get.snackbar(
        'Payment Error',
        result['error'] ?? 'Unknown error occurred',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
      );
    }
  }
}
