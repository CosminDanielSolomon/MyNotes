import 'package:flutter/material.dart';

import 'package:notes_with_flutter/common/theme.dart';
import 'package:notes_with_flutter/note.dart';
import './myNotesList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = "My Happy NOTES";

    return MaterialApp(
      theme: appTheme,
      // Start the app with the "/" named route. In this case, the app starts on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyNotesList(title: appTitle),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
      // home: MyNotesList(title: appTitle),
    );
  }
}
