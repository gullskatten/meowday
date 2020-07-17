import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/text/StyledText.dart';
import '../constants/colors/boxes.dart';
import '../constants/spacing/spacing.dart';
import '../constants/text/text_styles.dart';
import '../models/text/FontFamily.dart';
import '../models/text/TextColor.dart';
import '../models/text/TextType.dart';
import '../providers/CalendarProvider.dart';

class SelectedDateView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryDarkest,
      padding: EdgeInsets.symmetric(vertical: kSpacingNormal),
      child: Consumer<CalendarProvider>(
        builder: (BuildContext calContext, CalendarProvider calendarState, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => calendarState.onSelect(calendarState.selectedDate.subtract(Duration(days: 1))),
                child: Column(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: kTitleNormal,
                      color: Colors.white,
                    ),
                    StyledText(
                        DateFormat("EE")
                            .format(calendarState.selectedDate.subtract(Duration(days: 1))),
                      color: TextColor.primary60,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  DateTime newSelectedDate = await showDatePicker(
                    context: calContext,
                    initialDate: calendarState.selectedDate,
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                    lastDate: calendarState.endDate,
                    helpText: 'Select almanac day',
                    builder: (datePickerContext, datePickerWidget) {
                      return Theme(
                        data: Theme.of(datePickerContext).copyWith(
                            primaryColor: kPrimaryLight,
                            cursorColor: kPrimaryLight,
                            dialogBackgroundColor: kPrimaryDarkest,
                            primaryColorDark: kPrimaryNormal,
                            primaryColorBrightness: Brightness.dark,
                            textSelectionColor: kPrimaryNormal,
                            textSelectionHandleColor: kPrimaryNormal,
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                                  background: kPrimaryLight,
                                  primary: kPrimaryLight,
                                  surface: kPrimaryLight,
                                  brightness: Brightness.dark,
                                ),
                            inputDecorationTheme:
                                Theme.of(context).inputDecorationTheme.copyWith(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: kPrimaryLight,
                                    )),
                                    hoverColor: kPrimaryLight,
                                    focusColor: kPrimaryNormal,
                                    fillColor: kPrimaryLight,
                                    labelStyle: TextStyle(
                                      fontSize: kBodyNormal,
                                      color: kPrimaryLight,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: TextColor.primary60.toColor,
                          size: kBodyNormal,
                        ),
                        SizedBox(
                          width: kSpacingSmall,
                        ),
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
                        )
                      ],
                    ),
                    FittedBox(
                      child: StyledText(
                        DateFormat("EEEE, d.")
                            .format(calendarState.selectedDate),
                        type: TextType.title,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => calendarState.onSelect(calendarState.selectedDate.add(Duration(days: 1))),
                child: Column(
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: kTitleNormal,
                      color: calendarState.isSelectedDateToday
                          ? Colors.white30
                          : Colors.white,
                    ),
                    StyledText(
                      DateFormat("EE")
                          .format(calendarState.selectedDate.add(Duration(days: 1))),
                      color: calendarState.isSelectedDateToday ? TextColor.primary30
                           : TextColor.primary60,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
