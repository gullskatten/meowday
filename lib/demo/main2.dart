import '/components/transition/SlideInTransition.dart';
import '/constants/colors/boxes.dart';
import '/views/DailyActionsNavigator.dart';
import '/views/DailyNotes.dart';
import '/views/DailyPlans.dart';
import '/views/DailyTopChallenges.dart';
import '/views/NavbarOverview.dart';
import '/views/OverallExperience.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CalendarProvider.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
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
              OverallExperience(),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[

                    DailyActionsNavigator(),
                    (() {
                      if(context.select((CalendarProvider value) => value.isSelectedDateToday))
                        return SlideInTransition(
                            delay: 0,
                            id: context.select((CalendarProvider value) =>
                                value.selectedDate.toIso8601String()),
                            curve: Curves.easeInOutQuint,
                            offset: Offset(0, 0.25),
                            child: DailyTopChallenges());
                      return Container();
                    }())
                    ,
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
