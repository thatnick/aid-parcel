import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'aid_item_model.dart';

class Beneficiary extends Equatable {
  final int id;
  final Image image;
  final String name;
  final List<AidItem> aidItems;

  const Beneficiary(
      {required this.id,
      required this.image,
      required this.name,
      required this.aidItems});

  @override
  List<Object?> get props => [id];

  static List<Beneficiary> sampleBeneficiaries = [
    Beneficiary(
        id: 1,
        image: Image.asset('assets/sample_images/ukr/hospital_1.jpeg'),
        name: 'Mechnikov Hospital',
        aidItems: AidItem.sampleAidItems
            .where((item) => item.beneficiaryId == 1)
            .toList()),
    Beneficiary(
        id: 2,
        image: Image.asset('assets/sample_images/afg/hospital_1.jpeg'),
        name: 'Shaikh Zayed Hospital ',
        aidItems: AidItem.sampleAidItems
            .where((item) => item.beneficiaryId == 2)
            .toList()),
  ];
}
