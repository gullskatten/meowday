import 'package:flutter/material.dart';

enum FontFamily {
  body, title, alternative
}

extension FontFamilies on FontFamily {

  String get family {
    switch(this) {
      case FontFamily.body:
        return 'Raleway';
      case FontFamily.title:
        return 'Quicksand';
      case FontFamily.alternative:
        return 'Pacifico';
      default:
        return 'Raleway';
    }
  }
}