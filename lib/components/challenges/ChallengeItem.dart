import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/challenge/Challenge.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:flutter/material.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value.
///
/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class ChallengeItem extends StatelessWidget {
  const ChallengeItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item})
      : assert(animation != null),
        assert(item != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final Challenge item;

  @override
  Widget build(BuildContext context) {

    return SlideTransition(
      position: animation.drive(
          Tween(begin: Offset(2, 0.0), end: Offset(0, 0))
              .chain(CurveTween(curve: Curves.easeInOut))),
      child: Container(
        padding: EdgeInsets.all(kSpacingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(kSpacingNormal),
              decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        spreadRadius: 2,
                        blurRadius: 5.0)
                  ]),
              child: ListTile(
                trailing: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.more_vert,
                      size: kSubtitleNormal,
                      color: Colors.white60,
                    ),
                  ),
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      item.icon,
                      size: kSubtitleNormal,
                      color: Colors.white60,
                    ),
                    SizedBox(
                      height: kSpacingTiny,
                    ),
                    StyledText(
                      '${item.experiencePoints} xp',
                      size: TextSize.smaller,
                      color: TextColor.primary60,
                      fontFamily: FontFamily.title,
                    )
                  ],
                ),
                title: StyledText(
                  item.title,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: StyledText(
                  item.description,
                  fontWeight: FontWeight.bold,
                  size: TextSize.smaller,
                  color: TextColor.primary60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
