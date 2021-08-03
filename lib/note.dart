import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'models/noteData.dart';
import 'models/notesModel.dart';

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NoteData arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        children: [
          Text(
            arg.title,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped.
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
