import 'package:app/components/challenge/ChallengesList.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/SlideWithFadeInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

const k_challenges_screen_title = 'challenges.screen.title';
const k_challenges_screen_description = 'challenges.screen.description';

class ChallengesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTertiaryLight,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: kSubtitleNormal,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
        elevation: 0.0,
        backgroundColor: kTertiaryLight,
        title: StyledText(
          Loc.of(context).t(k_challenges_screen_title),
          fontFamily: FontFamily.alternative,
          type: TextType.subtitle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(kSpacingNormal),
            child: StyledText(
                Loc.of(context).t(k_challenges_screen_description)
                ),
          ),
          Flexible(child: SlideWithFadeInTransition(
              id: "once",
              delay: 150,
              child: ChallengesList())),
        ],
      ),
    );
  }
}
