import 'package:app/locale/Loc.dart';
import 'package:flutter/material.dart';

const k_profile_greet_night = 'profile.greeting.night';
const k_profile_greet_morning = 'profile.greeting.morning';
const k_profile_greet_afternoon = 'profile.greeting.afternoon';
const k_profile_greet_evening = 'profile.greeting.evening';

String greet(DateTime date, BuildContext context) {
  var hour = date.hour;
  if (hour < 6) {
    return Loc.of(context).t(k_profile_greet_night);
  }
  if (hour < 12) {
    return Loc.of(context).t(k_profile_greet_morning);
  }
  if (hour < 17) {
    return Loc.of(context).t(k_profile_greet_afternoon);
  }
  return Loc.of(context).t(k_profile_greet_evening);
}
