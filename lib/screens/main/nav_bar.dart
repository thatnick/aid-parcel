import 'package:aid_connect/screens/error/error_screen.dart';
import 'package:flutter/material.dart';

import '../account/account_tab.dart';
import '../deliveries/deliveries_tab.dart';
import '../home/home_tab.dart';
import '../parcels/parcels_tab.dart';
import 'nav_bar_icon.dart';

class NavBar extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _buildPageRoute(const HomeTab());
      case "/parcels":
        return _buildPageRoute(const ParcelsTab());
      case "/deliveries":
        return _buildPageRoute(const DeliveriesTab());
      case "/account":
        return _buildPageRoute(const AccountTab());
      default:
        return _buildPageRoute(const ErrorScreen());
    }
  }

  static PageRouteBuilder<dynamic> _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

class _NavBarState extends State<NavBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      selectedItemColor: const Color(0xFF025949),
      unselectedItemColor: const Color(0xFF025949),
      backgroundColor: const Color(0xFFE9F2F0),
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavBarItem(label: 'Home', assetName: 'assets/icons/home.svg'),
        _buildNavBarItem(
            label: 'Parcels', assetName: 'assets/icons/parcel.svg'),
        _buildNavBarItem(
            label: 'Deliveries', assetName: 'assets/icons/lorry.svg'),
        _buildNavBarItem(
            label: 'Account', assetName: 'assets/icons/person.svg'),
      ],
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        NavBar.navigatorKey.currentState
            ?.pushReplacementNamed(HomeTab.routeName);
        break;
      case 1:
        NavBar.navigatorKey.currentState
            ?.pushReplacementNamed(ParcelsTab.routeName);
        break;
      case 2:
        NavBar.navigatorKey.currentState
            ?.pushReplacementNamed(DeliveriesTab.routeName);
        break;
      case 3:
        NavBar.navigatorKey.currentState
            ?.pushReplacementNamed(AccountTab.routeName);
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  BottomNavigationBarItem _buildNavBarItem(
      {required String label, required String assetName}) {
    return BottomNavigationBarItem(
      icon: NavBarIcon(
        active: false,
        assetName: assetName,
      ),
      activeIcon: NavBarIcon(
        active: true,
        assetName: assetName,
      ),
      label: label,
    );
  }
}
