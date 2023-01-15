import 'package:flutter/material.dart';

import '../error/error_page.dart';
import '../main/destination_view.dart';

class HomePage extends StatelessWidget {
  static final DestinationView destinationView = DestinationView(
    index: 0,
    routeBuilder: _buildRoute,
  );

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          Text('You are home'),
        ],
      ),
    );
  }

  static Widget _buildRoute(String routeName) {
    switch (routeName) {
      case '/':
        return const HomePage();
      default:
        return const ErrorPage();
    }
  }
}
