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
        height: 200,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: totalFeatures,
            onPageChanged: (int pageIndex) => setState(() {
                  currentFeatureIndex = pageIndex;
                }),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  const FeaturedImage(),
                  ImageOverlay(
                      totalFeatures: totalFeatures, currentFeatureIndex: index)
                ],
              );
            }),
      ),
      SizedBox(
        height: 212,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
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
            width: MediaQuery.of(context).size.width - 16,
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
            width: MediaQuery.of(context).size.width - 16,
            height: 35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Colors.black54,
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
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
