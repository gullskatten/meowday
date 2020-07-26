import 'package:animations/animations.dart';
import 'package:app/components/button/OpaqueIconButton.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/views/dialogs/MoodDialog.dart';
import 'package:app/views/dialogs/NoteDialog.dart';
import 'package:flutter/material.dart';

const k_actions_button_mood = 'actions.button.mood';
const k_actions_button_note = 'actions.button.note';
const k_actions_button_tag = 'actions.button.tag';
const k_actions_button_plans = 'actions.button.plans';
const k_actions_button_picture = 'actions.button.picture';
const k_actions_button_food = 'actions.button.food';
const k_actions_button_weight = 'actions.button.weight';


class DailyActionsNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryNormal,
      height: 50.0,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(kSpacingSmall),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
             OpaqueIconButton(
                  label: Loc.of(context).t(k_actions_button_mood),
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
              label: Loc.of(context).t(k_actions_button_note),
              icon: Icons.event_note,
              onPressed: (){
                showModal<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return NoteDialog();
                  },
                );
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: Loc.of(context).t(k_actions_button_tag),
              icon: Icons.filter_vintage,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: Loc.of(context).t(k_actions_button_picture),
              icon: Icons.camera_alt,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: Loc.of(context).t(k_actions_button_plans),
              icon: Icons.fitness_center,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: Loc.of(context).t(k_actions_button_food),
              icon: Icons.fastfood,
              onPressed: () {
              }
          ),
          SizedBox(width: 15.0,),
          OpaqueIconButton(
              label: Loc.of(context).t(k_actions_button_weight),
              icon: Icons.directions_run,
              onPressed: () {
              }
          ),
        ],
      ),

    );
  }
}
