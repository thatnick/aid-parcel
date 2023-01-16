import 'package:flutter/material.dart';

import '../error/error_page.dart';
import '../main/destination_view.dart';
import 'beneficiary_scroll.dart';
import 'featured_carousel.dart';

class HomePage extends StatefulWidget {
  static final DestinationView destinationView = DestinationView(
    index: 0,
    routeBuilder: _buildRoute,
  );

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static Widget _buildRoute(String routeName) {
    switch (routeName) {
      case '/':
        return const HomePage();
      default:
        return const ErrorPage();
    }
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFA),
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FeaturedCarousel(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 8, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Afghanistan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            BeneficiaryScroll(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 8, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ukraine',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            BeneficiaryScroll(),
          ],
        ),
      ),
    );
  }
}
