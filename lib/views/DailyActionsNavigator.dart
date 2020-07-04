import 'package:animations/animations.dart';
import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/views/dialogs/MoodDialog.dart';
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
             OpaqueIconButton(
                  label: 'Mood',
                  icon: Icons.mood,
                  onPressed: (){
                    showModal<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return MoodDialog();
                      },
                    );
                  }
             ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Note',
              icon: Icons.event_note,
              onPressed: (){
                showModal<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return MoodDialog();
                  },
                );
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Plans',
              icon: Icons.fitness_center,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Food',
              icon: Icons.fastfood,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Weight',
              icon: Icons.directions_run,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: 'Expenses',
              icon: Icons.attach_money,
              onPressed: () {
              }
          ),
        ],
      ),

    );
  }
}
