import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notes_with_flutter/models/noteData.dart';

class NotesModel extends ChangeNotifier {
  /// Internal, private state of the notes of the app
  Map<String, NoteData> _notes;

  NotesModel() {
    _notes = _initializeMapData();
  }

  Map<String, NoteData> get notes => _notes;

  List<NoteData> get notesList {
    List<NoteData> notesList = _notes.values.toList();
    notesList.sort((a, b) => a.lastModifyDate.compareTo(b.lastModifyDate));
    return notesList;
  }

  NoteData getNote(int id) => _notes[id];

  /// Add and remove are the only ways to modify the
  /// list of notes from the outside.
  void add(NoteData note) {
    _notes.putIfAbsent(note.id, () => note);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _notes.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Map<String, NoteData> _initializeMapData() {
    List<String> dataSource = ["nota 1", "nota 2", "nota 3", "nota 4"];
    Map<String, NoteData> map = HashMap();
    for (String strTitle in dataSource) {
      NoteData nd = NoteData(strTitle);
      map.putIfAbsent(nd.id, () => nd);
    }

    return map;
  }
}
