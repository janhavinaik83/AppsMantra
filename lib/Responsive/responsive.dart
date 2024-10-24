import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/dimensions.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopBody;
  final Widget tabletBody;
  final Widget mobileBody;

  const ResponsiveWidget({
    Key? key,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else if (constraints.maxWidth < desktopWidth && constraints.maxWidth > mobileWidth) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
