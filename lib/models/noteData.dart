import 'package:uuid/uuid.dart';

class NoteData {

  String _id;
  String _title;
  String _description;
  DateTime _dateTime;

  // constructor

  NoteData(this._title) { // title is mandatory
    var uuid = Uuid();
    this._id = uuid.v1();
    this._dateTime = DateTime.now();
  }

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
}
