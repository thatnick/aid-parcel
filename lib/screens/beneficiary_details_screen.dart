import 'package:flutter/material.dart';

class BeneficiaryDetailsScreen extends StatelessWidget {
  static const String routeName = '/requester-details';

  const BeneficiaryDetailsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BeneficiaryDetailsScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequesterDetails'),
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
