import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/theme.dart';
import 'package:my_portfolio/TabletBody/appLogo.dart';
import 'package:my_portfolio/TabletBody/companyInfo.dart';
import 'package:my_portfolio/TabletBody/contactPage.dart';
import 'package:my_portfolio/TabletBody/introInfo.dart';
import 'package:my_portfolio/TabletBody/membersInfo.dart';
import 'package:my_portfolio/TabletBody/projectsInfo.dart';
import 'package:my_portfolio/TabletBody/teckStack.dart';


class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

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
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppLogo(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const IntroInfo(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ProjectDetails(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                TechStack(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                const Company(),  
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),          
                const MembersInfo(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2), 
                ContactCard(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
