import '/components/button/OpaqueIconButton.dart';
import '/components/container/ImageContainer.dart';
import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import '/locale/Loc.dart';
import '/models/text/FontFamily.dart';
import '/models/text/TextColor.dart';
import '/models/text/TextSize.dart';
import '/models/text/TextType.dart';
import '/providers/CalendarProvider.dart';
import '/utils/custom_icons_icons.dart';
import '/utils/determine_bg.dart';
import '/utils/greet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const k_profile_button_myprofile_label = 'profile.button.myprofile.label';

class NavbarOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kSpacingNormal, horizontal: kSpacingNormal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CustomIcons.cat,
                size: kBodyLarger,
                color: kSecondaryLight,
              ),
              SizedBox(
                width: kSpacingSmall,
              ),
              StyledText(
                'Meowday',
                color: TextColor.secondary,
                size: TextSize.bigger,
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      StyledText(
                        'Espen Gudmundsen',
                        maxLines: 1,
                        fontWeight: FontWeight.w200,
                        color: TextColor.primary,
                      ),
                      SizedBox(
                        width: kSpacingSmall,
                      ),
                      Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/espen.jpg'),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.white),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5.0,
                                  offset: Offset.fromDirection(-300, 5))
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
