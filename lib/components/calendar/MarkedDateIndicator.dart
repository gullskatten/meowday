import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class MarkedDateIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 5,
          height: 5,
          child: Icon(
            CustomIcons.award_empty,
            color: Colors.white60,
            size: 14.0,
          ),
        ),
      ],
    );
  }
}
