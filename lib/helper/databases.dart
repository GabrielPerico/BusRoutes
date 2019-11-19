import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/string.dart';

class Databases{
  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contatos.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $loginTable($idLogin INTEGER PRIMARY KEY AUTOINCREMENT, $nomeLogin TEXT, $emailLogin TEXT, $senhaLogin TEXT);"
      );
      await db.execute(
          "CREATE TABLE $logadoTable ($idLogado INTEGER PRIMARY KEY AUTOINCREMENT,$loginId INT,$logadoToken STRING);"
      );
    });
  }
}