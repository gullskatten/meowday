import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/locale/Loc.dart';
import '/models/text/TextColor.dart';
import '/models/text/TextSize.dart';
import '/models/text/TextType.dart';
import 'package:flutter/material.dart';

const k_plans_section_title = 'plans.section.title';
const k_plans_section_description = 'plans.section.description';

class DailyPlans extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(kSpacingNormal),
      color: kSecondaryNormal,
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
                  Loc.of(context).t(k_plans_section_title),
                  type: TextType.title,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          SizedBox(height: kSpacingNormal, width: kSpacingNormal),
          StyledText(
             Loc.of(context).t(k_plans_section_description)),
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
