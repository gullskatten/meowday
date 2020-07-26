import 'package:flutter/material.dart';

class Weather {
  String _id;
  String label;
  IconData icon;

  String get id => _id;

  Weather(this._id, {
    @required this.label,
    @required this.icon,
  });
}
