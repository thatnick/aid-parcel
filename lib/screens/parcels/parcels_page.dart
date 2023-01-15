import 'package:flutter/material.dart';

import '../error/error_page.dart';
import '../main/destination_view.dart';
import 'checkout_page.dart';

class ParcelsPage extends StatelessWidget {
  static final DestinationView destinationView = DestinationView(
    index: 1,
    routeBuilder: _buildRoute,
  );

  const ParcelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcels'),
        elevation: 0,
        scrolledUnderElevation: 4,
        centerTitle: false,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Text('You are at the parcels page'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }

  static Widget _buildRoute(String routeName) {
    switch (routeName) {
      case '/':
        return const ParcelsPage();
      case '/checkout':
        return const CheckoutPage();
      default:
        return const ErrorPage();
    }
  }
}
