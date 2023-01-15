import 'package:flutter/material.dart';

import '../../models/beneficiary_model.dart';

class BeneficiaryBox extends StatelessWidget {
  final Beneficiary beneficiary;
  const BeneficiaryBox({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Image here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(beneficiary.name),
            ),
          )
        ],
      ),
    );
  }
}
