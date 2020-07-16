import 'package:app/components/note/NoteList.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/SlideWithFadeInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.infinity,
              child: StyledText(
                'Notes',
                type: TextType.title,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),

          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 300),
              child: SlideWithFadeInTransition(
                  id: context.watch<CalendarProvider>().selectedDate.toIso8601String(),
                  delay: 250,
                  offset: Offset(0, 0.25),
                  child: NoteList())),
        ],
      ),
    );
  }
}
