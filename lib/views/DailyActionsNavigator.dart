import 'package:animations/animations.dart';
import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/screens/MoodScreen.dart';
import 'package:flutter/material.dart';

class DailyActionsNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSectionPrimaryColor,
      height: 50.0,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(kSpacingSmall),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          OpenContainer<bool>(
            transitionType: ContainerTransitionType.fade,
            openBuilder: (BuildContext context, VoidCallback _) {
              return MoodScreen();
            },
            tappable: false,
            closedColor: peach,
            openColor: peach,
            closedElevation: 0.0,
            openElevation: 0.0,
            transitionDuration: Duration(milliseconds: 400),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return OpaqueIconButton(
                  label: 'Mood',
                  icon: Icons.mood,
                  onPressed: (){
                    openContainer();
                  }
              );
            },
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Notes',
              icon: Icons.event_note,
              onPressed: () {
                print('pressed!');
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Plans',
              icon: Icons.fitness_center,
              onPressed: () {
                print('pressed!');
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Food',
              icon: Icons.fastfood,
              onPressed: () {
                print('pressed!');
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Weight',
              icon: Icons.directions_run,
              onPressed: () {
                print('pressed!');
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Expenses',
              icon: Icons.attach_money,
              onPressed: () {
                print('pressed!');
              }
          ),
        ],
      ),

    );
  }
}
