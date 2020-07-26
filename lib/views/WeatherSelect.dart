import 'package:app/components/icon/SelectableIcon.dart';
import 'package:app/components/text/StyledText.dart';
import 'package:app/components/transition/ScaleInTransition.dart';
import 'package:app/constants/spacing/spacing.dart';
import 'package:app/locale/Loc.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class WeatherSelect extends StatefulWidget {
  @override
  _WeatherSelectState createState() => _WeatherSelectState();
}

const k_weather_cloud_flash = 'weather.option.flash';
const k_weather_snow = 'weather.option.snow';
const k_weather_rain = 'weather.option.rain';
const k_weather_cloudy = 'weather.option.cloudy';
const k_weather_cloud_sun = 'weather.option.cloud_sun';
const k_weather_sunny = 'weather.option.sunny';

class _WeatherSelectState extends State<WeatherSelect> {
  String _selectedWeather = k_weather_sunny;

  List<Weather> _weatherTypes = [
    Weather(k_weather_cloud_flash,
        label: k_weather_cloud_flash, icon: CustomIcons.cloud_flash),
    Weather(k_weather_snow,
        label: k_weather_snow, icon: CustomIcons.snow_heavy),
    Weather(k_weather_rain, label: k_weather_rain, icon: CustomIcons.rain),
    Weather(k_weather_cloudy, label: k_weather_cloudy, icon: CustomIcons.cloud),
    Weather(k_weather_cloud_sun,
        label: k_weather_cloud_sun, icon: CustomIcons.cloud_sun),
    Weather(k_weather_sunny, label: k_weather_sunny, icon: CustomIcons.sun),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _weatherTypes.asMap().entries
                .map((e) => Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableIcon(
                            onTap: () => updateWeather(e.value.id),
                            iconIdentifier: e.value.id,
                            fadeInDelay: e.key * 100,
                            icon: e.value.icon,
                            isSelected: _selectedWeather == e.value.id,
                          ),
                    ),
                  ),
                ))
                .toList()),
        SizedBox(
          height: kSpacingNormal,
        ),
        ScaleInTransition(
          id: _selectedWeather,
          delay: 0,
          end: 1.0,
          begin: 0.85,
          child: StyledText(
            Loc.of(context).t(_selectedWeather),
          ),
        )
      ],
    );
  }

  void updateWeather(String weatherId) {
    debugPrint(weatherId);
    setState(() {
      _selectedWeather = weatherId;
    });
  }
}
