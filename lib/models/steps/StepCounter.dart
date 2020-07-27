import 'package:app/components/step/StepCounterItem.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../AbstractDayItem.dart';

class StepCounter implements AbstractDayItem {
  String _id;
  int _steps = 0;

  String get id => _id;

  int get steps => _steps;

  StepCounter(this._id, this._steps);

  @override
  Widget build(BuildContext context) {
    return StepCounterItem(item: this);
  }

  @override
  int size() {
    return 2;
  }
}
