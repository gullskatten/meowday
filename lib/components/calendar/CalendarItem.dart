import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/calendar/Calendar.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Calendar item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kSpacingNormal),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kSecondaryDark,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 5.0)
              ]),
          child: Column(
            children: [

              Icon(
                Icons.calendar_today,
                size: kTitleLarger,
                color: Colors.white60,
              ),
              SizedBox(
                height: kSpacingSmall,
              ),
              StyledText(
                DateFormat('yyyy', Loc.of(context).locale.languageCode)
                    .format(item.day),
                color: TextColor.primary60,
                fontWeight: FontWeight.bold,
              ),
              StyledText(
                DateFormat('EEEE, dd. MMMM', Loc.of(context).locale.languageCode)
                    .format(item.day),
                type: TextType.subtitle,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
