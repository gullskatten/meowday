import 'package:app/components/distance/DistanceItem.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:flutter/src/widgets/framework.dart';

class Distance implements AbstractDayItem {
  String _id;
  double distance;

  get id => _id;

  Distance(this._id, this.distance);

  @override
  Widget build(BuildContext context) {
    return DistanceItem(item: this,);
  }

  @override
  int size() {
    return 2;
  }
}