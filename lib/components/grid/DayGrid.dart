import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:app/models/calendar/Calendar.dart';
import 'package:app/models/distance/Distance.dart';
import 'package:app/models/note/Note.dart';
import 'package:app/models/picture/Picture.dart';
import 'package:app/models/steps/StepCounter.dart';
import 'package:app/models/tag/Tag.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:app/views/WeatherSelect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class DayGrid extends StatefulWidget {
  @override
  _DayGridState createState() => _DayGridState();
}

class _DayGridState extends State<DayGrid> {

  List<AbstractDayItem> _list;

  @override
  void initState() {
    super.initState();
    _list = [
      Calendar(
        'id-1231',
        DateTime.now()
      ),
      Weather(
        'q23',
        label: 'Det er ganske bra i dag!',
          icon: CustomIcons.cloud_sun,
      ),
      Distance(
        'id-2015',
        17.3
      ),
      Tag(
        'idsad',
        'summer'
      ),
      Picture(
        'id-12313',
        url: 'assets/images/landscape_orange_peek.jpg'
      ),
      StepCounter('id-13123', 5532),
      Note('Remember to call Luna and ask about the new dog food.',
          color: kPrimaryDark,
          ),
      Tag(
          'id-2idsad',
          'oslo'
      ),
      Note("Today, I found a golden coin.\n\n"
          "Unsure of what fortunes this little coin had for me, I sat down and wondered about what mysteries lied ahead."
          ,
          color: kPrimaryNormal,
          title: 'Golden Coin',
      ),
      Picture(
          'id-55313',
          url: 'assets/images/at_night_peek.jpg'
      ),
      Note('Not much happened today either, so I continued with Flutter.',
          color: kPrimaryLight,
          ),
      Calendar('id-12312', DateTime.now().subtract(Duration(days: 1))),
      Tag('id-323', 'Kristiansand'),
      Note("Oh, what would I do without this almanac, It is so embarrassing to forget which day it is."
          "\n\n"
          " Or what I ate yesterday.",
          color: kPrimaryNormal,
          ),
      Distance('id-32', 3),
      Note('I never know because I never try.',
          color: kPrimaryDarkest,
          ),
      Note('It has been a while since the last day of summer, I wish it would come back soon.',
          title: 'Too soon!',
          color: kPrimaryNormal,
          ),
      StepCounter('iddd-ss', 1532),
      Note('Wish I knew what to do with this app when it is finished.',
          title: 'Future',
          color: kPrimaryLight,
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        AbstractDayItem abi = _list[index];
        return abi.build(context);
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(_list[index].size());
      }
      ,
      mainAxisSpacing: kSpacingSmall,
      crossAxisSpacing: kSpacingSmall,
    );
  }
}
