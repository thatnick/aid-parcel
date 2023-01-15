import 'package:flutter/material.dart';

import '../account/account_page.dart';
import '../deliveries/deliveries_page.dart';
import '../home/home_page.dart';
import '../parcels/parcels_page.dart';
import 'nav_bar.dart';
import 'destination_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  static List<DestinationView> destinationViews = [
    HomePage.destinationView,
    ParcelsPage.destinationView,
    DeliveriesPage.destinationView,
    AccountPage.destinationView,
  ];

  int selectedDestinationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator =
            destinationViews[selectedDestinationIndex]
                .navigatorKey
                .currentState!;
        if (!navigator.canPop()) {
          return true;
        }
        navigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFCFA),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: destinationViews.map((DestinationView destinationView) {
              if (destinationView.index == selectedDestinationIndex) {
                return Offstage(offstage: false, child: destinationView);
              } else {
                return Offstage(child: destinationView);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: NavBar(
            selectedDestinationIndex: selectedDestinationIndex,
            onTabTap: (int index) {
              setState(() => selectedDestinationIndex = index);
            }),
      ),
    );
  }
}
