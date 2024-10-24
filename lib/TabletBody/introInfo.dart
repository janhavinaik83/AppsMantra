import 'dart:ui'; // Import for BackdropFilter
import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/text.dart';

class IntroInfo extends StatefulWidget {
  const IntroInfo({super.key});

  @override
  State<IntroInfo> createState() => _IntroInfoState();
}

class _IntroInfoState extends State<IntroInfo> {
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0), // Add border here
        ),
        margin: const EdgeInsets.all(8.0),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                d1,
                textAlign: TextAlign.center, // Place TextAlign here
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color, // Extract color properly
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}

