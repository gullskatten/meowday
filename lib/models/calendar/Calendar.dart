import 'package:app/components/calendar/CalendarItem.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:flutter/material.dart';

class Calendar implements AbstractDayItem {
  String _id;
  DateTime day;

  get id => _id;

  Calendar(this._id, this.day);

  @override
  Widget build(BuildContext context) {
    return CalendarItem(
      item: this,
      onTap: () {

      },
    );
  }

  @override
  int size() {
    return 2;
  }
}
