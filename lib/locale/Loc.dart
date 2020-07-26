import 'package:app/screens/ChallengesScreen.dart';
import 'package:app/utils/greet.dart';
import 'package:app/views/DailyActionsNavigator.dart';
import 'package:app/views/DailyNotes.dart';
import 'package:app/views/DailyPlans.dart';
import 'package:app/views/DailyTopChallenges.dart';
import 'package:app/views/MoodSelect.dart';
import 'package:app/views/NavbarOverview.dart';
import 'package:app/views/OverallExperience.dart';
import 'package:app/views/SelectedDateView.dart';
import 'package:app/views/WeatherSelect.dart';
import 'package:app/views/dialogs/MoodDialog.dart';
import 'package:app/views/dialogs/NoteDialog.dart';
import 'package:app/views/dialogs/WeatherDialog.dart';
import 'package:flutter/material.dart';

const k_common_button_cancel = "common.button.cancel";
const k_common_button_confirm = "common.button.confirm";

class Loc {
  Loc(this.locale);

  final Locale locale;

  static Loc of(BuildContext context) {
    return Localizations.of<Loc>(context, Loc);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      k_calendar_modal_day_title: 'Select day',
      k_common_button_confirm: 'Save',
      k_common_button_cancel: 'Cancel',
      k_profile_button_myprofile_label: 'My profile',
      k_profile_greet_night: 'Glad to see you so late',
      k_profile_greet_evening: 'Good evening',
      k_profile_greet_morning: 'Good morning',
      k_profile_greet_afternoon: 'Good afternoon',
      k_challenge_banner_title: 'New challenges available!',
      k_actions_button_mood: 'Mood',
      k_actions_button_note: 'Note',
      k_actions_button_plans: 'Plans',
      k_actions_button_picture: 'Picture',
      k_actions_button_food: 'Food',
      k_actions_button_tag: 'Tag',
      k_actions_button_weight: 'Weight',
      k_actions_button_weather: 'Weather',
      k_note_section_title: 'Notes from this day',
      k_note_new_title: 'New note',
      k_note_new_placeholder: 'Write something..',
      k_note_new_options_title: 'Options',
      k_note_options_color_title: 'Background color',
      k_mood_dialog_title: 'How do you feel today?',
      k_mood_sentiment_very_satisfied: "I'm feeling awesome! 🥳",
      k_mood_sentiment_satisfied: "I'm doing alright.",
      k_mood_sentiment_neutral: "I'm not sure.",
      k_mood_sentiment_dissatisfied: "Things are not that great.",
      k_mood_sentiment_very_dissatisfied: "Not my day. 😩",
      k_weather_dialog_title: 'How is the weather today?',
      k_weather_sunny: 'Clear sky. 👌',
      k_weather_cloud_sun: 'Pretty nice.',
      k_weather_cloudy: 'Cloudy.',
      k_weather_rain: "It's raining today. ️🌧",
      k_weather_snow: "It's snowing! ☃️",
      k_weather_cloud_flash: "The storm has come. ☔⚡️",
      k_experience_needed_label: 'more experience to next level',
      k_experience_level_label: 'Level',
      k_plans_section_title: 'My plans',
      k_plans_section_description: "Here is a list of things you have planned for this day.",
      k_challenges_screen_title: "Daily Challenges",
      k_challenges_screen_description: 'New challenges arrive here every day. Each challenge provides experience points when completed, and is an easy way of creating healthy habits. You can also create your own challenges, and decide how often they should occur.',
    },
    'no': {
      k_calendar_modal_day_title: 'Velg dag',
      k_common_button_confirm: 'Lagre',
      k_common_button_cancel: 'Avbryt',
      k_profile_button_myprofile_label: 'Min profil',
      k_profile_greet_night: 'God kveld',
      k_profile_greet_evening: 'God kveld',
      k_profile_greet_morning: 'God morgen',
      k_profile_greet_afternoon: 'God ettermiddag',
      k_challenge_banner_title: 'Nye utfordringer tilgjengelig!',
      k_actions_button_mood: 'Humør',
      k_actions_button_note: 'Notat',
      k_actions_button_tag: 'Tag',
      k_actions_button_plans: 'Planer',
      k_actions_button_picture: 'Bilde',
      k_actions_button_food: 'Mat',
      k_actions_button_weight: 'Vekt',
      k_actions_button_weather: 'Været',
      k_note_section_title: 'Notater for dagen',
      k_note_new_title: 'Nytt notat',
      k_note_new_placeholder: 'Skriv noe her..',
      k_note_new_options_title: 'Alternativer',
      k_note_options_color_title: 'Bakgrunnsfarge',
      k_mood_dialog_title: 'Hvordan føler du deg?',
      k_mood_sentiment_very_satisfied: "Helt topp! 🥳",
      k_mood_sentiment_satisfied: "Ganske bra.",
      k_mood_sentiment_neutral: "Ikke sikker.",
      k_mood_sentiment_dissatisfied: "Ting er ikke så bra.",
      k_mood_sentiment_very_dissatisfied: "Dette er ikke min dag. 😩",
      k_weather_dialog_title: 'Hvordan er været i dag?',
      k_weather_sunny: 'Skyfri himmel. 👌',
      k_weather_cloud_sun: 'Det er ikke så verst.',
      k_weather_cloudy: 'Overskyet.',
      k_weather_rain: 'Det regner.',
      k_weather_snow: 'Det snør! ☃️',
      k_weather_cloud_flash: 'Tordenvær = Innevær ☔⚡',
      k_experience_needed_label: 'mer poeng til neste nivå',
      k_experience_level_label: 'Nivå',
      k_plans_section_title: 'Mine planer',
      k_plans_section_description: 'Her er en liste over ting du har planlagt.',
      k_challenges_screen_title: 'Daglige utfordringer',
      k_challenges_screen_description: 'Nye utfordringer dukker opp her hver dag. Hver utfordring gir deg poeng når de blir utført og gjør det lettere å skape sunne vaner. Du kan også opprette dine egne utfordringer, og velge hvor ofte de skal dukke opp',

    },
  };

  String t(key) {
    return _localizedValues[locale.languageCode][key];
  }
}