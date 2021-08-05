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
          Navigator.pushNamed(context, '/noteDetails', arguments: noteData)
              .then((value) => {
                    if (value != null && value)
                      {
                        Provider.of<NotesModel>(context, listen: false)
                            .remove(noteData)
                      }
                    else
                      {
                        if (noteData.title == "" && noteData.description == "")
                          Provider.of<NotesModel>(context, listen: false)
                              .remove(noteData)
                        else
                          Provider.of<NotesModel>(context, listen: false)
                              .signalNoteUpdate()
                      }
                  });
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
        ),
      ),
    );
  }
}
