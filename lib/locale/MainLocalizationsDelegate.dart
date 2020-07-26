import 'package:app/locale/Loc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainLocalizationsDelegate extends LocalizationsDelegate<Loc> {
  const MainLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'no'].contains(locale.languageCode);

  @override
  Future<Loc> load(Locale locale) {
    return SynchronousFuture<Loc>(Loc(locale));
  }

  @override
  bool shouldReload(MainLocalizationsDelegate old) => false;
}