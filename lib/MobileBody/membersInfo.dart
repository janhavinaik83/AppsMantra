import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Constants/text.dart';

class MembersInfo extends StatelessWidget {
  const MembersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
      child: Column(
        key: AboutKey,
        crossAxisAlignment: CrossAxisAlignment.center, // Align text to the start
        children: [
          const Text(
            'Members',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 45, // Reduced font size for mobile
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Adjusted height
          const Text(
            'Ribhu Mukherjee (CEO)',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 22, // Reduced font size for mobile
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'SWE @ Qualcomm RnD, IIT Madras, Ex - Newton School, GeeksForGeeks',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18, // Reduced font size for mobile
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Susmita Sen (CTO)',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 22, // Reduced font size for mobile
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Work with 10+ start-ups and delivered almost 10+ projects',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18, // Reduced font size for mobile
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Other Members',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 22, // Reduced font size for mobile
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                d2,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20, 
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                d3,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18, 
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                d4,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20, 
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                d5,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
