import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ntp/ntp.dart';

import '../utils/extensions/is_same_date_extension.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class CalendarProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _hasError = false;
  bool _hasInitializedNtp = false;
  bool _isLoadingNtp = true;
  bool _hasChangedDate = false;
  Position position;
  GeolocationStatus geolocationStatus;
  DateTime _selectedDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _startDate = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _ntpNow;
  List<Placemark> placemark;

  DateTime get selectedDate {
    if (!_hasInitializedNtp) {
      getNtpCurrentDate();
    }
    return _selectedDate;
  }

  DateTime get endDate {
    if (!_hasInitializedNtp) {
      getNtpCurrentDate();
    }
    return _endDate;
  }

  DateTime get startDate => _startDate;

  bool get isLoadingNtp => _isLoadingNtp;

  bool get hasError => _hasError;

  bool get isSelectedDateToday {
    return _selectedDate.isSameDate(_ntpNow) ?? false;
  }

  Future<void> getPosition() async {

    if (await Permission.locationWhenInUse.request().isGranted) {
      Geolocator geolocator = Geolocator();

      geolocationStatus = await geolocator.checkGeolocationPermissionStatus();
      debugPrint('Geolocation status: ${geolocationStatus.value}');

      if(geolocationStatus.value > 1 && geolocationStatus.value < 4) {
        position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);

        placemark.forEach((element) {
          debugPrint('${element.name} ${element.postalCode} ${element.country}');
        });
      }
    } else if (!await Permission.locationWhenInUse.isGranted) {
      debugPrint('Location is not granted!');
      debugPrint('Permission for location is: ${Permission.locationWhenInUse.value}');
    } else {
      debugPrint('Location failed!');
      debugPrint('Permission for location is: ${Permission.locationWhenInUse.value}');
    }
  }

  Future<void> getNtpCurrentDate() async {
    debugPrint('Initializing NTP date.');

    _hasInitializedNtp = true;
    _isLoadingNtp = true;

    Future.delayed(Duration(seconds: 10), (){
      if(_isLoadingNtp) {
        onError('Delayed timeout reached.', '');
      }
    });

    _ntpNow = await NTP.now().then((value) {
      if (value != null) {
        return value;
      }
      throw new HttpException("Could not reach NTP server");
    }).catchError(onError);

    if (_ntpNow != null) {

      if (!_hasChangedDate ||
          (_hasChangedDate && _selectedDate.isAfter(_ntpNow))) {
        _selectedDate = _ntpNow;
      }

      _endDate = _ntpNow;
      _hasError = false;
      _isLoadingNtp = false;
      notifyListeners();
      debugPrint('NTP date initialized.');
    }
  }

  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  void onSelect(DateTime newDate) {
    bool isAfterLastAvailableDay =
        (newDate.isAfter(selectedDate) && isSelectedDateToday);

    if (isAfterLastAvailableDay) {
      return;
    }

    _selectedDate = newDate;
    _hasChangedDate = true;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('selectedDate', selectedDate?.toIso8601String()));
  }

  onError(err, stack) {
    _hasError = true;
    if (!_hasChangedDate) {
      _selectedDate = DateTime.now();
    }
    _endDate = DateTime.now();
    _isLoadingNtp = false;
    notifyListeners();
    debugPrint('Failed to initialize date -> $err ');
  }
}
