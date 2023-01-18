import 'package:flutter/material.dart';

import '../../models/beneficiary_model.dart';

class BeneficiaryCard extends StatelessWidget {
  final Beneficiary beneficiary;

  const BeneficiaryCard({
    Key? key,
    required this.beneficiary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            strokeAlign: StrokeAlign.inside,
            color: const Color(0xFF025949),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            FeaturedImage(beneficiary: beneficiary),
            TextBox(beneficiary: beneficiary),
          ],
        ),
      ),
    );
  }
}

class FeaturedImage extends StatelessWidget {
  final Beneficiary beneficiary;

  const FeaturedImage({
    Key? key,
    required this.beneficiary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: beneficiary.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final Beneficiary beneficiary;

  const TextBox({
    Key? key,
    required this.beneficiary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 0.66) - 16,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                beneficiary.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                beneficiary.location,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
