import 'package:flutter/material.dart';

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
        height: 175,
        child: PageView.builder(
            pageSnapping: false,
            padEnds: false,
            controller: PageController(viewportFraction: 0.66),
            itemCount: totalFeatures,
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  FeaturedImage(),
                  TextBox(),
                ],
              );
            }),
      ),
    ]);
  }
}

class FeaturedImage extends StatelessWidget {
  const FeaturedImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 125,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          image: DecorationImage(
            image: AssetImage(
              'assets/sample_images/ukr/cover.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: (MediaQuery.of(context).size.width * 0.66) - 16,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Mechnikov Hospital',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Dnipro',
                style: TextStyle(
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
