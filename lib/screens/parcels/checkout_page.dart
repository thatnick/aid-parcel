import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        elevation: 0,
        scrolledUnderElevation: 4,
        centerTitle: false,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.maybePop(context),
            );
          },
        ),
      ),
      body: const Text('You are at the checkout'),
    );
  }
}
