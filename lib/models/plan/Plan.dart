import 'package:flutter/material.dart';

class Plan {
  String _id;
  DateTime from;
  DateTime to;
  bool wholeDayEvent;
  String title;
  String description;
  IconData icon;

  get id => _id;

  Plan(this._id, {
    @required this.title,
    this.from,
    this.to,
    this.wholeDayEvent = false,
    this.description,
    this.icon = Icons.place
  });
}