import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

class DailyPlans extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: kContainerSecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: SizedBox(
                width: double.infinity,
                child: StyledText(
                  'My plans',
                  type: TextType.title,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
          StyledText(
              "Here's a list of things you've planned."),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
              Container(
                height: 250.0,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: StyledText(
                        'Workout outside',
                        type: TextType.subtitle,
                        size: TextSize.smaller,
                      ),
                      subtitle: StyledText(
                        '09:00 AM - 11:00 AM',
                        color: TextColor.primary60,
                      ),
                      leading: Icon(
                        Icons.fitness_center,
                        color: TextColor.primary60.toColor,
                      ),
                    ),
                    ListTile(
                      onTap: () => {},
                      title: StyledText(
                        'Study Flutter',
                        type: TextType.subtitle,
                        size: TextSize.smaller,
                      ),
                      subtitle: StyledText(
                        '11:15 AM - 5:50 PM',
                        color: TextColor.primary60,
                      ),
                      leading: Icon(
                        Icons.school,
                        color: TextColor.primary60.toColor,
                      ),
                    ),
                    ListTile(
                      onTap: () => {},
                      title: StyledText(
                        'Pancakes!',
                        type: TextType.subtitle,
                        size: TextSize.smaller,
                      ),
                      subtitle: StyledText(
                        '5:50 PM - 6:30 PM',
                        color: TextColor.primary60,
                      ),
                      leading: Icon(
                        Icons.restaurant,
                        color: TextColor.primary60.toColor,
                      ),
                    ),
                    ListTile(
                      onTap: () => {},
                      title: StyledText(
                        'Study Flutter',
                        type: TextType.subtitle,
                        size: TextSize.smaller,
                      ),
                      subtitle: StyledText(
                        '6:30 PM - 11:50 PM',
                        color: TextColor.primary60,
                      ),
                      leading: Icon(
                        Icons.school,
                        color: TextColor.primary60.toColor,
                      ),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}
