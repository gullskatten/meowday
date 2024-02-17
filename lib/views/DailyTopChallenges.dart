import 'package:animations/animations.dart';
import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import '/locale/Loc.dart';
import '/models/text/FontFamily.dart';
import '/models/text/TextType.dart';
import '/screens/ChallengesScreen.dart';
import '/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

const k_challenge_banner_title = 'challenge.banner.title';

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
      closedColor: kSecondaryLight,
      openColor: kSecondaryLight,
      closedElevation: 0.0,
      openElevation: 0.0,
      closedShape: BeveledRectangleBorder(),
      transitionDuration: Duration(milliseconds: 400),
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: Container(
            color: kSecondaryLight,
            padding: EdgeInsets.all(kSpacingNormal),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: StyledText(
                    Loc.of(context).t(k_challenge_banner_title),
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
                                color: kPrimaryLight,
                                blurRadius: 72.0,
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
