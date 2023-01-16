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
        height: 177,
        child: PageView.builder(
            pageSnapping: false,
            padEnds: false,
            controller: PageController(viewportFraction: 0.66),
            itemCount: totalFeatures,
            itemBuilder: (context, index) {
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
                    children: const [
                      FeaturedImage(),
                      TextBox(),
                    ],
                  ),
                ),
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
    return Container(
      height: 125,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/sample_images/ukr/cover.jpeg',
          ),
          fit: BoxFit.cover,
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
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 0.66) - 16,
        height: 50,
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
