import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error';

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('There was an error');
  }
}
