import 'package:flutter/material.dart';

class FeaturedCarousel extends StatefulWidget {
  const FeaturedCarousel({super.key});

  @override
  State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  final totalFeatures = 5;
  int currentFeatureIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 202,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: totalFeatures,
            onPageChanged: (int pageIndex) => setState(() {
                  currentFeatureIndex = pageIndex;
                }),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      strokeAlign: StrokeAlign.inside,
                      color: const Color(0xFF025949),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      const FeaturedImage(),
                      ImageOverlay(
                          totalFeatures: totalFeatures,
                          currentFeatureIndex: index)
                    ],
                  ),
                ),
              );
            }),
      ),
      SizedBox(
        height: 216,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List<Widget>.generate(totalFeatures, (int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color(0xFF025949), width: 1.5),
                  color: index == currentFeatureIndex
                      ? const Color(0xFF025949)
                      : const Color(0xFFE9F2F0),
                ),
              ),
            );
          }),
        ),
      )
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

class ImageOverlay extends StatelessWidget {
  final int totalFeatures;
  final int currentFeatureIndex;

  const ImageOverlay({
    Key? key,
    required this.totalFeatures,
    required this.currentFeatureIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 135,
          ),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            height: 35,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  bottom: 8,
                ),
                child: Text(
                  'Insulin urgently needed in Dnipro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
