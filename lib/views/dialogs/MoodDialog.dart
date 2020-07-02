import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/views/MoodSelect.dart';
import 'package:flutter/material.dart';

class MoodDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: peach,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StyledText(
            "How do you feel today?",
            fontFamily: FontFamily.alternative,
            type: TextType.subtitle,
          ),
          SizedBox(
            height: kSpacingNormal,
          ),
          MoodSelect(),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            'Cancel',
            fontWeight: FontWeight.bold,
            color: TextColor.primary60,
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            'Save',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
