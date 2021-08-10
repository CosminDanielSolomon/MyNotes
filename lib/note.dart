import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              showAlertDialog(context);
            },
          )
        ],
      ),
      body: getNoteLayout(context, note),
    );
  }

  Container getNoteLayout(BuildContext context, NoteData note) {
    TextEditingController titleController =
        TextEditingController(text: note.title);
    TextEditingController descriptionController =
        TextEditingController(text: note.description);
    final DateFormat formatter = DateFormat('dd MMM yyyy At HH:mm');
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
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
                note.title = value;
                note.lastModifyDate = DateTime.now();
              },
            ),
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Note body'),
              onChanged: (String value) async {
                note.description = value;
                note.lastModifyDate = DateTime.now();
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Last edit on " + formatter.format(note.lastModifyDate),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context, true);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete note?"),
      content: Text("The note will be permanently deleted. Do you confirm?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
