import 'package:app/components/experience/ExperienceBar.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors/boxes.dart';

class OverallExperience extends StatelessWidget {
  final double percent = 55.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: orange,
      padding: EdgeInsets.all(kSpacingNormal),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ExperienceBar(
                  percent: percent > 100 ? 100.0 : percent,
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder: (widget, animation) {
                    return FadeTransition(
                      child: widget,
                      opacity: animation,
                      key: Key(percent.toStringAsFixed(1)),
                    );
                  },
                  child: StyledText(
                    '${percent > 100.0 ? 100 : percent.toStringAsFixed(1)} %',
                    key: Key(percent.toStringAsFixed(1)),
                    size: TextSize.smaller,
                    fontFamily: FontFamily.title,
                    fontWeight: FontWeight.bold,
                    color:
                        percent > 45 ? TextColor.tertiary : TextColor.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kSpacingTiny),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      CustomIcons.trophy,
                      color: Colors.white,
                      size: kBodySmaller,
                    ),
                    SizedBox(
                      width: kSpacingTiny,
                    ),
                    FittedBox(
                      child: StyledText(
                        'Level 1: Rookie',
                        fontFamily: FontFamily.title,
                        size: TextSize.smaller,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    StyledText(
                      '150 more experience to next level',
                      fontFamily: FontFamily.title,
                      size: TextSize.smaller,
                    ),
                    SizedBox(width: kSpacingTiny),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
