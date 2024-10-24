import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Widgets/customCard.dart';

class TechStack extends StatefulWidget {
  const TechStack({super.key});

  @override
  _TechStackState createState() => _TechStackState();
}

class _TechStackState extends State<TechStack> {
  // PageController for managing the sliding animation
  final PageController _carouselController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  final List<Widget> _cards = const [
    CustomCard(
      imageUrls: ['assets/images/techstacks/Flutter.png'],
      title: 'Cross Platform\nDevelopment',
      description: 'Cross Platform Development experts\n with expertise in Flutter and React Native',
    ),
    CustomCard(
      imageUrls: ['assets/images/techstacks/Android.png'],
      title: 'Android\nDevelopment',
      description: 'Android Developer experts\nwith expertise in Kotlin, Java',
    ),
    CustomCard(
      imageUrls: ['assets/images/techstacks/apple.png'],
      title: 'iOS Development',
      description: 'iOS Developer experts with\nexpertise in Flutter',
    ),
    CustomCard(
      imageUrls: ['assets/images/techstacks/.net.png'],
      title: 'Backend\nDevelopment',
      description: 'Backend Developer experts\nwith expertise in .Net, Springboot',
    ),
    CustomCard(
      imageUrls: ['assets/images/techstacks/web.png'],
      title: 'Web Development',
      description: 'Web Development experts with\nexpertise in HTML, CSS, Javascript',
    ),
    CustomCard(
      imageUrls: ['assets/images/techstacks/cloud.png'],
      title: 'Cloud Services',
      description: 'Cloud computing experts with\nproficiency in AWS services and Azure',
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Set up auto-slide timer to change pages automatically
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_carouselController.hasClients) {
        int nextPage = _carouselController.page!.round() + 1;
        _carouselController.animateToPage(
          nextPage % _cards.length, // Loop back to first page after the last
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });

    // Listener to keep track of the current page and handle looping
    _carouselController.addListener(() {
      if (_carouselController.page!.round() != _currentPage) {
        setState(() {
          _currentPage = _carouselController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _autoSlideTimer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ServicesKey,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Tech Stacks & Skills",
          style: TextStyle(
            fontSize: 45,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: SizedBox(
            height: 290,
            child: PageView.builder(
              controller: _carouselController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _cards.length, // No need to add 1 for looping
              itemBuilder: (context, index) {
                // Apply transformation for sliding effect
                return AnimatedBuilder(
                  animation: _carouselController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_carouselController.position.haveDimensions) {
                      value = _carouselController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: _cards[index], // Display card with looping
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
