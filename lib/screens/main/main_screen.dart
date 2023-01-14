import 'package:flutter/material.dart';

import 'nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFA),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
      ),
      body: Navigator(
        key: NavBar.navigatorKey,
        onGenerateRoute: NavBar.onGenerateRoute,
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
