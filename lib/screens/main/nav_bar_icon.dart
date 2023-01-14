import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcon extends StatelessWidget {
  final bool active;
  final String assetName;

  const NavBarIcon({
    Key? key,
    required this.active,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SvgPicture svg = SvgPicture.asset(
      assetName,
      color: active ? Colors.white : const Color(0xFF025949),
    );

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF025949) : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: svg,
    );
  }
}
