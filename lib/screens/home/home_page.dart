import 'package:flutter/material.dart';

import '../../models/beneficiary_model.dart';
import '../../models/country_model.dart';
import '../error/error_page.dart';
import '../main/destination_view.dart';
import 'beneficiary_card.dart';
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
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: const Color(0xFFFFFCFA),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FeaturedCarousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Country.sampleCountries.length,
                    itemBuilder: (context, index) {
                      return BeneficiaryBox(
                          beneficiary: Beneficiary.sampleBeneficiaries[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
