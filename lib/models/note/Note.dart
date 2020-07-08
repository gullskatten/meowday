import 'package:flutter/material.dart';

class Note {
  String _id;
  String text;
  String title;
  DateTime createdAt = DateTime.now();

  String get id => _id;
  Color color;

  Note(this.text, {this.color = Colors.teal, this.title});
}
