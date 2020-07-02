import 'package:app/components/transitions/SlideWithFadeInTransition.dart';
import 'package:flutter/material.dart';

class MoodFace extends StatelessWidget {

  final bool isSelected;
  final String faceIdentifier;
  final int fadeInDelay;
  final VoidCallback onTap;
  final IconData icon;

  MoodFace({
    @required this.faceIdentifier,
    @required this.onTap,
    @required this.icon,
    this.isSelected = false,
    this.fadeInDelay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SlideWithFadeInTransition(
        id: faceIdentifier,
        offset: Offset(0, 0.25),
        delay: fadeInDelay,
        child: InkWell(
          radius: 120.0,
          customBorder: CircleBorder(),
          onTap: onTap,
          child: Icon(
            icon,
            size: 64,
            color: isSelected ? Colors.white : Colors.white60,
          ),
        ));
  }
}
