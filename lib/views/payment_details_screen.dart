import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pay/controllers/payment_controller.dart';
import 'package:flutter_pay/views/success_screen.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final PaymentController _paymentController = Get.find();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController expYearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Payment Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              controller: expMonthController,
              decoration: InputDecoration(labelText: 'Expiration Month'),
            ),
            TextField(
              controller: expYearController,
              decoration: InputDecoration(labelText: 'Expiration Year'),
            ),
            TextField(
              controller: cvcController,
              decoration: InputDecoration(labelText: 'CVC'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                if (_paymentController.selectedPaymentOption.value ==
                    'Stripe') {
                  await _paymentController.makeStripePayment(
                    cardNumberController.text,
                    int.parse(expMonthController.text),
                    int.parse(expYearController.text),
                    cvcController.text,
                  );
                } else if (_paymentController.selectedPaymentOption.value ==
                    'PayPal') {
                  // Implement PayPal payment handling
                } else if (_paymentController.selectedPaymentOption.value ==
                    'Square') {
                  // Implement Square payment handling
                }
              },
              child: Text('Submit Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
