import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db; // Private database instance

  // Singleton to get database instance
  static Future<Database> getInstance() async {
    _db ??= await _initDB();
    return _db!;
  }

  // Initialize Database
  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTables, 
    );
  }

  // Create Tables
  static Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE
      )
    ''');
  }

  Future<int> insertUser(String name, String email) async {
  final db = await DBHelper.getInstance();
  return await db.insert(
    'users',
    {'name': name, 'email': email},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await DBHelper.getInstance();
  return await db.query('users');
}

Future<int> updateUser(int id, String name, String email) async {
  final db = await DBHelper.getInstance();
  return await db.update(
    'users',
    {'name': name, 'email': email},
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<int> deleteUser(int id) async {
  final db = await DBHelper.getInstance();
  return await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}
}
