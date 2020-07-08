import 'package:flutter/material.dart';

class Challenge {
  String _id;
  String title;
  String description;
  IconData icon;
  int experiencePoints;
  Color color;

  String get id => _id;

  Challenge({
    @required this.title,
    this.description = '',
    @required this.icon,
    @required this.experiencePoints,
    this.color = Colors.brown,
  });
}
