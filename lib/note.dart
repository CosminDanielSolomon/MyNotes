import 'package:flutter/material.dart';

import 'models/noteData.dart';

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NoteData note = ModalRoute.of(context).settings.arguments;
    String noteBarText = (note.title != null &&
            note.description != null &&
            note.title.isNotEmpty &&
            note.description.isNotEmpty)
        ? "Edit note"
        : "New note";

    return Scaffold(
      appBar: AppBar(
        title: Text(noteBarText),
      ),
      body: getNoteLayout(context, note),
    );
  }

  Container getNoteLayout(BuildContext context, NoteData note) {
    TextEditingController titleController =
        TextEditingController(text: note.title);
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Note title'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              onChanged: (String value) async {
                print(value);
                note.title = value;
              },
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Note body'),
            ),
          ],
        ),
      ),
    );
  }
}
