import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const k_checkin_dialog_title = 'checkin.dialog.title';

class CheckInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryNormal,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StyledText(
            Loc.of(context).t(k_checkin_dialog_title),
            fontFamily: FontFamily.alternative,
            type: TextType.subtitle,
          ),
          SizedBox(
            height: kSpacingNormal,
          ),
          Consumer<CalendarProvider>(builder:
    (BuildContext calContext,
    CalendarProvider calendarState, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: calendarState.placemark.map((element) {
                return OpaqueIconButton(
                  label: '${element.name} ${element.postalCode}, ${element.locality}, ${element.country}',
                  icon: Icons.place,
                  onPressed: (){
                    debugPrint('Selected: ${element.name}');
                  },
                );
              }).toList(growable: false),
            );
    }),
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
