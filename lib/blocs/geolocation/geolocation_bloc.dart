import 'dart:async';

import 'package:aid_connect/repositories/geolocation/geolocation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeolocation>(_onLoadGeolocation);
    on<UpdateGeolocation>(_onUpdateGeolocation);
  }

  Future _onLoadGeolocation(
      LoadGeolocation event, Emitter<GeolocationState> emit) async {
    _geolocationSubscription?.cancel();
    if (await Permission.location.request().isGranted) {
      final Position position =
          await _geolocationRepository.getCurrentLocation();
      add(UpdateGeolocation(position: position));
    } else if (await Permission.location.isPermanentlyDenied) {
      emit(LocationPermissionDenied());
    }
  }

  void _onUpdateGeolocation(
      UpdateGeolocation event, Emitter<GeolocationState> emit) {
    emit(GeolocationLoaded(position: event.position));
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
