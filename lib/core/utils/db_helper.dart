// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbHelper {
//   /// private constructor
//   DbHelper._();
//
//   /// singleton instance
//   static final DbHelper dbHelper = DbHelper._();
//
//   /// database name and version creation
//   static const dbName = "items.db";
//   static const dbVersion = 1;
//
//   /// database creation
//   Database? _database;
//
//   /// database getter check if database is null or not
//   Future<Database> get database async {
//     /// check if database is not null
//     if (_database != null) {
//       return _database!;
//     }
//     /// if database is null create database
//     else {
//       _database = await _initDatabase();
//       return _database!;
//     }
//   }
//
//   /// database initialization
//   Future<Database> _initDatabase() async {
//     /// database path
//     String path = join(await getDatabasesPath(), dbName);
//
//     /// database creation
//     return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     /// create table
//     await db.execute('''
//       CREATE TABLE items(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         price REAL NOT NULL
//       )
//       ''');
//   }
//
//   /// ----------- CRUD -------------
//   ///
//   /// create, read, update, delete
//   ///
//   ///
//
//
//   /// insert data into database
//   Future<int> insertItem(Map<String, dynamic> data) async {
//     /// get database
//     Database db = await database;
//
//     /// insert data
//     return await db.insert('items', data);
//   }
//
//   /// get all data from database
//   Future<List<Map<String, dynamic>>> getAllItems() async {
//     /// get database
//     Database db = await database;
//
//     /// get all data
//     return await db.query('items');
//   }
//
//   /// update data in database
//   Future<int> updateItem(Map<String, dynamic> data) async {
//     /// get database
//     Database db = await database;
//
//     /// update data
//     return await db.update(
//       'items',
//       data,
//       where: 'id = ?',
//       whereArgs: [data['id']],
//     );
//   }
//
//   /// delete data from database
//   Future<int> deleteItem(int id) async {
//     /// get database
//     Database db = await database;
//
//     /// delete data
//     return await db.delete('items', where: 'id = ?', whereArgs: [id]);
//   }
// }
