import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/place_model.dart';
import '../../repositories/places/places_repository.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  PlaceBloc({required placesRepository})
      : _placesRepository = placesRepository,
        super(PlaceLoading()) {
    on<LoadPlace>(_onPlaceLoading);
  }

  void _onPlaceLoading(LoadPlace event, Emitter<PlaceState> emit) async {
    emit(PlaceLoading());
    try {
      _placesSubscription?.cancel();
      final Place place = await _placesRepository.getPlace(event.placeId);
      emit(PlaceLoaded(place: place));
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  }
}
