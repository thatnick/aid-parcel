import 'package:flutter/material.dart';

class ParcelsScreen extends StatelessWidget {
  static const String routeName = '/parcels';

  const ParcelsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ParcelsScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcels'),
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
