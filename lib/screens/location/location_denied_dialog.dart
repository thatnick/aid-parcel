import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../config/lifecycle_event_handler.dart';

class LocationDeniedDialog extends StatefulWidget {
  const LocationDeniedDialog({super.key});

  @override
  State<LocationDeniedDialog> createState() => _LocationDeniedDialogState();
}

class _LocationDeniedDialogState extends State<LocationDeniedDialog> {
  Text _content = const Text('''
            Aid Connect needs to access your location in order to work. 
            Please goto Settings and allow location access while using. 
            ''');
  TextButton _button = TextButton(
    onPressed: () => openAppSettings(),
    child: const Text('Open Settings'),
  );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
      resumeCallBack: () async {
        if (await Permission.location.request().isGranted) {
          setState(() {
            _content =
                const Text('Aid Connect now has the permissions required');
            _button = TextButton(
              onPressed: () {
                context.read<GeolocationBloc>().add(LoadGeolocation());
                Navigator.pop(context);
              },
              child: const Text('OK'),
            );
          });
        }
      },
    ));
    return AlertDialog(
      title: const Text('Location permission'),
      content: _content,
      actions: [
        _button,
      ],
    );
  }
}
