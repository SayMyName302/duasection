import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> copyDatabase() async {
  // Get the path to the app's data directory
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'fullquran.db');

  // Check if the database file already exists
  bool exists = await io.File(path).exists();

  if (!exists) {
    // If the database file doesn't exist, copy it from the assets folder
    ByteData data = await rootBundle.load('assets/fullquran.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await io.File(path).writeAsBytes(bytes);
  }
}

class Dua {
  final String duaText;
  final String translationUrdu;

  Dua({required this.duaText, required this.translationUrdu});
}

Future<List<Dua>> getDataFromDatabase() async {
  // Copy the database file if it doesn't exist
  await copyDatabase();

  // Open the database and execute a query
  String path = join(await getDatabasesPath(), 'fullquran.db');
  Database database = await openDatabase(path);
  List<Map<String, dynamic>> results = await database.rawQuery(
      "SELECT dua_text, translation_urdu FROM duas_all WHERE dua_title = 'rabbana'");

  // Close the database and map the query results to Dua objects
  await database.close();
  return results
      .map((result) => Dua(
            duaText: result['dua_text'],
            translationUrdu: result['translation_urdu'],
          ))
      .toList();
}
