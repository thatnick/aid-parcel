import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AidItem extends Equatable {
  final int id;
  final int beneficiaryId;
  final String name;
  final String description;
  final double price;
  final Image image;

  const AidItem(
      {required this.id,
      required this.beneficiaryId,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  @override
  List<Object?> get props => [id];

  static List<AidItem> sampleAidItems = [
    AidItem(
        id: 1,
        beneficiaryId: 1,
        name: 'Blanket',
        description: 'A warm blanket',
        price: 10,
        image: Image.asset('assets/sample_images/blanket.jpeg')),
    AidItem(
        id: 2,
        beneficiaryId: 2,
        name: 'Dressing',
        description: 'A wound dressing',
        price: 5,
        image: Image.asset('assets/sample_images/dressing.jpeg')),
  ];
}
