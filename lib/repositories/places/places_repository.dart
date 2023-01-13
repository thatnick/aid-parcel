import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../models/place_autocomplete_model.dart';
import 'base_places_repository.dart';

class PlacesRepository extends BasePlaceRepository {
  final String apiKey = 'AIzaSyDCcZ-nQvJv3uE0BXxAl1BeOSk7KlHP3XI';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$apiKey';
    // TODO: add Android headers?
    Map<String, String> userHeader = {
      "X-Ios-Bundle-Identifier": "software.spirited.aid-connect"
    };
    var response = await http.get(Uri.parse(url), headers: userHeader);
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }
}
