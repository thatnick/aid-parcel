import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatelessWidget {
  const GMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(52.95, -1.15),
          zoom: 15,
        ),
        myLocationButtonEnabled: true,
      ),
    );
  }
}
