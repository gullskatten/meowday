import 'package:app/components/button/FlatIconButton.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/models/note/Note.dart';
import 'package:app/models/text/FontFamily.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextSize.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:intl/intl.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value.
///
/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class NoteItem extends StatelessWidget {
  const NoteItem(
      {Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Note item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kSpacingNormal),
          decoration: BoxDecoration(
              color: kPrimaryDark,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 5.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Conditional.single(
                context: context,
                conditionBuilder: (cb) => item.title != null,
                widgetBuilder: (c) => Column(
                  children: <Widget>[
                    StyledText(
                      item.title,
                      type: TextType.subtitle,
                      color: TextColor.primary60,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: kSpacingSmall,
                    ),
                  ],
                ),
                fallbackBuilder: (c) => Container(height: 0, width: 0,),
              ),
              StyledText(
                item.text,
              ),
              SizedBox(
                height: kSpacingSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StyledText(
                    DateFormat('EE HH:mm').format(item.createdAt),
                    size: TextSize.smaller,
                    color: TextColor.primary60,
                    fontFamily: FontFamily.title,
                  ),
                  FlatIconButton(
                    icon: Icons.edit,
                    onPressed: onTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
