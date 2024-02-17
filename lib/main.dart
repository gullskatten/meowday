import '/components/transition/ScaleInTransition.dart';
import '/components/transition/SlideInTransition.dart';
import '/constants/colors/boxes.dart';
import '/locale/MainLocalizationsDelegate.dart';
import '/views/CalendarInitializationError.dart';
import '/views/DailyActionsNavigator.dart';
import '/views/DailyNotes.dart';
import '/views/DailyPlans.dart';
import '/views/DailyTopChallenges.dart';
import '/views/NavbarOverview.dart';
import '/views/OverallExperience.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants/colors/boxes.dart';
import 'providers/CalendarProvider.dart';
import 'views/SelectedDateView.dart';

void main() {
  debugPrint = (String message, {int wrapWidth = 500}) =>
      debugPrintSynchronouslyWithText(message, wrapWidth: wrapWidth);



  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CalendarProvider(),
      )
    ],
    child: MyApp(),
  ));
}

void debugPrintSynchronouslyWithText(String message, {int wrapWidth}) {
  message = "[${DateTime.now()}]: $message";
  debugPrintSynchronously(message, wrapWidth: wrapWidth);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

   // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white
    ));

    return MaterialApp(
      title: 'Meowday',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: MainApp(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MainLocalizationsDelegate(),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        debugPrint('Current language: ${locale}');
        debugPrint('Current CC: ${locale.countryCode}');
        debugPrint('Current LC: ${locale.languageCode}');
        debugPrint('Current LT: ${locale.toLanguageTag()}');
        debugPrint('Supported languages: ${supportedLocales.join(',')}');

        if(locale.languageCode == 'nb') {
          return Locale.fromSubtags(languageCode: 'no');
        }

        return locale;
      },
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'no'),
        const Locale('en'), // English, no country code
      ],
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<CalendarProvider>().getNtpCurrentDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBackground,
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
                      CalendarInitializationError(),
                      Consumer<CalendarProvider>(builder:
                          (BuildContext calContext,
                              CalendarProvider calendarState, _) {
                        if (calendarState.isSelectedDateToday &&
                            !calendarState.hasError &&
                            !calendarState.isLoadingNtp) {
                          return Column(
                            children: [
                              Container(
                                color: kSecondaryLight,
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
                          id: 'notes',
                          curve: Curves.easeInOut,
                          child: DailyNotes()),
                      SlideInTransition(
                          delay: 200,
                          offset: Offset(0.25, 0),
                          id: 'plans',
                          curve: Curves.easeInOut,
                          child: DailyPlans()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
