import 'package:flutter/material.dart';

class NoteItemCard extends StatelessWidget {
  final Key key;
  final String title;

  NoteItemCard(this.key, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key, // the key is needed for the ReordableListView
      child: ListTile(
        isThreeLine: false,
        title: Text(
          title,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
