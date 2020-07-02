import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/views/MoodSelect.dart';
import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: peach,
        title: StyledText(
          "How do you feel today?",
          fontFamily: FontFamily.alternative,
          type: TextType.subtitle,
        ),
      ),
      body: MoodSelect(),
    );
  }
}
