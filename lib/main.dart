import 'dart:ui';

import 'package:flutter/material.dart';

import './notesItemCard.dart';

void main() {
  runApp(NotesList());
}

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = "My Happy NOTES";

    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          // brightness: Brightness.dark,
          primaryColor: Colors.blue, //Color(0xffb3e5fc),
          accentColor: Colors.green, //Color(0xff66bb6a),

          // Define the default font family.
          // fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          // textTheme: TextTheme(
          //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
        ),
        home: MyHomePage(title: appTitle));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final notesTitle = [
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4",
    "nota1",
    "nota2",
    "nota3",
    "nota4"
  ];

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implements the basic material design visual layout structure.
      appBar: AppBar(
        title: Text(
          title,
          // style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            ...(notesTitle).map((currentNoteTitle) {
              return NotesItemCard(currentNoteTitle);
            }).toList(),
          ],
        ),
      ),
      // backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
