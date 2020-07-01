import 'package:app/components/text/StyledText.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

import 'MarkedDateIndicator.dart';

class DateTile extends StatelessWidget {
  final String dayName;
  final int rowIndex;
  final DateTime selectedDate;
  final bool isDateMarked;
  final bool isDateOutOfRange;
  final DateTime dateOfTile;

  DateTile({
    this.dateOfTile,
    this.selectedDate,
    this.rowIndex,
    this.dayName,
    this.isDateMarked,
    this.isDateOutOfRange,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelectedDate = dateOfTile.compareTo(selectedDate) == 0;

    List<Widget> _columnChildren = [
      StyledText(
        dayName,
        size: TextSize.smaller,
        fontWeight: isSelectedDate ? FontWeight.normal : FontWeight.w400,
        fontFamily: FontFamily.title,
        color: isDateOutOfRange ? TextColor.primary60 : TextColor.primary,
      )
    ];

    if (isSelectedDate) {
      _columnChildren.add(
        StyledText(
          dateOfTile.day.toString(),
          type: TextType.title,
          size: TextSize.smaller,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      _columnChildren.add(
        StyledText(
          dateOfTile.day.toString(),
          type: TextType.title,
          size: TextSize.smaller,
          fontWeight: FontWeight.w200,
          color: isDateOutOfRange ? TextColor.primary60 : TextColor.primary,
        ),
      );
    }

    if (isDateMarked == true) {
      // _children.add(MarkedDateIndicator());
    }

    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
          color: !isSelectedDate ? Colors.transparent : Colors.white30,
        ),
        child: Stack(
          children: [
            FittedBox(
              child: Column(
                children: _columnChildren,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: <Widget>[
                  isDateMarked ? MarkedDateIndicator() : Container()
                ],
              ),
            ),
          ],
        ));
  }
}
