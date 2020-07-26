import 'package:app/components/button/FlatIconButton.dart';
import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/note/NoteList.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/SlideWithFadeInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

import 'dialogs/NoteDialog.dart';

const k_note_section_title = 'note.section.title';

class DailyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: kPrimaryDarkest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledText(
                Loc.of(context).t(k_note_section_title),
                type: TextType.subtitle,
                fontWeight: FontWeight.w200,
              ),
              FlatIconButton(
                icon: Icons.add,
                onPressed: () => showModal<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return NoteDialog();
                  }),
              )
            ],
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
