import 'package:app/components/grid/DayGrid.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const k_note_section_title = 'note.section.title';

class DailyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kSpacingSmall, horizontal: kSpacingSmall),
      color: kPrimaryDarkest,
      child: DayGrid(),
    );
  }
}
