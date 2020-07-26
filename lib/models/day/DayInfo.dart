import 'package:app/models/mood/Mood.dart';
import 'package:app/models/note/Note.dart';
import 'package:app/models/picture/Picture.dart';
import 'package:app/models/plan/Plan.dart';
import 'package:app/models/tag/Tag.dart';
import 'package:app/models/weather/Weather.dart';
import 'package:app/models/weight/Weight.dart';

class DayInfo {
  String _id;
  DateTime _day;
  Weather _weather;
  Mood _mood;
  Weight _weight;
  List<Note> _notes = [];
  List<Tag> _tags = [];
  List<Picture> _pictures = [];
  List<Plan> _plans = [];

  get id => _id;

  get day => _day;

  get weather => _weather;

  get mood => _mood;

  get notes => _notes;

  get tags => _tags;

  get pictures => _pictures;

  get plans => _plans;

  get weight => _weight;

  void setMood(Mood mood) => this._mood = mood;

  void setWeather(Weather weather) => this._weather = weather;

  void addNote(Note note) => this._notes.add(note);

  void removeNote(Note note) =>
      this._notes.removeWhere((element) => element.id == note.id);

  void updateNote(Note note) {
    int idxToUpdate = this._notes.indexWhere((element) => element.id == note.id);
    this._notes[idxToUpdate] = note;
  }
  void addTag(Tag tag) => this._tags.add(tag);

  void removeTag(Tag tag) =>
      this._tags.removeWhere((element) => element.id == tag.id);

  void updateTag(Tag tag) {
    int idxToUpdate = this._tags.indexWhere((element) => element.id == tag.id);
    this._tags[idxToUpdate] = tag;
  }

  void addPicture(Picture picture) => this._pictures.add(picture);

  void removePicture(Picture picture) =>
      this._pictures.removeWhere((element) => element.id == picture.id);

  void updatePicture(Picture picture) {
    int idxToUpdate = this._pictures.indexWhere((element) => element.id == picture.id);
    this._pictures[idxToUpdate] = picture;
  }

  void addPlan(Plan plan) => this._plans.add(plan);

  void removePlan(Plan plan) =>
      this._plans.removeWhere((element) => element.id == plan.id);

  void updatePlan(Plan plan) {
    int idxToUpdate = this._plans.indexWhere((element) => element.id == plan.id);
    this._plans[idxToUpdate] = plan;
  }

  DayInfo(
    this._id,
    this._day,
  );
}
