import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ntp/ntp.dart';

import '../utils/extensions/is_same_date_extension.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class CalendarProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _hasError = false;
  bool _hasInitializedNtp = false;
  bool _isLoadingNtp = true;
  bool _hasChangedDate = false;

  DateTime _selectedDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _startDate = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _ntpNow;

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

  Future<void> getNtpCurrentDate() async {
    print('Initializing NTP date.');

    _hasInitializedNtp = true;
    _isLoadingNtp = true;

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
  }
}
