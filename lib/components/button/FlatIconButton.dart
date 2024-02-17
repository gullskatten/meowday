import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import 'package:flutter/material.dart';

class FlatIconButton extends StatelessWidget {
  final IconData icon;

  final Function onPressed;

  FlatIconButton({@required this.onPressed, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(50.0),
      child: InkWell(
        enableFeedback: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kSpacingSmall,
            horizontal: kSpacingSmall
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: kBodyNormal,
          ),
        ),
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
