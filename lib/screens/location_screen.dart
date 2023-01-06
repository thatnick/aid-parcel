import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  const LocationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(52.95, -1.15),
                zoom: 15,
              ),
              myLocationButtonEnabled: true,
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: LocationSearchBox(),
          ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter location',
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(
            left: 20,
            bottom: 5,
            right: 5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
