import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pay/controllers/payment_controller.dart';
import 'package:flutter_pay/views/payment_details_screen.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController _paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _paymentController.selectedPaymentOption.value = 'Stripe';
                Get.to(() => PaymentDetailsScreen());
              },
              child: Text('Pay with Stripe'),
            ),
            ElevatedButton(
              onPressed: () {
                _paymentController.selectedPaymentOption.value = 'PayPal';
                Get.to(() => PaymentDetailsScreen());
              },
              child: Text('Pay with PayPal'),
            ),
            ElevatedButton(
              onPressed: () {
                _paymentController.selectedPaymentOption.value = 'Square';
                Get.to(() => PaymentDetailsScreen());
              },
              child: Text('Pay with Square'),
            ),
          ],
        ),
      ),
    );
  }
}
