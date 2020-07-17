import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/models/note/NoteColor.dart';
import 'package:app/models/note/NoteGridSize.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:flutter/material.dart';

class NoteGridSizeSelect extends StatefulWidget {
  @override
  _NoteGridSizeSelectState createState() => _NoteGridSizeSelectState();
}

class _NoteGridSizeSelectState extends State<NoteGridSizeSelect> {
  NoteGridSize selectedSize = NoteGridSize(value: 2, name: 'Fill half');
  List<NoteGridSize> _sizes = [
    NoteGridSize(value: 2, name: 'Fill half'),
    NoteGridSize(value: 4, name: 'Fill row'),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<NoteGridSize>(
      isExpanded: true,
      value: selectedSize,
      elevation: 16,
      onChanged: (NoteGridSize newValue) {
        setState(() {
          selectedSize = newValue;
        });
      },
      underline: Container(
        height: 0.5,
        color: Colors.white30,
      ),
      items: _sizes.map<DropdownMenuItem<NoteGridSize>>((NoteGridSize value) {
        return DropdownMenuItem<NoteGridSize>(
          value: value,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Row(
                      children: List<Widget>.generate(value.value, (_) {
                        return Container(
                          width: kSpacingNormal,
                          height: kSpacingNormal,
                          decoration: BoxDecoration(
                              color: kSecondaryLight,
                              border: Border.symmetric(
                                vertical: BorderSide(
                                    width: 2.0,
                                    color: kPrimaryDarkest
                                ),
                              )),
                        );
                      }),
                    ),
                    Row(
                      children: List<Widget>.generate(
                          4 - value.value, (_) {
                        return Container(
                          width: kSpacingNormal,
                          height: kSpacingNormal,
                          decoration: BoxDecoration(
                              color: kPrimaryDarkest,
                              border: Border.symmetric(
                                vertical: BorderSide(
                                  width: 2.0,
                                  color: kPrimaryDarkest
                                ),
                              )),
                        );
                      }),
                    )
                  ],
                ),
                StyledText(
                  value.name,
                  fontFamily: FontFamily.title,
                )
              ]),
        );
      }).toList(),
    );
  }
}
