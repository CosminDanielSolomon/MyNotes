import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/noteData.dart';
import 'models/notesModel.dart';
import 'noteCard.dart';

class MyNotesList extends StatefulWidget {
  final String title;

  MyNotesList({@required this.title});

  @override
  State<StatefulWidget> createState() => _MyNotesListState();
}

class _MyNotesListState extends State<MyNotesList> {
  List<NoteData> _notes;

  @override
  void initState() {
    _notes = Provider.of<NotesModel>(context, listen: false).notesList;
    super.initState();
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        // removing the item at oldIndex will shorten the list by 1.
        newIndex -= 1;
      }

      final NoteData element = _notes.removeAt(oldIndex);
      _notes.insert(newIndex, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implements the basic material design visual layout structure.
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: Consumer<NotesModel>(
          builder: (context, notesData, child) {
            return ReorderableListView(
              onReorder: _updateMyItems,
              children: [
                ...(_notes).map((noteData) {
                  return NoteCard(Key(noteData.id), noteData);
                }).toList(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: addNewNote,
      ),
    );
  }

  void addNewNote() {
    Provider.of<NotesModel>(context, listen: false).add(NoteData("ciao"));
    _notes = Provider.of<NotesModel>(context, listen: false).notesList;
    print("fatto!");
  }
}
