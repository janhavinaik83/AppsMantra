import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/globalKey.dart';

class ProjectDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: const Text(
            'Discover the Success Stories',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.05), // Responsive vertical spacing
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            key: WorkKey,
            children: [
              ProjectItem(
                name: 'Rizz (AI Lifestyle Assistant)',
                images: [
                  'assets/images/rizz/rizz1.jpeg',
                  'assets/images/rizz/rizz2.jpeg',
                  'assets/images/rizz/rizz3.jpeg',
                ],
              ),
              SizedBox(width: screenWidth * 0.05), // Responsive spacing between items
              ProjectItem(
                name: 'Jiffy Go(Ride Booking App)',
                images: [
                  'assets/images/jiffy/jiffy1.jpeg',
                  'assets/images/jiffy/jiffy2.jpeg',
                  'assets/images/jiffy/jiffy3.jpeg',
                ],
              ),
              SizedBox(width: screenWidth * 0.05),
              ProjectItem(
                name: 'Petto (Pet Care App)',
                images: [
                  'assets/images/petto/petto1.jpeg',
                  'assets/images/petto/petto2.jpeg',
                  'assets/images/petto/petto3.jpeg',
                ],
              ),
              SizedBox(width: screenWidth * 0.05),
              ProjectItem(
                name: 'Tennis App (Booking and Management)',
                images: [
                  'assets/images/tennis/tennis1.jpeg',
                  'assets/images/tennis/tennis2.jpeg',
                  'assets/images/tennis/tennis3.jpeg',
                ],
              ),
              SizedBox(width: screenWidth * 0.05),
              ProjectItem(
                name: 'Memow (Photographer Booking)',
                images: [
                  'assets/images/memow/memow1.jpeg',
                  'assets/images/memow/memow2.jpeg',
                  'assets/images/memow/memow3.jpeg',
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String name;
  final List<String> images;

  ProjectItem({required this.name, required this.images});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make elements responsive
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20, // Responsive font size
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.03), // Responsive spacing
        ImageCarouselContainer(images: images),
      ],
    );
  }
}

class ImageCarouselContainer extends StatelessWidget {
  final List<String> images;

  ImageCarouselContainer({required this.images});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery for carousel dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.25, // Responsive width
      height: screenHeight * 0.9, // Responsive height
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: carousel.CarouselSlider(
        options: carousel.CarouselOptions(
          height: screenHeight * 0.8,
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  _showImageDetails(context, image);
                },
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  void _showImageDetails(BuildContext context, String imagePath) {
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.8, // Limit dialog height
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
