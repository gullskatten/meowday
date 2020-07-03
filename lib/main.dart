import 'package:app/components/transitions/ScaleInTransition.dart';
import 'package:app/components/transitions/SlideInTransition.dart';
import 'package:app/constants/colors/boxes.dart';
import 'package:app/views/CalendarInitializationError.dart';
import 'package:app/views/DailyActionsNavigator.dart';
import 'package:app/views/DailyNotes.dart';
import 'package:app/views/DailyPlans.dart';
import 'package:app/views/DailyTopChallenges.dart';
import 'package:app/views/NavbarOverview.dart';
import 'package:app/views/OverallExperience.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors/boxes.dart';
import 'providers/CalendarProvider.dart';
import 'providers/CalendarProvider.dart';
import 'views/SelectedDateView.dart';

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
              CalendarInitializationError(),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SelectedDateView(),
                    OverallExperience(),
                    Consumer<CalendarProvider>(builder:
                        (BuildContext calContext,
                            CalendarProvider calendarState, _) {
                      if (calendarState.isSelectedDateToday &&
                          !calendarState.hasError &&
                          !calendarState.isLoadingNtp) {
                        return Column(
                          children: [
                            Container(
                              color: green,
                              child: ScaleInTransition(
                                delay: 0,
                                begin: 2.0,
                                end: 1.0,
                                id: calendarState.selectedDate
                                    .toIso8601String(),
                                curve: Curves.easeInOutQuint,
                                child: DailyTopChallenges(),
                              ),
                            ),
                            DailyActionsNavigator(),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
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
