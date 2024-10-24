import 'package:flutter/material.dart';
import 'package:my_portfolio/MobileBody/mobileBody.dart';
import 'package:my_portfolio/DesktopBody/desktopBody.dart';
import 'package:my_portfolio/Responsive/responsive.dart';
import 'package:my_portfolio/TabletBody/tabletBody.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktopBody: Scaffold(
        body: DesktopBody(),
      ),
      mobileBody: Scaffold(
        body: MobileBody(),
      ), 
      tabletBody: Scaffold(
        body: TabletBody(),
      ),
    );
  }
}
