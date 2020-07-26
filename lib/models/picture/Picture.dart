import 'package:flutter/material.dart';

class Picture {
  String _id;
  String url;
  DateTime createdAt = DateTime.now();

  get id => _id;

  Picture(
    this._id, {
    @required this.url,
  });
}
