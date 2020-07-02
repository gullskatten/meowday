import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: kContainerPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TyperAnimatedTextKit(
            key: Key(context.select((CalendarProvider value) => value.selectedDate.month.toString())),
            text: [
              DateFormat("MMMM yyyy")
                  .format(context.select((CalendarProvider value) => value.selectedDate))
            ],
            isRepeatingAnimation: false,
            speed: Duration(milliseconds: 75),
            textStyle: TextStyle(
              fontSize: kBodyNormal,
              fontFamily: FontFamily.title.family,
              fontWeight: FontWeight.w200,
              color: TextColor.primary60.toColor,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.infinity,
              child: StyledText(
                DateFormat("EEEE, d.")
                    .format(context.watch<CalendarProvider>().selectedDate),
                type: TextType.title,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
          StyledText(
              'Today I went for a walk with a beautiful girl. Then she noticed me so we went for a run.'),
          Material(
            borderRadius: BorderRadius.circular(4),
            color: kContainerPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(kSpacingNormal),
              child: Align(
                alignment: Alignment.centerRight,
                child: OpaqueIconButton(
                    label: 'Edit todays note',
                    icon: Icons.edit,
                    onPressed: () {
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
