import 'package:uuid/uuid.dart';

class NoteData {
  String _id;
  String _title;
  String _description;
  DateTime _dateTime;

  // constructor

  NoteData(this._title, this._description) {
    var uuid = Uuid();
    this._id = uuid.v1();
    this._dateTime = DateTime.now();
  }

  NoteData.fromDb(this._id, this._title, this._description, this._dateTime);

  // getters, setters, operators

  String get id => _id;

  String get title => _title;
  set title(String title) => this._title = title;

  String get description => _description;
  set description(String description) => this._description = description;

  DateTime get lastModifyDate => _dateTime;
  set lastModifyDate(DateTime dateTime) => this._dateTime = dateTime;

  @override
  int get hashCode => _id.hashCode;

  @override
  bool operator ==(Object other) => other is NoteData && other._id == _id;

  // for DB access
  // Convert a NoteData into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
      'description': _description,
      'dateTime': _dateTime.toIso8601String(),
    };
  }
}
