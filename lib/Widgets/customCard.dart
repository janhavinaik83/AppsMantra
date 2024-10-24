import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/theme.dart';

class CustomCard extends StatefulWidget {
  final List<String> imageUrls;
  final String title;
  final String description;

  const CustomCard({
    Key? key,
    required this.imageUrls,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late Color _cardColor;
  List<BoxShadow> _boxShadows = [ // Default shadow before hover
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 5,
      offset: const Offset(0, 2),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _cardColor = Colors.transparent; // Default color before hover
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Set dimensions dynamically based on screen size
    final cardWidth = screenWidth > 1200
        ? screenWidth * 0.5 // For larger desktop screens
        : screenWidth * 0.8; // For smaller screens and mobile

    final cardHeight = screenHeight > 800
        ? screenHeight * 0.6 // Taller cards for larger screens
        : screenHeight * 0.4; // Smaller height for smaller screens

    // Define default card color based on theme brightness
    final defaultCardColor = theme.brightness == Brightness.light
        ? Colors.white
        : theme.cardColor.withOpacity(0.2);

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _cardColor = isDarkMode 
              ? theme.primaryColor 
              : Colors.grey.withOpacity(0.6); // Lighter shade for light mode
          

          // Apply glow effect on hover
          _boxShadows = [
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.6), // Glow color
              blurRadius: 10, // Increase blur for glow effect
              spreadRadius: 4, // Spread to enhance the glow
              offset: const Offset(0, 4), // Offset for a subtle elevation effect
            ),
          ];
        });
      },
      onExit: (_) {
        setState(() {
          _cardColor = defaultCardColor; // Revert to default color

          // Revert to default shadow
          _boxShadows = [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isDarkMode ? AppThemes.darkCard : AppThemes.lightCard,
          color: _cardColor == Colors.transparent ? defaultCardColor : _cardColor,
          border: Border.all(width: 1, color: Colors.grey),
          boxShadow: _boxShadows, // Apply the shadow (glow effect on hover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: _buildCardContent(theme),
        ),
      ),
    );
  }

  Widget _buildCardContent(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image section 
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.imageUrls[0], 
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Title section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: theme.primaryColor,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Description section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
