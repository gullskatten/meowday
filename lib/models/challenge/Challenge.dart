import 'package:flutter/material.dart';

class Challenge {
  String title;
  String description;
  IconData icon;
  int experiencePoints;
  Color color;

  Challenge({
    @required this.title,
    this.description = '',
    @required this.icon,
    @required this.experiencePoints,
    this.color = Colors.brown,
  });
}
