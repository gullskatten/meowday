import '/constants/colors/boxes.dart';
import 'package:flutter/material.dart';

enum TextColor {
  primary, primary30, primary60, secondary, tertiary, warn, error, black
}

extension TextColors on TextColor {

  Color get toColor {
    switch(this) {
      case TextColor.primary:
        return Colors.white;
      case TextColor.primary30:
        return Colors.white30;
      case TextColor.primary60:
        return Colors.white60;
      case TextColor.secondary:
        return kSecondaryLight;
      case TextColor.tertiary:
        return kTertiaryNormal;
      case TextColor.warn:
        return Colors.orangeAccent;
      case TextColor.error:
        return Colors.redAccent;
      case TextColor.black:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}