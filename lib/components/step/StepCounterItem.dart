import 'package:app/components/text/StyledText.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/constants/text/text_styles.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/steps/StepCounter.dart';
import 'package:app/models/text/TextColor.dart';
import 'package:app/models/text/TextType.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

const k_step_counter_today_label = 'step.counter.today.label';

class StepCounterItem extends StatelessWidget {
  const StepCounterItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final StepCounter item;

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
              color: kSecondaryNormal,
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
                CustomIcons.shoe_prints,
                size: kTitleLarger,
                color: Colors.white60,
              ),
              SizedBox(
                height: kSpacingSmall,
              ),
              StyledText(
                '${item.steps}',
                type: TextType.title,
                fontWeight: FontWeight.bold,
              ),
              StyledText(
                Loc.of(context).t(k_step_counter_today_label),
                color: TextColor.primary60,
              )
            ],
          ),
        )
      ],
    );
  }
}
