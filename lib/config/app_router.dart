import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/parcels/parcels_screen.dart';
import '../screens/beneficiary_details/beneficiary_details_screen.dart';
import '../screens/beneficiary_listing/beneficiary_listing_screen.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/filter/filter_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/location/location_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('The route is ${settings.name}');
    }

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ParcelsScreen.routeName:
        return ParcelsScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case BeneficiaryDetailsScreen.routeName:
        return BeneficiaryDetailsScreen.route();
      case BeneficiaryListingScreen.routeName:
        return BeneficiaryListingScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
