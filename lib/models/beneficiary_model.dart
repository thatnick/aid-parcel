import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'aid_item_model.dart';

class Beneficiary extends Equatable {
  final int id;
  final AssetImage image;
  final String name;
  final String location;
  final List<AidItem> aidItems;

  const Beneficiary(
      {required this.id,
      required this.image,
      required this.name,
      required this.location,
      required this.aidItems});

  @override
  List<Object?> get props => [id];

  static List<Beneficiary> sampleBeneficiaries = [
    Beneficiary(
        id: 1,
        image: const AssetImage('assets/sample_images/ukr/hospital_1.jpeg'),
        name: 'Mechnikov Hospital',
        location: 'Dnipro',
        aidItems: AidItem.sampleAidItems
            .where((item) => item.beneficiaryId == 1)
            .toList()),
    Beneficiary(
        id: 2,
        image: const AssetImage('assets/sample_images/afg/hospital_1.jpeg'),
        name: 'Shaikh Zayed Hospital ',
        location: 'Kabul',
        aidItems: AidItem.sampleAidItems
            .where((item) => item.beneficiaryId == 2)
            .toList()),
  ];
}
