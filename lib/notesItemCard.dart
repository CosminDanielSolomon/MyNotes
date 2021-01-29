import 'package:flutter/material.dart';

class NotesItemCard extends StatelessWidget {
  final String title;

  NotesItemCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      // color: Theme.of(context).primaryColor,
    );
  }
}
