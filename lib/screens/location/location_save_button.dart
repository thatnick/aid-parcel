import 'package:flutter/material.dart';

class LocationSaveButton extends StatelessWidget {
  const LocationSaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 70.0,
        ),
        child: ElevatedButton(
          child: const Text('Save'),
          onPressed: () {},
        ),
      ),
    );
  }
}
