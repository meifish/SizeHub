import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future<Database> init() async {
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'profileDB.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE userProfile(usrID INTEGER PRIMARY KEY, usrName TEXT, gender TEXT, introduction TEXT, height TEXT, weight TEXT, bodyShape TEXT)');
      },
      version: 1,
    );
    return database;
  }
}
