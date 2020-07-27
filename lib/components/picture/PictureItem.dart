import 'package:app/components/container/ImageContainer.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/picture/Picture.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:flutter/material.dart';

class PictureItem extends StatelessWidget {
  const PictureItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Picture item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100,
          ),
          child: Container(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(kSpacingNormal),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.url),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.white60, BlendMode.darken),
                  ),
                  color: kTertiaryNormal,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        spreadRadius: 2,
                        blurRadius: 5.0)
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
