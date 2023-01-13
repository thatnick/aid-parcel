import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/autocomplete/autocomplete_bloc.dart';
import '../../blocs/geolocation/geolocation_bloc.dart';
import 'gmap.dart';
import 'location_denied_dialog.dart';
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
      body: Stack(
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
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                const LocationSearchBox(),
                BlocBuilder<AutocompleteBloc, AutocompleteState>(
                  builder: (context, state) {
                    if (state is AutocompleteLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AutocompleteLoaded) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        height: 300,
                        color: state.autocomplete.isNotEmpty
                            ? Colors.black.withOpacity(0.6)
                            : Colors.transparent,
                        child: ListView.builder(
                          itemCount: state.autocomplete.length,
                          itemBuilder: ((context, index) => ListTile(
                                title: Text(
                                  state.autocomplete[index].description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      );
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
              ],
            ),
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
