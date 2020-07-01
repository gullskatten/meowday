import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:flutter/material.dart';

import '../../models/text/TextType.dart';

class StyledText extends StatelessWidget {
  final TextType type;
  final TextSize size;
  final TextColor color;
  final FontWeight fontWeight;
  final FontFamily fontFamily;
  final TextDecoration textDecoration;
  final String text;
  final int maxLines;

  StyledText(
    this.text, {
    this.type = TextType.body,
    this.size = TextSize.normal,
    this.color = TextColor.primary,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = FontFamily.body,
    this.textDecoration = TextDecoration.none,
    this.maxLines,
    Key key,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    final double _tSize = size.getSizeBasedOnVariant(type);

    // Subtitles and titles should use the title FontFamily - or alternatives.
    final String _fFamily = fontFamily == FontFamily.body && type.isTitleType
        ? FontFamily.title.family
        : fontFamily.family;

    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: _tSize,
          color: color.toColor,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: _fFamily),
    );
  }
}
