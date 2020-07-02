import 'package:animations/animations.dart';
import 'package:app/components/transitions/ScaleInTransition.dart';
import 'package:app/components/transitions/SlideInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/screens/CalendarScreen.dart';
import 'package:app/components/calendar/Calendar.dart';
import 'package:app/views/DailyActionsNavigator.dart';
import 'package:app/views/DailyNotes.dart';
import 'package:app/views/DailyPlans.dart';
import 'package:app/views/DailyTopChallenges.dart';
import 'package:app/views/NavbarOverview.dart';
import 'package:app/views/OverallExperience.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/button/OpaqueIconButton.dart';
import 'constants/colors/boxes.dart';
import 'models/text/FontFamily.dart';
import 'models/text/TextColor.dart';
import 'providers/CalendarProvider.dart';
import 'views/SelectedDateView.dart';
import 'views/dialogs/CalendarDialog.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalendarProvider(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meowday',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: orange,
        body: Container(
          child: Column(
            children: <Widget>[
              NavbarOverview(),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SelectedDateView(),
                    OverallExperience(),
                    (() {
                      if (context.select((CalendarProvider value) =>
                          value.isSelectedDateToday)) {
                        return Column(
                          children: [
                            Container(
                              color: green,
                              child: ScaleInTransition(
                                  delay: 0,
                                  begin: 2.0,
                                  end: 1.0,
                                  id: context.select((CalendarProvider value) =>
                                      value.selectedDate.toIso8601String()),
                                  curve: Curves.easeInOutQuint,
                                  child: DailyTopChallenges()),
                            ),
                            DailyActionsNavigator(),
                          ],
                        );
                      }
                      return Container();
                    }()),
                    SlideInTransition(
                        delay: 0,
                        id: context.select((CalendarProvider value) =>
                            value.selectedDate.toIso8601String()),
                        curve: Curves.easeInOut,
                        child: DailyNotes()),
                    SlideInTransition(
                        delay: 200,
                        offset: Offset(0.25, 0),
                        id: context.select((CalendarProvider value) =>
                            value.selectedDate.toIso8601String()),
                        curve: Curves.easeInOut,
                        child: DailyPlans()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
