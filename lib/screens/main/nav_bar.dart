import 'package:flutter/material.dart';

import 'nav_bar_icon.dart';

class NavBar extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final int _selectedDestinationIndex;
  final void Function(int) _onTabTap;

  const NavBar(
      {super.key, required selectedDestinationIndex, required onTabTap})
      : _selectedDestinationIndex = selectedDestinationIndex,
        _onTabTap = onTabTap;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget._onTabTap,
      currentIndex: widget._selectedDestinationIndex,
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
