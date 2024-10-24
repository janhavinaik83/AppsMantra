import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/theme.dart';
import 'package:my_portfolio/MobileBody/appLogo.dart';
import 'package:my_portfolio/MobileBody/companyInfo.dart';
import 'package:my_portfolio/MobileBody/contactPage.dart';
import 'package:my_portfolio/MobileBody/introInfo.dart';
import 'package:my_portfolio/MobileBody/membersInfo.dart';
import 'package:my_portfolio/MobileBody/projectsInfo.dart';
import 'package:my_portfolio/MobileBody/techStack.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: isDarkMode ? AppThemes.darkGradient : AppThemes.lightGradient, // Apply the gradient
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: AppLogo(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const IntroInfo(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ProjectDetails(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              TechStack(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Company(),  
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),          
              const MembersInfo(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ContactCard(),          
            ],
          ),
        ),
      ),
            ),
    );
  }
}
