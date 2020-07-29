import 'package:animations/animations.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/screens/ChallengesScreen.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

const k_challenge_banner_title = 'challenge.banner.title';

class DailyTopChallenges extends StatefulWidget {
  @override
  _DailyTopChallengesState createState() => _DailyTopChallengesState();
}

class _DailyTopChallengesState extends State<DailyTopChallenges> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacingSmall),
      child: OpenContainer<bool>(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return ChallengesScreen();
        },
        tappable: false,
        closedColor: blue,
        openColor: asphalt,
        closedElevation: 0.0,
        openElevation: 0.0,
        closedShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        transitionDuration: Duration(milliseconds: 400),
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return InkWell(
            onTap: openContainer,
            child: Container(
              padding: EdgeInsets.all(kSpacingNormal),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: asphalt,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        spreadRadius: 2,
                        blurRadius: 5.0)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: StyledText(
                        Loc.of(context).t(k_challenge_banner_title),
                        type: TextType.subtitle,
                        textDecoration: TextDecoration.underline,
                        fontWeight: FontWeight.w200,
                        fontFamily: FontFamily.alternative,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      height: 48.0,
                      width: 48.0,
                      padding: EdgeInsets.all(kSpacingSmall),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
                        child: Icon(
                          CustomIcons.trophy,
                          size: kSubtitleNormal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
