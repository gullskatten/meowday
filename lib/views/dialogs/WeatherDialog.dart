import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/locale/Loc.dart';
import '/models/text/FontFamily.dart';
import '/models/text/TextColor.dart';
import '/models/text/TextType.dart';
import '/views/WeatherSelect.dart';
import 'package:flutter/material.dart';

const k_weather_dialog_title = 'weather.dialog.title';

class WeatherDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryNormal,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FittedBox(
            child: StyledText(
              Loc.of(context).t(k_weather_dialog_title),
              fontFamily: FontFamily.alternative,
              type: TextType.subtitle,
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: kSpacingNormal,
          ),
          WeatherSelect(),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            Loc.of(context).t(k_common_button_cancel),
            fontWeight: FontWeight.bold,
            color: TextColor.primary60,
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            Loc.of(context).t(k_common_button_confirm),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
