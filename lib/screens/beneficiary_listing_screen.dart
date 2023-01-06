import 'package:flutter/material.dart';

class BeneficiaryListingScreen extends StatelessWidget {
  static const String routeName = '/requester-listing';

  const BeneficiaryListingScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BeneficiaryListingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequesterListing'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
          child: const Text('Location'),
        ),
      ),
    );
  }
}
