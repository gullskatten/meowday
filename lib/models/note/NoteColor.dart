import 'package:flutter/material.dart';

class NoteColor {
  String value;
  Color color;

  NoteColor({@required this.color, @required this.value});

  @override
  bool operator ==(other) {
    return value == other.value;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}
