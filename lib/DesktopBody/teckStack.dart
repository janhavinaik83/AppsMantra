import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Widgets/customCard.dart';

class TechStack extends StatelessWidget {
  const TechStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ServicesKey,
      crossAxisAlignment: CrossAxisAlignment.center, // Align items to the start
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
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            height: 250, 
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 16/9,
              mainAxisSpacing: 20, 
              crossAxisSpacing: 20, 
              children: const [
                CustomCard(
                  imageUrls: ['assets/images/techstacks/Flutter.png'], 
                  title: 'Cross Platform Development',
                  description: 'Cross Platform Development experts\n with expertise in Flutter and React Native',
                ),
                CustomCard(
                  imageUrls: [
                    'assets/images/techstacks/Android.png',
                  ], 
                  title: 'Android Development',
                  description: 'Android Developer experts\nwith expertise in Kotlin, Java',
                ),
                CustomCard(
                  imageUrls: ['assets/images/techstacks/apple.png'], 
                  title: 'iOS Development',
                  description: 'iOS Developer experts with\nexpertise in Flutter',
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(            
            height: 250, 
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 16/9, 
              mainAxisSpacing: 15, 
              crossAxisSpacing: 15, 
              children: const [
                CustomCard(
                  imageUrls: [
                    'assets/images/techstacks/.net.png',
                  ], 
                  title: 'Backend Development',
                  description: 'Backend Developer experts\nwith expertise in .Net, Springboot',
                ),
                CustomCard(
                  imageUrls: ['assets/images/techstacks/web.png'], 
                  title: 'Web Development',
                  description: 'Web Development experts with\n expertise in HTML, CSS, Javascript',
                ),
                CustomCard(
                  imageUrls: [
                    'assets/images/techstacks/cloud.png',
                  ], 
                  title: 'Cloud Services',
                  description: 'Cloud computing experts with\nproficiency in AWS services and Azure',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
