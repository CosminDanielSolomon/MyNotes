import '../models/noteData.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  final String _notesTableName = 'notes';
  final String _positionColumnName = 'position';
  final String _idColumnName = 'id';
  final String _titleColumnName = 'title';
  final String _descriptionColumnName = 'description';
  final String _dateTimeColumnName = 'dateTime';
  // make this a singleton class
  DatabaseHandler._privateConstructor();
  static final DatabaseHandler instance = DatabaseHandler._privateConstructor();
  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initializeDB();
    return _database;
  }

  Future<Database> _initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'notes_database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE $_notesTableName($_idColumnName TEXT NOT NULL PRIMARY KEY, $_titleColumnName TEXT NOT NULL, $_descriptionColumnName TEXT NOT NULL, $_positionColumnName INTEGER NOT NULL, $_dateTimeColumnName TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertNote(NoteData noteData) async {
    // Get a reference to the database.
    final Database db = await instance.database;
    int id = await db.insert(
      _notesTableName,
      noteData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("id: " + id.toString());
  }

  Future<void> updateNote(NoteData noteData) async {
    // Get a reference to the database.
    final Database db = await instance.database;
    await db.update(
      _notesTableName,
      noteData.toMap(),
      where: '$_idColumnName = ?',
      // Pass the Note's id as a whereArg to prevent SQL injection.
      whereArgs: [noteData.id],
    );
  }

  Future<void> deleteNote(NoteData noteData) async {
    // Get a reference to the database.
    final Database db = await database;
    await db.delete(
      _notesTableName,
      where: '$_idColumnName = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [noteData.id],
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<NoteData>> notes() async {
    // Get a reference to the database.
    final Database db = await instance.database;
    // Query the table for all notes
    final List<Map<String, dynamic>> maps = await db.query(_notesTableName);
    print(maps);
    print(maps.length);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return NoteData.fromDb(
        maps[i][_positionColumnName],
        maps[i][_idColumnName],
        maps[i][_titleColumnName],
        maps[i][_descriptionColumnName],
        DateTime.parse(maps[i][_dateTimeColumnName]),
      );
    });
  }
}
