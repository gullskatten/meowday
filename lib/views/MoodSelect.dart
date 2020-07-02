import 'package:app/components/mood/MoodFace.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:flutter/material.dart';

class MoodSelect extends StatefulWidget {
  @override
  _MoodSelectState createState() => _MoodSelectState();
}

class _MoodSelectState extends State<MoodSelect> {
  String _selectedMood = 'sentiment_very_satisfied';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MoodFace(
                  onTap: () => updateMood('sentiment_very_dissatisfied'),
                  faceIdentifier: 'sentiment_very_dissatisfied',
                  fadeInDelay: 400,
                  icon: Icons.sentiment_very_dissatisfied,
                  isSelected: _selectedMood == 'sentiment_very_dissatisfied',
                ),
                MoodFace(
                  onTap: () => updateMood('sentiment_dissatisfied'),
                  faceIdentifier: 'sentiment_dissatisfied',
                  fadeInDelay: 300,
                  icon: Icons.sentiment_dissatisfied,
                  isSelected: _selectedMood == 'sentiment_dissatisfied',
                ),
                MoodFace(
                  onTap: () => updateMood('sentiment_neutral'),
                  faceIdentifier: 'sentiment_neutral',
                  fadeInDelay: 200,
                  icon: Icons.sentiment_neutral,
                  isSelected: _selectedMood == 'sentiment_neutral',
                ),
                MoodFace(
                  onTap: () => updateMood('sentiment_satisfied'),
                  faceIdentifier: 'sentiment_satisfied',
                  fadeInDelay: 100,
                  icon: Icons.sentiment_satisfied,
                  isSelected: _selectedMood == 'sentiment_satisfied',
                ),
                MoodFace(
                  onTap: () => updateMood('sentiment_very_satisfied'),
                  faceIdentifier: 'sentiment_very_satisfied',
                  icon: Icons.sentiment_very_satisfied,
                  isSelected: _selectedMood == 'sentiment_very_satisfied',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void updateMood(String mood) {
    setState(() {
      _selectedMood = mood;
    });

    if (_selectedMood == 'sentiment_very_satisfied') {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: StyledText("Woho! Awesome."),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
