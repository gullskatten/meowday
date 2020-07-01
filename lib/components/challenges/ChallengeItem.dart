import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
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
      @required this.item,
      this.selected = false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline4;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SlideTransition(
        position: animation.drive(
            Tween(begin: Offset(2, 0.0), end: Offset(0, 0))
                .chain(CurveTween(curve: Curves.easeInOut))),
        child: Container(
          padding: EdgeInsets.all(kSpacingNormal),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(0,4), spreadRadius: 2, blurRadius: 5.0)
                    ]),
                child: ListTile(
                  leading: Icon(
                    Icons.fitness_center,
                    size: kSubtitleNormal,
                    color: Colors.white60,
                  ),
                  title: StyledText(
                    'Keep the wheels going.',
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: StyledText(
                    'Do 10 push-ups.',
                    fontWeight: FontWeight.bold,
                    size: TextSize.smaller,
                  ),
                ),
              ),
              SizedBox(
                width: kSpacingSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                      child: StyledText('Hide this challenge', size: TextSize.smaller,),
                      onPressed: () => {},
                      ),
                  OpaqueIconButton(
                    label: 'Mark as complete',
                    icon: Icons.check,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
