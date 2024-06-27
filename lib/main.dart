import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pay/controllers/payment_controller.dart';
import 'package:flutter_pay/views/payment_screen.dart';
import 'package:flutter_pay/views/success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payments Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => PaymentScreen()),
        GetPage(name: '/success', page: () => SuccessScreen()),
      ],
    );
  }
}
