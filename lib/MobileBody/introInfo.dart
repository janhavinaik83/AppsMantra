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
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0), 
        ),
        margin: const EdgeInsets.all(16.0),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                d1,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color, 
                  fontFamily: "Poppins",
                  fontSize: 16,
                ),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}

