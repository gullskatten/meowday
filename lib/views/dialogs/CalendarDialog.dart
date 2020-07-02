import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

import '../../components/calendar/Calendar.dart';

class CalendarDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: peach,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StyledText(
            "Select a day",
            fontFamily: FontFamily.alternative,
            type: TextType.subtitle,
          ),
          SizedBox(
            height: kSpacingNormal,
          ),
          Calendar(),
        ],
      ),

    );
  }
}
