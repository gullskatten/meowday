import 'package:app/components/transition/SlideWithFadeInTransition.dart';
import 'package:flutter/material.dart';

class SelectableIcon extends StatelessWidget {

  final bool isSelected;
  final String iconIdentifier;
  final int fadeInDelay;
  final VoidCallback onTap;
  final IconData icon;

  SelectableIcon({
    @required this.iconIdentifier,
    @required this.onTap,
    @required this.icon,
    this.isSelected = false,
    this.fadeInDelay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SlideWithFadeInTransition(
        id: iconIdentifier,
        offset: Offset(0, 0.25),
        delay: fadeInDelay,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            radius: 120.0,
            customBorder: CircleBorder(),
            onTap: onTap,
            child: Icon(
              icon,
              size: 48,
              color: isSelected ? Colors.white : Colors.white60,
            ),
          ),
        ));
  }
}
