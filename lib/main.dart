import 'package:flutter/material.dart';

import './myNotesList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = "My Happy NOTES";

    const primaryColor = Color(0xff1976d2);
    const accentColor = Color(0xffffea00);
    const primaryLightColor = Color(0xff63a4ff);
    const primaryDarkColor = Color(0xff004ba0);
    const secondaryColor = Color(0xffffea00);
    const secondaryLightColor = Color(0xffffff56);
    const secondaryDarkColor = Color(0xffc7b800);
    const primaryTextColor = Color(0xffffffff);
    const secondaryTextColor = Color(0xff000000);

    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: primaryColor,
        accentColor: accentColor,
        // cardColor: accentColor,

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            // subtitle1: TextStyle(fontWeight: FontWeight.bold),
            ),
        cardTheme: CardTheme(
          elevation: 5.0,
          margin: EdgeInsets.all(5.0),
          shadowColor: accentColor,
          clipBehavior: Clip.none,
        ),
      ),
      home: MyNotesList(title: appTitle),
    );
  }
}
