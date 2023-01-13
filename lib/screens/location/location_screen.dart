import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../blocs/place/place_bloc.dart';
import 'gmap.dart';
import 'location_denied_dialog.dart';
import 'location_save_button.dart';
import 'location_search_box.dart';

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
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoading) {
            return Stack(
              children: [
                BlocConsumer<GeolocationBloc, GeolocationState>(
                  listener: (context, state) {
                    if (state is LocationPermissionDenied) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            const LocationDeniedDialog(),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GeolocationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GeolocationLoaded) {
                      return GMap(
                          lat: state.position.latitude,
                          lng: state.position.longitude);
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
                const LocationSearchBox(),
                const LocationSaveButton(),
              ],
            );
          } else if (state is PlaceLoaded) {
            return Stack(
              children: [
                GMap(lat: state.place.lat, lng: state.place.lng),
                const LocationSearchBox(),
                const LocationSaveButton(),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
