import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/components/container/ImageContainer.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/providers/CalendarProvider.dart';
import 'package:app/utils/determine_bg.dart';
import 'package:app/utils/greet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


const k_profile_button_myprofile_label = 'profile.button.myprofile.label';

class NavbarOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ImageContainer(AssetImage(determineBackground(context.watch<CalendarProvider>().selectedDate)),
            child: Column(
              children: <Widget>[
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/espen.jpg'),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                      border: Border.all(
                        style: BorderStyle.solid, width: 1.0, color: Colors.white
                      ),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                            offset: Offset.fromDirection(-300, 5))
                      ]),
                ),
                FittedBox(
                  child: StyledText(
                    '${greet(context.watch<CalendarProvider>().selectedDate, context)}, Espen',
                    maxLines: 1,
                    type: TextType.title,
                    fontWeight: FontWeight.w200,
                    color: TextColor.primary,
                  ),
                ),
              ],
            )),
        Positioned(
          top: 10.0,
          right: 10,
          child: OpaqueIconButton(
            label: Loc.of(context).t(k_profile_button_myprofile_label),
            icon: Icons.person,
            onPressed: () {
            },
          ),
        )
      ],
    );
  }
}
