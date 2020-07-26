import 'package:app/components/mood/MoodFace.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/ScaleInTransition.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/views/dialogs/MoodDialog.dart';
import 'package:flutter/material.dart';

class MoodSelect extends StatefulWidget {
  @override
  _MoodSelectState createState() => _MoodSelectState();
}
const _veryDissatisfied = 'sentiment_very_dissatisfied';
const _dissatisfied = 'sentiment_dissatisfied';
const _neutral = 'sentiment_neutral';
const _satisfied = 'sentiment_satisfied';
const _verySatisfied = 'sentiment_very_satisfied';

class _MoodSelectState extends State<MoodSelect> {
  String _selectedMood = 'sentiment_very_satisfied';


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MoodFace(
              onTap: () => updateMood(_veryDissatisfied),
              faceIdentifier: _veryDissatisfied,
              fadeInDelay: 400,
              icon: Icons.sentiment_very_dissatisfied,
              isSelected: _selectedMood == _veryDissatisfied,
            ),
            MoodFace(
              onTap: () => updateMood(_dissatisfied),
              faceIdentifier: _dissatisfied,
              fadeInDelay: 300,
              icon: Icons.sentiment_dissatisfied,
              isSelected: _selectedMood == _dissatisfied,
            ),
            MoodFace(
              onTap: () => updateMood(_neutral),
              faceIdentifier: _neutral,
              fadeInDelay: 200,
              icon: Icons.sentiment_neutral,
              isSelected: _selectedMood == _neutral,
            ),
            MoodFace(
              onTap: () => updateMood(_satisfied),
              faceIdentifier: _satisfied,
              fadeInDelay: 100,
              icon: Icons.sentiment_satisfied,
              isSelected: _selectedMood == _satisfied,
            ),
            MoodFace(
              onTap: () => updateMood(_verySatisfied),
              faceIdentifier: _verySatisfied,
              icon: Icons.sentiment_very_satisfied,
              isSelected: _selectedMood == _verySatisfied,
            ),
          ],
        ),
        SizedBox(height: kSpacingNormal,),
        ScaleInTransition(
          id: _selectedMood,
          delay: 0,
          end: 1.0,
          begin: 0.85,
          child: StyledText(
            determineMoodText(context),
          ),
        )
      ],
    );
  }

  void updateMood(String mood) {
    setState(() {
      _selectedMood = mood;
    });
  }

  String determineMoodText(BuildContext context) {
    switch(_selectedMood) {
      case _veryDissatisfied:
        return Loc.of(context).t(k_mood_option_1);
      case _dissatisfied:
        return Loc.of(context).t(k_mood_option_2);
      case _neutral:
        return Loc.of(context).t(k_mood_option_3);
      case _satisfied:
        return Loc.of(context).t(k_mood_option_4);
      case _verySatisfied:
      default:
        return Loc.of(context).t(k_mood_option_5);
    }
  }
}
