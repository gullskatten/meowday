import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Weather item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kSpacingNormal),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kTertiaryNormal,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 5.0)
              ]),
          child: Column(
            children: [
              Icon(
                item.icon,
                size: kTitleLarger,
                color: Colors.white60,
              ),
              SizedBox(
                height: 20.0,
              ),
              StyledText(item.label),
            ],
          ),
        )
      ],
    );
  }
}
