import 'package:flutter/material.dart';

class NoteGridSize {
  int value;
  String name;

  NoteGridSize({@required this.name, @required this.value});

  @override
  bool operator ==(other) {
    return value == other.value;
  }

  @override
  int get hashCode => super.hashCode;

}
