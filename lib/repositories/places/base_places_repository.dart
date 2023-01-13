import '../../models/place_autocomplete_model.dart';

abstract class BasePlaceRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput) async {
    return null;
  }
}
