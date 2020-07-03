import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

class DailyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: kContainerPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.infinity,
              child: StyledText(
                'Notes',
                type: TextType.title,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
          StyledText(
              'Today I went for a walk with a beautiful girl. Then she noticed me so we went for a run.'),
          Material(
            borderRadius: BorderRadius.circular(4),
            color: kContainerPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(kSpacingNormal),
              child: Align(
                alignment: Alignment.centerRight,
                child: OpaqueIconButton(
                    label: 'Edit note',
                    icon: Icons.edit,
                    onPressed: () {
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
