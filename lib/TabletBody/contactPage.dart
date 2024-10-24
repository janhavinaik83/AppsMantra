import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Constants/links.dart';
import 'package:my_portfolio/Constants/openURL.dart';
import 'package:my_portfolio/Constants/text.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isHovered = false;
  bool _isInstagramHovered = false;
  bool _isLinkedInHovered = false;
  bool _isYouTubeHovered = false;

  @override
  Widget build(BuildContext context) {
    // Get the card color based on the theme
    final cardColor = Theme.of(context).cardColor;

    // Determine if the device is mobile based on screen width
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      key: ContactKey,
      children: [
        Stack(
          children: [
            // Card with content
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                ),
                margin: const EdgeInsets.all(16.0),
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Get in Touch!',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        d6,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: ElevatedButton(
                          onPressed: () {
                            openURL(mail);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              _isHovered ? Theme.of(context).primaryColor : Colors.white,
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0,
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                            ),
                          ),
                          child: Text(
                            'Email Us',
                            style: TextStyle(
                              fontSize: 16,
                              color: _isHovered ? Colors.white : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Light Circle at Top Left
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Light Circle at Bottom Right
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Connect with Us',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => _isInstagramHovered = true),
              onExit: (_) => setState(() => _isInstagramHovered = false),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: _isInstagramHovered ? Theme.of(context).primaryColor : null,
                ),
                iconSize: 30,
                onPressed: () {
                  openURL(instagram);
                },
              ),
            ),
            const SizedBox(width: 15),
            MouseRegion(
              onEnter: (_) => setState(() => _isLinkedInHovered = true),
              onExit: (_) => setState(() => _isLinkedInHovered = false),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: _isLinkedInHovered ? Theme.of(context).primaryColor : null,
                ),
                iconSize: 30,
                onPressed: () {
                  openURL(linkedin);
                },
              ),
            ),
            const SizedBox(width: 15),
            MouseRegion(
              onEnter: (_) => setState(() => _isYouTubeHovered = true),
              onExit: (_) => setState(() => _isYouTubeHovered = false),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.youtube,
                  color: _isYouTubeHovered ? Theme.of(context).primaryColor : null,
                ),
                iconSize: 30,
                onPressed: () {
                  openURL(youtube);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Have a great day! 😊',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            fontFamily: "Poppins",
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isMobile
                  ? 'Copyright © 2024 AppsMantra\nAll rights reserved'
                  : 'Copyright © 2024 AppsMantra | All rights reserved',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
