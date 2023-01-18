import 'package:flutter/material.dart';

import '../../models/beneficiary_model.dart';
import 'beneficiary_card.dart';

class BeneficiaryScroll extends StatefulWidget {
  const BeneficiaryScroll({super.key});

  @override
  State<BeneficiaryScroll> createState() => _BeneficiaryScrollState();
}

class _BeneficiaryScrollState extends State<BeneficiaryScroll> {
  final totalFeatures = 5;
  int currentFeatureIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 177,
        child: PageView.builder(
            pageSnapping: false,
            padEnds: false,
            controller: PageController(viewportFraction: 0.66),
            itemCount: Beneficiary.sampleBeneficiaries.length,
            itemBuilder: (context, index) {
              return BeneficiaryCard(
                beneficiary: Beneficiary.sampleBeneficiaries[index],
              );
            }),
      ),
    ]);
  }
}
