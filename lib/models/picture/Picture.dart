import 'package:app/components/picture/PictureItem.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:flutter/material.dart';

class Picture implements AbstractDayItem {
  String _id;
  String url;
  DateTime createdAt = DateTime.now();

  get id => _id;

  Picture(
    this._id, {
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return PictureItem(
      item: this,
    );
  }

  @override
  int size() {
    return 2;
  }
}
