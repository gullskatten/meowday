import '/components/text/StyledText.dart';
import '/constants/spacing/spacing.dart';
import '/models/text/TextSize.dart';
import '/models/text/TextType.dart';
import 'package:flutter/material.dart';

class MonthName extends StatelessWidget {
  final String monthName;


  MonthName(this.monthName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StyledText(
        monthName,
        type: TextType.subtitle,
        size: TextSize.smaller,
        fontWeight: FontWeight.bold,
      ),
      padding: EdgeInsets.all(kSpacingNormal),
    );
  }
}
