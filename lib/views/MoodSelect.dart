import 'package:app/components/icon/SelectableIcon.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/ScaleInTransition.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/mood/Mood.dart';
import 'package:flutter/material.dart';

const k_mood_sentiment_very_dissatisfied =
    'mood.option.sentiment_very_dissatisfied';
const k_mood_sentiment_dissatisfied = 'mood.option.sentiment_dissatisfied';
const k_mood_sentiment_neutral = 'mood.option.sentiment_neutral';
const k_mood_sentiment_satisfied = 'mood.option.sentiment_satisfied';
const k_mood_sentiment_very_satisfied = 'mood.option.sentiment_very_satisfied';

class MoodSelect extends StatefulWidget {
  @override
  _MoodSelectState createState() => _MoodSelectState();
}

List<Mood> _moodTypes = [
  Mood(k_mood_sentiment_very_dissatisfied,
      label: k_mood_sentiment_very_dissatisfied,
      icon: Icons.sentiment_very_dissatisfied),
  Mood(k_mood_sentiment_dissatisfied,
      label: k_mood_sentiment_dissatisfied, icon: Icons.sentiment_dissatisfied),
  Mood(k_mood_sentiment_neutral,
      label: k_mood_sentiment_neutral, icon: Icons.sentiment_neutral),
  Mood(k_mood_sentiment_satisfied,
      label: k_mood_sentiment_satisfied, icon: Icons.sentiment_satisfied),
  Mood(k_mood_sentiment_very_satisfied,
      label: k_mood_sentiment_very_satisfied,
      icon: Icons.sentiment_very_satisfied),
];

class _MoodSelectState extends State<MoodSelect> {
  String _selectedMood = k_mood_sentiment_very_satisfied;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _moodTypes
                .asMap()
                .entries
                .map((e) => Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSpacingSmall),
                    child: SelectableIcon(
                            onTap: () => updateMood(e.value.id),
                            iconIdentifier: e.value.id,
                            fadeInDelay: e.key * 100,
                            icon: e.value.icon,
                            isSelected: _selectedMood == e.value.id,
                          ),
                    ),
                  ),
                ))
                .toList()),
        SizedBox(
          height: kSpacingNormal,
        ),
        ScaleInTransition(
          id: _selectedMood,
          delay: 0,
          end: 1.0,
          begin: 0.85,
          child: StyledText(
            Loc.of(context).t(_selectedMood),
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
}
