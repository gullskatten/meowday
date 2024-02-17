import '/components/text/StyledText.dart';
import '/constants/colors/boxes.dart';
import '/constants/spacing/spacing.dart';
import '/constants/text/text_styles.dart';
import '/models/note/NoteColor.dart';
import '/models/text/FontFamily.dart';
import 'package:flutter/material.dart';

class NoteColorSelect extends StatefulWidget {
  @override
  _NoteColorSelectState createState() => _NoteColorSelectState();
}

class _NoteColorSelectState extends State<NoteColorSelect> {
  NoteColor selectedNoteColor = NoteColor(value: "Orange", color: orange);
  List<NoteColor> noteColors = [
    NoteColor(value: "Orange", color: orange),
    NoteColor(value: "Peach", color: peach),
    NoteColor(value: "Lemon", color: lemon),
    NoteColor(value: "Green", color: green),
    NoteColor(value: "Teal", color: teal),
    NoteColor(value: "Blue", color: blue),
    NoteColor(value: "Asphalt", color: asphalt),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<NoteColor>(
      isExpanded: true,
      value: selectedNoteColor,
      elevation: 16,
      onChanged: (NoteColor newValue) {
        setState(() {
          selectedNoteColor = newValue;
        });
      },
      underline: Container(
        height: 0.5,
        color: Colors.white30,
      ),
      items: noteColors
          .map<DropdownMenuItem<NoteColor>>((NoteColor value) {
        return DropdownMenuItem<NoteColor>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StyledText(
                value.value,
                fontFamily: FontFamily.title,
              ),
              SizedBox(width: kSpacingSmall,),
              Container(
                height: kBodyNormal,
                width: kBodyNormal,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBodyNormal),
                  color: value.color
                ),
              ),

            ],
          ),
        );
      }).toList(),
    );
  }
}
