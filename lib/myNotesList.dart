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
  void _updateMyItems(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        // removing the item at oldIndex will shorten the list by 1.
        newIndex -= 1;
      }

      final NoteData element = Provider.of<NotesModel>(context, listen: false)
          .notes
          .removeAt(oldIndex);
      Provider.of<NotesModel>(context, listen: false)
          .notes
          .insert(newIndex, element);
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
            if (notesData.notes.length > 0)
              return ReorderableListView(
                onReorder: _updateMyItems,
                children: [
                  ...(notesData.notes).map((noteData) {
                    print(noteData.id);
                    return NoteCard(Key(noteData.id), noteData);
                  }).toList(),
                ],
              );
            else
              return Container(
                alignment: Alignment.center,
                child: Text(
                  "Tap on plus button to add a new note",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          NoteData newNoteData = NoteData("", "");
          Provider.of<NotesModel>(context, listen: false).add(newNoteData);
          Navigator.pushNamed(context, '/noteDetails', arguments: newNoteData)
              .then((value) {
            if (value != null && value) {
              Provider.of<NotesModel>(context, listen: false)
                  .remove(newNoteData);
            } else {
              Provider.of<NotesModel>(context, listen: false)
                  .signalNoteUpdate();
            }
          });
        },
      ),
    );
  }
}
