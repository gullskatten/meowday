import 'package:app/components/tag/TagItem.dart';
import 'package:app/models/AbstractDayItem.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tag implements AbstractDayItem {
  String _id;
  String tag;
  DateTime _createdAt = DateTime.now();

  get id => _id;

  get createdAt => _createdAt;

  Tag(this._id, this.tag);

  @override
  Widget build(BuildContext context) {
    return TagItem(item: this,);
  }

  @override
  int size() {
    return 2;
  }
}
