import '/components/experience/ExperienceBar.dart';
import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import '/locale/Loc.dart';
import '/models/text/FontFamily.dart';
import '/models/text/TextColor.dart';
import '/models/text/TextSize.dart';
import '/utils/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors/boxes.dart';

const k_experience_level_label = 'experience.level.label';
const k_experience_needed_label = 'experience.needed.label';

class OverallExperience extends StatelessWidget {
  final double percent = 55.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryDarkest,
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
                      width: kSpacingSmall,
                    ),
                    FittedBox(
                      child:  StyledText(
                        '${Loc.of(context).t(k_experience_level_label)} 2',
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
                      '150 ${Loc.of(context).t(k_experience_needed_label)}',
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
