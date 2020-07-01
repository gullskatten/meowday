import 'package:app/components/calendar/DateTile.dart';
import 'package:app/components/calendar/MonthName.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarStrip(
      startDate: context.select((CalendarProvider value) => value.startDate),
      endDate: context.select((CalendarProvider value) => value.endDate),
      onDateSelected: (newDate) =>
          context.read<CalendarProvider>().onSelect(newDate),
      dateTileBuilder: (date, selectedDate, rowIndex, dayName, isDateMarked,
              isDateOutOfRange) =>
          DateTile(
        dateOfTile: date,
        selectedDate: selectedDate,
        rowIndex: rowIndex,
        dayName: dayName,
        isDateMarked: isDateMarked,
        isDateOutOfRange: isDateOutOfRange,
      ),
      iconColor: Colors.white,
      monthNameWidget: (monthName) => MonthName(monthName),
      markedDates: context.watch<CalendarProvider>().markedDates,
      containerDecoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const <Color>[
          orange,
          kSectionPrimaryColor,
        ],
        stops: const <double>[0.6, 1.0],
      )),
      containerHeight: 150.0,
    );
  }
}
