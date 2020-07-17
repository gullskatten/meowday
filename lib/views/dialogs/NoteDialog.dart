import 'package:animations/animations.dart';
import 'package:app/components/button/FlatIconButton.dart';
import 'package:app/components/note/NoteColorSelect.dart';
import 'package:app/components/note/NoteGridSizeSelect.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';

class NoteDialog extends StatefulWidget {
  @override
  _NoteDialogState createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isDisplayingSettings = false;

  void _toggleSettings() {
    setState(() {
      _isDisplayingSettings = !_isDisplayingSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryNormal,
      content: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: false,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: _transitionType,
            fillColor: kPrimaryNormal,
          );
        },
        child: _isDisplayingSettings
            ? _NoteSettings(
                onBackPressed: _toggleSettings,
              ) : _NoteWriteNew(
          onSettingsPressed: _toggleSettings,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            'Cancel',
            fontWeight: FontWeight.bold,
            color: TextColor.primary60,
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            'Save',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _NoteWriteNew extends StatelessWidget {
  final Function onSettingsPressed;

  _NoteWriteNew({@required this.onSettingsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0,
                width: kBodyNormal,
              ),
              StyledText(
                'New note',
                type: TextType.subtitle,
              ),
              FlatIconButton(
                icon: Icons.settings,
                onPressed: onSettingsPressed,
              ),
            ],
          ),
          SizedBox(
            height: kSpacingSmall,
          ),
          Container(
            height: 200,
            child: TextField(
              autofocus: true,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              expands: true,
              decoration:
                  InputDecoration.collapsed(hintText: 'Write something here..'),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteSettings extends StatelessWidget {
  final Function onBackPressed;

  _NoteSettings({@required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatIconButton(
                icon: Icons.arrow_back,
                onPressed: onBackPressed,
              ),
              StyledText(
                'Options',
                type: TextType.subtitle,
              ),
              Container(
                height: 0,
                width: kBodyNormal,
              ),
            ],
          ),
          SizedBox(
            height: kSpacingNormal,
          ),
          Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    'Size',
                    type: TextType.body,
                    fontWeight: FontWeight.bold,
                  ),
                  NoteGridSizeSelect(),
                  SizedBox(
                    height: kSpacingTiny,
                  ),
                  StyledText(
                    'Specify how much space this note should take up in the Note section grid. '
                    'By default notes fill 50% of the grid (horizontally). ',
                    size: TextSize.smaller,
                  ),
                  SizedBox(
                    height: kSpacingNormal,
                  ),
                  StyledText('Note color',
                      type: TextType.body, fontWeight: FontWeight.bold),
                  NoteColorSelect(),
                ],
              )),
        ],
      ),
    );
  }
}
