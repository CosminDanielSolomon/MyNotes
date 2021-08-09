import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'models/notesModel.dart';
import 'myNotesList.dart';
import 'note.dart';

void main() async {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = "Personal NOTES";

    return MaterialApp(
      theme: appTheme,
      // Start the app with the "/" named route. In this case, the app starts on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ChangeNotifierProvider(
              // ChangeNotifierProvider must be placed above the widgets that need to access it
              create: (context) => NotesModel(),
              child: MyNotesList(
                title: appTitle,
              ),
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/noteDetails': (context) => Note(),
      },
      // home: MyNotesList(title: appTitle),
    );
  }
}
