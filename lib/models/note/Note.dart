import 'package:app/components/note/NoteItem.dart';
import 'package:flutter/material.dart';

import '../AbstractDayItem.dart';

class Note implements AbstractDayItem {
  String _id;
  String text;
  String title;
  DateTime createdAt = DateTime.now();

  String get id => _id;
  Color color;

  Note(this.text, {this.color = Colors.teal, this.title});

  @override
  Widget build(BuildContext context) {
    return NoteItem(
      item: this,
    );
  }

  @override
  int size() {
    return 2;
  }
}
