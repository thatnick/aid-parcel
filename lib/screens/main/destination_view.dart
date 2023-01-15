import 'package:flutter/material.dart';

class DestinationView extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final int index;
  final Widget Function(String routeName) routeBuilder;

  DestinationView({
    Key? key,
    required this.index,
    required this.routeBuilder,
  }) : super(key: key);

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: GlobalKey(),
      child: Navigator(
        key: widget.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) {
              return widget.routeBuilder(settings.name!);
            },
          );
        },
      ),
    );
  }
}
