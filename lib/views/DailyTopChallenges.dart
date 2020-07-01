import 'package:app/components/challenges/ChallengesList.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class DailyTopChallenges extends StatefulWidget {

  @override
  _DailyTopChallengesState createState() => _DailyTopChallengesState();
}

class _DailyTopChallengesState extends State<DailyTopChallenges> {

  bool _isOpen = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: green,
      padding: EdgeInsets.all(kSpacingNormal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            title: FittedBox(
              child: StyledText(
                _isOpen ? 'Complete challenges to earn experience!' : "View today's challenges!",
                type: TextType.subtitle,
                textDecoration: _isOpen ? TextDecoration.none : TextDecoration.underline,
                fontWeight: FontWeight.w200,
                fontFamily: FontFamily.alternative,
              ),
            ),
            trailing: Icon(CustomIcons.trophy, size: _isOpen ? kBodyNormal : kSubtitleNormal, color: Colors.white60,),
            children: [LimitedBox(maxHeight: 200.0, child: ChallengesList())],
            onExpansionChanged: (isOpen) {
              setState(() {
                _isOpen = isOpen;
              });
            },
          )
        ],
      ),
    );
  }
}
