import 'package:flutter/material.dart';
import 'package:notes_with_flutter/models/noteData.dart';

class NotesModel extends ChangeNotifier {
  /// Internal, private state of the notes of the app
  List<NoteData> _notes;

  NotesModel() {
    _notes = _initializeData();
  }

  List<NoteData> get notes => _notes;

  void add(NoteData note) {
    _notes.insert(0, note);
    // TODO insert to DB
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(NoteData note) {
    _notes.remove(note);
    // TODO remove from DB
    notifyListeners();
  }

  void signalNoteUpdate(NoteData note) {
    // TODO update on DB
    notifyListeners();
  }

  // /// Removes all items from the cart.
  // void removeAll() {
  //   _notes.clear();
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }

  List<NoteData> _initializeData() {
    // TODO get data from local storage
    List<String> dataSource = [];//["nota 1", "nota 2"];
    List<NoteData> notes = List();
    for (String strTitle in dataSource) {
      NoteData nd = NoteData(strTitle, "");
      notes.insert(0, nd);
    }

    return notes;
  }
}
