import 'package:animations/animations.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/screens/ChallengesScreen.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class DailyTopChallenges extends StatefulWidget {
  @override
  _DailyTopChallengesState createState() => _DailyTopChallengesState();
}

class _DailyTopChallengesState extends State<DailyTopChallenges> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return ChallengesScreen();
      },
      tappable: false,
      closedColor: blue,
      openColor: blue,
      closedElevation: 0.0,
      openElevation: 0.0,
      transitionDuration: Duration(milliseconds: 400),
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: Container(
            color: blue,
            padding: EdgeInsets.all(kSpacingNormal),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: StyledText(
                    "New challenges available!",
                    type: TextType.subtitle,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w200,
                    fontFamily: FontFamily.alternative,
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: Container(
                      height: 48.0,
                      width: 48.0,
                      padding: EdgeInsets.all(kSpacingSmall),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.white,
                                blurRadius: 48.0,
                                offset: Offset.fromDirection(0, 0)),
                            new BoxShadow(
                                color: Colors.blue,
                                blurRadius: 96.0,
                                offset: Offset.fromDirection(0, 0))
                          ]),
                      child: Center(
                        child: FittedBox(
                          child: Icon(
                            CustomIcons.trophy,
                            size: kSubtitleNormal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
