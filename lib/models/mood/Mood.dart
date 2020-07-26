import 'package:flutter/material.dart';

class Mood {
  String _id;
  String label;
  IconData icon;

  String get id => _id;

  Mood(this._id, {
    @required this.label,
    @required this.icon,
  });
}
