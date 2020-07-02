import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';
import '../constants/colors/boxes.dart';
import '../models/text/TextColor.dart';
import '../providers/CalendarProvider.dart';
import '../components/calendar/Calendar.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: orange,
        title: StyledText(
          "Calendar",
          fontFamily: FontFamily.alternative,
          type: TextType.subtitle,
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            buttonTheme: ThemeData.dark().buttonTheme,
            appBarTheme: ThemeData.dark().appBarTheme,
            primaryColor: Colors.white,
            bottomAppBarColor: Colors.teal,
            primaryColorLight: Colors.teal,
            accentColor: Colors.teal,
            highlightColor: Colors.teal,
            buttonColor: Colors.teal,
            primaryTextTheme: TextTheme(
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
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              subtitle2: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline1: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline2: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline3: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline4: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
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
              ),
            ),
            textTheme: TextTheme(
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
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              subtitle2: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline1: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline2: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline3: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
                color: TextColor.primary.toColor,
              ),
              headline4: TextStyle(
                fontFamily: FontFamily.title.family,
                fontWeight: FontWeight.bold,
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
              ),
            )),
        child: Column(
          children: <Widget>[
            Center(
              child: Calendar(),
            ),
            CalendarDatePicker(
              onDateChanged: (newDate) =>
                  context.read<CalendarProvider>().onSelect(newDate),
              initialCalendarMode: DatePickerMode.day,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDate: context.watch<CalendarProvider>().selectedDate,
            )
          ],
        ),
      ),
    );
  }
}
