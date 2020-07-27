import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/tag/Tag.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class TagItem extends StatelessWidget {
  const TagItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Tag item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kSpacingNormal),
          decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 5.0)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                CustomIcons.hashtag,
                size: kBodyNormal,
                color: Colors.white60,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Align(
                  child: StyledText( item.tag,
                    type: TextType.subtitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
