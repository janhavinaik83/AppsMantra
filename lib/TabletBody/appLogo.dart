import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/text.dart';
import 'package:my_portfolio/Widgets/formScreen.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  _AppLogoState createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with TickerProviderStateMixin {
  bool _isHovered = false; // Tracks hover state
  late AnimationController _h3Controller;
  late AnimationController _h1Controller;
  late AnimationController _s1Controller;
  late Animation<int> _h3LetterCount;
  late Animation<int> _h1LetterCount;
  late Animation<int> _s1LetterCount;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controllers
    _h3Controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _h1Controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _s1Controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Animate the number of letters revealed for h3
    _h3LetterCount = StepTween(begin: 0, end: h3.length).animate(CurvedAnimation(
      parent: _h3Controller,
      curve: Curves.easeInOut,
    ));

    // Animate the number of letters revealed for h1
    _h1LetterCount = StepTween(begin: 0, end: h1.length).animate(CurvedAnimation(
      parent: _h1Controller,
      curve: Curves.easeInOut,
    ));

    _s1LetterCount = StepTween(begin: 0, end: s1.length).animate(CurvedAnimation(
      parent: _s1Controller,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _h3Controller.forward();
    _h1Controller.forward();
    _s1Controller.forward();
  }

  @override
  void dispose() {
    _h3Controller.dispose();
    _h1Controller.dispose();
    _s1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _h1Controller,
                builder: (context, child) {
                  final int s1Length = _s1LetterCount.value;
                  return Text(
                    s1.substring(0, s1Length.clamp(0, s1.length)),
                    textScaleFactor: 2,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: ElevatedButton(
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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormScreen()),
                    );
                  },
                  child: Text(
                    "Want to Connect?",
                    style: TextStyle(
                      color: _isHovered ? Colors.white : Theme.of(context).primaryColor,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
      
          // Typing animation for h3
          AnimatedBuilder(
            animation: _h3Controller,
            builder: (context, child) {
              final int h3Length = _h3LetterCount.value;
              
              // Clamp the h3 length so it doesn't exceed the total string length
              String currentText = h3.substring(0, h3Length.clamp(0, h3.length));
              
              // Check if the word "Creativity" is within the current displayed text
              int creativityIndex = currentText.indexOf('Creativity');

              return RichText(
                textScaleFactor: 2,
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontFamily: "Poppins",
                    fontSize: 18,
                  ),
                  children: [
                    // Before "Creativity"
                    TextSpan(
                      text: creativityIndex != -1 ? currentText.substring(0, creativityIndex) : currentText,
                    ),
                    // Apply color to "Creativity" if it is displayed
                    if (creativityIndex != -1)
                      TextSpan(
                        text: "Creativity",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, // Custom color for "Creativity"
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    // Text after "Creativity" if it fits within the current text length
                    if (creativityIndex != -1 && h3Length > creativityIndex + "Creativity".length)
                      TextSpan(
                        text: currentText.substring(creativityIndex + "Creativity".length),
                      ),
                  ],
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
          const SizedBox(height: 15),      
          // Typing animation for h1
          AnimatedBuilder(
            animation: _h1Controller,
            builder: (context, child) {
              final int h1Length = _h1LetterCount.value;
              return Text(
                h1.substring(0, h1Length.clamp(0, h1.length)),
                textScaleFactor: 2,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
