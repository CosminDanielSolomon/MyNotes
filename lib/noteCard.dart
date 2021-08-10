import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/noteData.dart';
import 'models/notesModel.dart';

class NoteCard extends StatelessWidget {
  final Key key;
  final NoteData noteData;

  NoteCard(this.key, this.noteData);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key, // the key is needed for the ReordableListView
      child: InkWell(
        onTap: () {
          showNoteDetails(context);
        },
        child: ListTile(
          isThreeLine: false,
          title: Text(
            noteData.title,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          trailing: PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Edit'),
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Delete'),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'edit') {
                showNoteDetails(context);
              } else if (value == 'delete') {
                showDelteAlertDialog(context);
              }
            },
          ),
        ),
      ),
    );
  }

  void showNoteDetails(BuildContext context) {
    Navigator.pushNamed(context, '/noteDetails', arguments: noteData).then(
      (value) => {
        if ((value != null && value) ||
            (noteData.title == "" && noteData.description == ""))
          Provider.of<NotesModel>(context, listen: false).remove(noteData)
        else
          Provider.of<NotesModel>(context, listen: false)
              .signalNoteUpdate(noteData)
      },
    );
  }

  showDelteAlertDialog(BuildContext context) {
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
        Provider.of<NotesModel>(context, listen: false).remove(noteData);
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
