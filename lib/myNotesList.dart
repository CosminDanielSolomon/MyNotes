import 'package:flutter/material.dart';

import 'noteCard.dart';

class MyNotesList extends StatefulWidget {
  final String title;

  MyNotesList({@required this.title});

  @override
  State<StatefulWidget> createState() => _MyNotesListState();
}

class _MyNotesListState extends State<MyNotesList> {
  List<String> notesTitle = ["nota1 nota1 nota1 longggggggggggggggggggggggggggggggggggggggggggggggg", "nota2", "nota3", "nota4"];

  void _updateMyItems(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        // removing the item at oldIndex will shorten the list by 1.
        newIndex -= 1;
      }
      final String element = notesTitle.removeAt(oldIndex);
      notesTitle.insert(newIndex, element);
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
        child: ReorderableListView(
          onReorder: _updateMyItems,
          children: [
            ...(notesTitle).map((currentNoteTitle) {
              return NoteCard(ValueKey(currentNoteTitle), currentNoteTitle);
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
