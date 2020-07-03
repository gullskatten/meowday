import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:provider/provider.dart';

import '../components/text/StyledText.dart';
import '../components/transitions/ScaleInTransition.dart';
import '../constants/spacing/spacing.dart';
import '../constants/text/text_styles.dart';
import '../models/text/TextColor.dart';
import '../models/text/TextSize.dart';
import '../providers/CalendarProvider.dart';

class CalendarInitializationError extends StatefulWidget {
  @override
  _CalendarInitializationErrorState createState() =>
      _CalendarInitializationErrorState();
}

class _CalendarInitializationErrorState
    extends State<CalendarInitializationError> {
  bool isWaitingTimeout = false;

  indicateLoading() {
    setState(() {
      isWaitingTimeout = true;
    });
    Future.delayed(Duration(milliseconds: 500),
        () => setState(() => isWaitingTimeout = false));
  }

  @override
  Widget build(BuildContext context) {

    if (context.watch<CalendarProvider>().hasError) {
      return Consumer<CalendarProvider>(builder:
          (BuildContext calContext, CalendarProvider calendarState, _) {
        return ScaleInTransition(
          id: 'error-widget-calendar',
          begin: 1.2,
          end: 1.0,
          child: Container(
            padding: EdgeInsets.all(kSpacingNormal),
            color: Colors.redAccent,
            child: ListTile(
              trailing: Conditional.single(
                  context: context,
                  conditionBuilder: (context) => isWaitingTimeout,
                  widgetBuilder: (context) => CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                  fallbackBuilder: (context) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if(!isWaitingTimeout) {
                            calendarState.getNtpCurrentDate();
                            indicateLoading();
                          }
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.refresh,
                            size: kSubtitleNormal,
                            color: Colors.white60,
                            semanticLabel: 'Try again',
                          ),
                        ),
                      )),
              leading: Icon(
                Icons.error_outline,
                size: kSubtitleLarger,
                color: Colors.white60,
              ),
              title: StyledText(
                'Failed to verify time',
                fontWeight: FontWeight.bold,
              ),
              subtitle: StyledText(
                'Try again by tapping the refresh icon.',
                fontWeight: FontWeight.bold,
                size: TextSize.smaller,
                color: TextColor.primary60,
              ),
            ),
          ),
        );
      });
    }
    return Container();
  }
}
