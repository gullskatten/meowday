import 'package:app/components/challenges/ChallengesList.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transitions/SlideWithFadeInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
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
        backgroundColor: blue,
        title: StyledText(
          "Daily Challenges",
          fontFamily: FontFamily.alternative,
          type: TextType.subtitle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(kSpacingNormal),
            child: StyledText(
              'New challenges arrive here every day. Each challenge provides experience points when completed, and is an easy way of creating healthy habits. You can also create your own challenges, and decide how often they should occur.',
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
