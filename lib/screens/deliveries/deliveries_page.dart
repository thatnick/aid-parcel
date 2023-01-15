import 'package:flutter/material.dart';

import '../error/error_page.dart';
import '../main/destination_view.dart';

class DeliveriesPage extends StatelessWidget {
  static final DestinationView destinationView = DestinationView(
    index: 2,
    routeBuilder: _buildRoute,
  );

  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliveries'),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          Text('You are at the deliveries page'),
        ],
      ),
    );
  }

  static Widget _buildRoute(String routeName) {
    switch (routeName) {
      case '/':
        return const DeliveriesPage();
      default:
        return const ErrorPage();
    }
  }
}
