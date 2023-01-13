import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/place_autocomplete_model.dart';
import '../../repositories/places/places_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading()) {
    on<LoadAutocompleteEvent>(_onLoadAutocomplete);
  }

  void _onLoadAutocomplete(
      LoadAutocompleteEvent event, Emitter<AutocompleteState> emit) async {
    _placesSubscription?.cancel();
    final List<PlaceAutocomplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);
    emit(AutocompleteLoaded(autocomplete: autocomplete));
  }
}
