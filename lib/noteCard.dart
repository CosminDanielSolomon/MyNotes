import 'package:flutter/material.dart';

import 'models/noteData.dart';

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
          Navigator.pushNamed(context, '/noteDetails', arguments: noteData);
        },
        child: ListTile(
          isThreeLine: false,
          title: Text(
            noteData.title, // TODO qui devo usare Consumer?
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
