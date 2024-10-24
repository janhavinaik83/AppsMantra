import 'package:flutter/material.dart';
import 'package:my_portfolio/Widgets/companywidget.dart';

class Company extends StatelessWidget {
  const Company({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Collaborated with',
          style: TextStyle(fontFamily: "Poppins", fontSize: 45, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CompanyInfo(companyName: 'Rizz', logoPath: 'assets/images/company/rizz.jpeg'),
            SizedBox(height: 8,),
            CompanyInfo(companyName: 'Remote Engine', logoPath: 'assets/images/company/remote.png'),
            SizedBox(height: 8,),
            CompanyInfo(companyName: 'Apps Imagica LLP', logoPath: 'assets/images/company/apps.png'),
            SizedBox(height: 8,),
            CompanyInfo(companyName: 'Zaptech Solutions', logoPath: 'assets/images/company/zaptech.png'),
            SizedBox(height: 8,),
            CompanyInfo(companyName: 'Verdant Info\nComm Systems', logoPath: 'assets/images/company/verdant.png'),
          ],
        ),
      ],
    );
  }
}
