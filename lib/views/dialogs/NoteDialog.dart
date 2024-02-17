import 'package:animations/animations.dart';
import '/components/button/FlatIconButton.dart';
import '/components/note/NoteColorSelect.dart';
import '/components/note/NoteGridSizeSelect.dart';
import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import '/locale/Loc.dart';
import '/models/text/TextColor.dart';
import '/models/text/TextSize.dart';
import '/models/text/TextType.dart';
import 'package:flutter/material.dart';

const k_note_new_title = 'note.new.title';
const k_note_new_placeholder = 'note.new.text.placeholder';
const k_note_new_options_title = 'note.new.options.title';
const k_note_options_color_title = 'note.new.options.color.title';
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
            Loc.of(context).t(k_common_button_cancel),
            fontWeight: FontWeight.bold,
            color: TextColor.primary60,
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: StyledText(
            Loc.of(context).t(k_common_button_confirm),
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
                Loc.of(context).t(k_note_new_title),
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
                  InputDecoration.collapsed(hintText: Loc.of(context).t(k_note_new_placeholder)),
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
                Loc.of(context).t(k_note_new_options_title),
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
                  SizedBox(
                    height: kSpacingNormal,
                  ),
                  StyledText(Loc.of(context).t(k_note_options_color_title),
                      type: TextType.body, fontWeight: FontWeight.bold),
                  NoteColorSelect(),
                ],
              )),
        ],
      ),
    );
  }
}
