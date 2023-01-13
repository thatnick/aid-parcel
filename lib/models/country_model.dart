import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final int id;
  final String name;

  const Country({required this.id, required this.name});

  @override
  List<Object> get props => [id];

  static List<Country> sampleCountries = [
    const Country(id: 1, name: 'Afghanistan'),
    const Country(id: 2, name: 'Ukraine'),
  ];
}
