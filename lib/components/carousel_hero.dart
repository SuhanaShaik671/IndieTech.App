import 'package:flutter/material.dart';

class CarouselHero extends StatefulWidget {
  const CarouselHero({Key? key}) : super(key: key);

  @override
  _CarouselHeroState createState() => _CarouselHeroState();
}

class _CarouselHeroState extends State<CarouselHero> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/banner/edutiv_go.png',
      'assets/banner/edutiv_bootcamp.png',
      'assets/banner/edutiv_insight.png',
    ];

    return Column(
      children: [
        SizedBox(
          height: 130.0,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle tap action
                },
                child: Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 12.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
