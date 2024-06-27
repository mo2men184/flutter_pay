import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successful'),
      ),
      body: Center(
        child: Text(
          'Thank you for your payment!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
