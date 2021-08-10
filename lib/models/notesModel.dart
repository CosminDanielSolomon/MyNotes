import 'package:flutter/material.dart';

import 'noteData.dart';
import '../persistence/databaseHandler.dart';

class NotesModel extends ChangeNotifier {
  /// Internal, private state of the notes of the app
  List<NoteData> _notes = [];

  NotesModel();

  void initializeDataFromDb() async {
    _notes = await DatabaseHandler.instance.notes();
    notifyListeners();
  }

  List<NoteData> get notes => _notes;

  void add(NoteData note) async {
    _notes.insert(0, note);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
    await DatabaseHandler.instance.insertNote(note);
    this.updateNotesPosition();
  }

  void remove(NoteData note) async {
    _notes.remove(note);
    notifyListeners();
    await DatabaseHandler.instance.deleteNote(note);
    this.updateNotesPosition();
  }

  void signalNoteUpdate(NoteData note) async {
    notifyListeners();
    await DatabaseHandler.instance.updateNote(note);
  }

  void updateNotesPosition() async {
    int pos = 0;
    for (NoteData note in _notes) {
      await DatabaseHandler.instance.updateNotePosition(note, pos);
      pos++;
    }
  }

  // /// Removes all items from the cart.
  // void removeAll() {
  //   _notes.clear();
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }
}
