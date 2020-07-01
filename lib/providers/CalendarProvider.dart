import 'package:flutter/foundation.dart';

import '../utils/extensions/is_same_date_extension.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class CalendarProvider with ChangeNotifier, DiagnosticableTreeMixin {
  DateTime _selectedDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _startDate = DateTime.now().subtract(Duration(days: 365));

  DateTime get selectedDate => _selectedDate;
  DateTime get endDate => _endDate;
  DateTime get startDate => _startDate;
  bool get isSelectedDateToday => _selectedDate.isSameDate(DateTime.now());

  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  void onSelect(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('selectedDate', selectedDate.toIso8601String()));
  }
}