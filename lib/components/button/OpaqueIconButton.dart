import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:flutter/material.dart';

class OpaqueIconButton extends StatelessWidget {
  final IconData icon;

  final Function onPressed;

  final String label;

  OpaqueIconButton(
      {@required this.onPressed, @required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: kSpacingTiny, horizontal: kSpacingNormal),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: kBodyNormal,
          ),
          SizedBox(
            width: kSpacingSmall,
          ),
          StyledText(
            label,
            size: TextSize.smaller,
          )
          ,
        ],
      ),
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colors.white10,
      shape: OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid, width: 0, color: Colors.white30),
          borderRadius: new BorderRadius.circular(15.0)),
    );
  }
}
