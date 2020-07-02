import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:app/screens/CalendarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../components/button/OpaqueIconButton.dart';
import '../components/text/StyledText.dart';
import '../components/text/StyledText.dart';
import '../constants/colors/boxes.dart';
import '../constants/colors/boxes.dart';
import '../constants/colors/boxes.dart';
import '../constants/colors/boxes.dart';
import '../constants/spacing/spacing.dart';
import '../constants/spacing/spacing.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../constants/text/text_styles.dart';
import '../models/text/FontFamily.dart';
import '../models/text/TextColor.dart';
import '../models/text/TextType.dart';
import '../providers/CalendarProvider.dart';
import 'package:provider/provider.dart';

import '../providers/CalendarProvider.dart';

class SelectedDateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: kSpacingNormal),
      child: Column(
        children: [
          Consumer<CalendarProvider>(
            builder:
                (BuildContext calContext, CalendarProvider calendarState, _) {
              return InkWell(
                onTap: () async {
                  DateTime newSelectedDate = await showDatePicker(
                    context: calContext,
                    initialDate: calendarState.selectedDate,
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                    lastDate: DateTime.now(),
                    helpText: 'Select almanac day',
                    builder: (datePickerContext, datePickerWidget) {
                      return Theme(
                        data: Theme.of(datePickerContext).copyWith(
                            primaryColor: orange,
                            cursorColor: orange,
                            dialogBackgroundColor: asphalt,
                            primaryColorDark: orange,
                            primaryColorBrightness: Brightness.dark,
                            textSelectionColor: orange,
                            textSelectionHandleColor: orange,
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                                  background: orange,
                                  primary: orange,
                                  surface: orange,
                                  brightness: Brightness.dark,
                                ),
                            inputDecorationTheme:
                                Theme.of(context).inputDecorationTheme.copyWith(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.orange,
                                    )),
                                    hoverColor: Colors.orange,
                                    focusColor: orange,
                                    fillColor: orange,
                                    labelStyle: TextStyle(
                                      fontSize: kBodyNormal,
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                    )),
                            textTheme: Theme.of(context).textTheme.copyWith(
                                  bodyText1: TextStyle(
                                    fontFamily: FontFamily.body.family,
                                    color: TextColor.primary.toColor,
                                  ),
                                  bodyText2: TextStyle(
                                    fontFamily: FontFamily.body.family,
                                    color: TextColor.primary.toColor,
                                  ),
                                  caption: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    color: TextColor.primary.toColor,
                                  ),
                                  subtitle1: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  subtitle2: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  headline1: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  headline2: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  headline3: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  headline4: TextStyle(
                                    fontFamily: FontFamily.title.family,
                                    fontWeight: FontWeight.w200,
                                    color: TextColor.primary.toColor,
                                  ),
                                  button: TextStyle(
                                    fontFamily: FontFamily.body.family,
                                    fontWeight: FontWeight.bold,
                                    color: TextColor.primary.toColor,
                                  ),
                                  overline: TextStyle(
                                    fontFamily: FontFamily.body.family,
                                    color: TextColor.primary.toColor,
                                    fontSize: kBodyNormal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                        child: datePickerWidget,
                      );
                    },
                  );

                  if (newSelectedDate != null) {
                    calendarState.onSelect(newSelectedDate);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TyperAnimatedTextKit(
                      key: Key(calendarState.selectedDate.month.toString()),
                      text: [
                        DateFormat("MMMM yyyy")
                            .format(calendarState.selectedDate)
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
                    StyledText(
                      DateFormat("EEEE, d.").format(calendarState.selectedDate),
                      type: TextType.title,
                      fontWeight: FontWeight.w200,
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
        ],
      ),
    );
  }
}
