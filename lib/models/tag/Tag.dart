class Tag {
  String _id;
  String tag;
  DateTime _createdAt = DateTime.now();

  get id => _id;

  get createdAt => _createdAt;

  Tag(this._id, this.tag);
}
