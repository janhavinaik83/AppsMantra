import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Constants/themeEvent.dart';
import 'package:my_portfolio/DesktopBody/desktopBody.dart';
import 'package:my_portfolio/MobileBody/mobileBody.dart';
import 'package:my_portfolio/Responsive/responsive.dart';
import 'package:my_portfolio/TabletBody/tabletBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<Map<String, bool>> _hovering = ValueNotifier({});

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final defaultTextColor = theme.textTheme.bodyLarge?.color;

    EdgeInsetsGeometry padding = isDesktop(context)
        ? const EdgeInsets.symmetric(horizontal: 60.0)
        : const EdgeInsets.only(left: 1.0);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isDesktop(context)) ...[
                Row(
                  children: [
                    _buildHoverTextButton("About", defaultTextColor, AboutKey),
                    const SizedBox(width: 10),
                    _buildHoverTextButton("Services", defaultTextColor, ServicesKey),
                    const SizedBox(width: 10),
                    _buildHoverTextButton("Work", defaultTextColor, WorkKey),
                    const SizedBox(width: 10),
                    _buildHoverTextButton("Contact", defaultTextColor, ContactKey),
                  ],
                ),
              ],
              if (!isDesktop(context)) const Spacer(),
              IconButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(ThemeEvent.toggle);
                },
                icon: Icon(
                  isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                  color: defaultTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: !isDesktop(context)
          ? Drawer( // Only show Drawer on mobile
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "AppsMantra",
                          textScaleFactor: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5), // Correct placement of SizedBox outside Padding
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.info, color: defaultTextColor), // Icon for About
                    title: Text(
                      'About',
                      style: TextStyle(color: defaultTextColor, fontFamily: "Poppins"),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: defaultTextColor), // Arrow forward icon
                    onTap: () {
                      scrollToSection(AboutKey);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.design_services, color: defaultTextColor), // Icon for Services
                    title: Text(
                      'Services',
                      style: TextStyle(color: defaultTextColor, fontFamily: "Poppins"),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: defaultTextColor), // Arrow forward icon
                    onTap: () {
                      scrollToSection(ServicesKey);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.work_outline, color: defaultTextColor), // Icon for Work
                    title: Text(
                      'Work',
                      style: TextStyle(color: defaultTextColor, fontFamily: "Poppins"),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: defaultTextColor), // Arrow forward icon
                    onTap: () {
                      scrollToSection(WorkKey);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail, color: defaultTextColor), // Icon for Contact
                    title: Text(
                      'Contact',
                      style: TextStyle(color: defaultTextColor, fontFamily: "Poppins"),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: defaultTextColor), // Arrow forward icon
                    onTap: () {
                      scrollToSection(ContactKey);
                    },
                  ),
                ],
              ),
            )
          : null, // No drawer for desktop
      body: const ResponsiveWidget(
        desktopBody: DesktopBody(),
        mobileBody: MobileBody(), 
        tabletBody: TabletBody(),
      ),
    );
  }

    Widget _buildHoverTextButton(String title, Color? defaultTextColor, GlobalKey key) {
    Color hoverColor = Theme.of(context).primaryColor;

    // Initialize hovering state if it doesn't exist for this title
    _hovering.value.putIfAbsent(title, () => false);

    return ValueListenableBuilder<Map<String, bool>>(
      valueListenable: _hovering,
      builder: (context, hoveringMap, child) {
        return MouseRegion(
          onEnter: (_) {
            _hovering.value = {..._hovering.value, title: true};
          },
          onExit: (_) {
            _hovering.value = {..._hovering.value, title: false};
          },
          child: TextButton(
            onPressed: () {
              scrollToSection(key);
            },
            child: Text(
              title,
              style: TextStyle(
                color: hoveringMap[title]! ? hoverColor : defaultTextColor,
                fontFamily: "Poppins",
                shadows: hoveringMap[title]!
                    ? [
                        BoxShadow(
                          color: hoverColor.withOpacity(0.4), // Glow color
                          blurRadius: 20, // Glow intensity
                          spreadRadius: 4,
                          offset: const Offset(0, 4), // Position of glow
                        ),
                      ]
                    : [], // No shadow when not hovered
              ),
            ),
          ),
        );
      },
    );
  }
}
