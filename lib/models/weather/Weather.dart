import 'package:app/components/weather/WeatherItem.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:flutter/material.dart';

class Weather implements AbstractDayItem {
  String _id;
  String label;
  IconData icon;

  get id => _id;

  Weather(this._id, {
    @required this.label,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherItem(
      item: this,
      onTap: (){},
    );
  }

  @override
  int size() {
    return 2;
  }
}
