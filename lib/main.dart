import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = "My Happy NOTES";
    const notesTitle = [
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

    return MaterialApp(
      home: Scaffold(
        // Implements the basic material design visual layout structure.
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: ListView(
            children: [
              ...(notesTitle).map((currentNoteTitle) {
                return Card(
                  child: Text(currentNoteTitle),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
