import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final String companyName;
  final String logoPath;

  // Constructor
   const CompanyInfo({
    required this.companyName,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo Image
        Image.asset(
          logoPath,
          height: 60.0,  
          width: 60.0,
        ),
        const SizedBox(width: 10), 
        Text(
          companyName,
          style: const TextStyle(
            fontSize: 18,  
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins"
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
