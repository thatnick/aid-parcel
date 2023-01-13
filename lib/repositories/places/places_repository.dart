import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../models/place_autocomplete_model.dart';
import '../../models/place_model.dart';
import 'base_places_repository.dart';

class PlacesRepository extends BasePlaceRepository {
  final String apiKey = 'AIzaSyDCcZ-nQvJv3uE0BXxAl1BeOSk7KlHP3XI';
  final String types = 'geocode';
  // TODO: add Android headers?
  final Map<String, String> requestHeader = {
    "X-Ios-Bundle-Identifier": "software.spirited.aid-connect"
  };

  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$apiKey';
    var response = await http.get(Uri.parse(url), headers: requestHeader);
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    var response = await http.get(Uri.parse(url), headers: requestHeader);
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;

    return Place.fromJson(result);
  }
}
