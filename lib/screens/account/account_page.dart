import 'package:flutter/material.dart';

import '../error/error_page.dart';
import '../main/destination_view.dart';

class AccountPage extends StatelessWidget {
  static final DestinationView destinationView = DestinationView(
    index: 3,
    routeBuilder: _buildRoute,
  );

  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFA),
      appBar: AppBar(
        title: const Text('Account'),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          Text('You are at the account page'),
        ],
      ),
    );
  }

  static Widget _buildRoute(String routeName) {
    switch (routeName) {
      case '/':
        return const AccountPage();
      default:
        return const ErrorPage();
    }
  }
}
