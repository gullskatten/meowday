import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/distance/Distance.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

const k_distance_moved_today_label = 'distance.moved.today.label';
const k_distance_encouragement_insane = 'distance.encouragement.insane';
const k_distance_encouragement_strong = 'distance.encouragement.strong';
const k_distance_encouragement_ok = 'distance.encouragement.ok';
const k_distance_encouragement_less = 'distance.encouragement.less';
const k_distance_encouragement_none = 'distance.encouragement.none';

class DistanceItem extends StatelessWidget {
  const DistanceItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final Distance item;

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
              color: kSecondaryLight,
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
              StyledText(
                Loc.of(context).t(k_distance_moved_today_label),
                color: TextColor.primary60,
              ),
              SizedBox(
                height: kSpacingSmall,
              ),
              Icon(
                CustomIcons.trail,
                size: kTitleLarger,
                color: Colors.white60,
              ),
              StyledText(
                '${item.distance}km',
                type: TextType.title,
                fontWeight: FontWeight.bold,
              ),

              StyledText(
                Loc.of(context).t(_determineEncouragement(item.distance)),
                color: TextColor.primary60,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        )
      ],
    );
  }
}

String _determineEncouragement(double distance) {
  if(distance >= 20) {
    return k_distance_encouragement_insane;
  } else if (distance >= 10) {
    return k_distance_encouragement_strong;
  } else if (distance >= 5) {
    return k_distance_encouragement_ok;
  } else if (distance >= 2) {
    return k_distance_encouragement_less;
  } else {
    return k_distance_encouragement_none;
  }
}
