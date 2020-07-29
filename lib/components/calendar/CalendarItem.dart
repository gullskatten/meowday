import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/calendar/Calendar.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const k_calendar_modal_day_title = 'calendar.modal.dayselect.title';

class CalendarItem extends StatelessWidget {
  const CalendarItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Calendar item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kSpacingNormal),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kSecondaryDark,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  spreadRadius: 2,
                  blurRadius: 5.0,
                ),
              ]),
          child: Consumer<CalendarProvider>(
            builder: (BuildContext calContext, CalendarProvider calendarState, _) {
              return InkWell(
                onTap: () async {
                  DateTime newSelectedDate = await showDatePicker(
                    context: calContext,
                    initialDate: calendarState.selectedDate,
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                    lastDate: calendarState.endDate,
                    helpText: Loc.of(context).t(k_calendar_modal_day_title),
                    builder: (datePickerContext, datePickerWidget) {
                      return Theme(
                        data: Theme.of(datePickerContext).copyWith(
                            primaryColor: Colors.white,
                            cursorColor: kPrimaryLight,
                            dialogBackgroundColor: kPrimaryDarkest,
                            primaryColorDark: Colors.white,
                            primaryColorBrightness: Brightness.dark,
                            textSelectionColor: kSecondaryLight,
                            textSelectionHandleColor: kPrimaryLight,
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                              background: kPrimaryLight,
                              primary: Colors.white60,
                              surface: kPrimaryLight,
                              brightness: Brightness.dark,
                            ),
                            inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kTertiaryLight,
                                    )),
                                hoverColor: kPrimaryLight,
                                focusColor: kPrimaryNormal,
                                fillColor: kPrimaryLight,
                                labelStyle: TextStyle(
                                  fontSize: kBodyNormal,
                                  color: Colors.white,
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
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: kTitleLarger,
                      color: Colors.white60,
                    ),
                    SizedBox(
                      height: kSpacingSmall,
                    ),
                    StyledText(
                      DateFormat('yyyy', Loc.of(context).locale.languageCode)
                          .format(item.day),
                      color: TextColor.primary60,
                      fontWeight: FontWeight.bold,
                    ),
                    StyledText(
                      DateFormat(
                          'EEEE, dd. MMMM', Loc.of(context).locale.languageCode)
                          .format(item.day),
                      type: TextType.subtitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              );
            },
          ),
    ),
    ],
    );
  }
}
