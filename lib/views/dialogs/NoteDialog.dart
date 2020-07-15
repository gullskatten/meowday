import 'package:app/components/note/NoteColorSelect.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blue,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: NoteColorSelect(),
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
              decoration: InputDecoration.collapsed(
                  hintText: 'Write something about your day?'),
            ),
          ),
        ],
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
