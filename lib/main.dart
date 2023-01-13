import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/autocomplete/autocomplete_bloc.dart';
import 'blocs/geolocation/geolocation_bloc.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'repositories/geolocation/geolocation_repository.dart';
import 'repositories/places/places_repository.dart';
import 'screens/location/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: LocationScreen.routeName,
        ),
      ),
    );
  }
}
