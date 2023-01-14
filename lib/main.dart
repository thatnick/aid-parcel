import 'package:aid_connect/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/autocomplete/autocomplete_bloc.dart';
import 'blocs/geolocation/geolocation_bloc.dart';
import 'blocs/place/place_bloc.dart';
import 'config/theme.dart';
import 'repositories/geolocation/geolocation_repository.dart';
import 'repositories/places/places_repository.dart';

void main() {
  runApp(const AidParcel());
}

class AidParcel extends StatelessWidget {
  const AidParcel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GeolocationRepository(),
        ),
        RepositoryProvider(
          create: (context) => PlacesRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
                geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeolocation()),
          ),
          BlocProvider(
            create: (context) => AutocompleteBloc(
                placesRepository: context.read<PlacesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PlaceBloc(placesRepository: context.read<PlacesRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
