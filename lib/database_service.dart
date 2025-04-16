import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;
  static SharedPreferences? _prefs;

  factory DatabaseService() => _instance;

  DatabaseService._internal() {
    if (!kIsWeb) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<Database> get database async {
    if (kIsWeb) {
      throw UnsupportedError('Web platformunda SQLite desteklenmez');
    }
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'beansocial.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT,
        name TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE user_data(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        data TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id)
      )
    ''');
  }

  // User operations
  Future<int> createUser(String email, String password, {String? name}) async {
    if (kIsWeb) {
      await _initPrefs();
      final users = _prefs!.getStringList('users') ?? [];
      final user = {
        'id': users.length + 1,
        'email': email,
        'password': password,
        'name': name,
        'created_at': DateTime.now().toIso8601String(),
      };
      users.add(jsonEncode(user));
      await _prefs!.setStringList('users', users);
      return user['id'] as int;
    } else {
      final db = await database;
      return await db.insert('users', {
        'email': email,
        'password': password,
        'name': name,
      });
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    if (kIsWeb) {
      await _initPrefs();
      final users = _prefs!.getStringList('users') ?? [];
      final userJson = users.map((e) => jsonDecode(e)).firstWhere(
            (user) => user['email'] == email,
            orElse: () => null,
          );
      return userJson;
    } else {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );
      if (maps.isNotEmpty) {
        return maps.first;
      }
      return null;
    }
  }

  Future<void> saveUserData(int userId, Map<String, dynamic> data) async {
    if (kIsWeb) {
      await _initPrefs();
      final userDataList = _prefs!.getStringList('user_data_$userId') ?? [];
      userDataList.add(jsonEncode({
        ...data,
        'created_at': DateTime.now().toIso8601String(),
      }));
      await _prefs!.setStringList('user_data_$userId', userDataList);
    } else {
      final db = await database;
      await db.insert('user_data', {
        'user_id': userId,
        'data': data.toString(),
      });
    }
  }

  Future<Map<String, dynamic>?> getUserData(int userId) async {
    if (kIsWeb) {
      await _initPrefs();
      final userDataList = _prefs!.getStringList('user_data_$userId') ?? [];
      if (userDataList.isNotEmpty) {
        return jsonDecode(userDataList.last);
      }
      return null;
    } else {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'user_data',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'created_at DESC',
        limit: 1,
      );
      if (maps.isNotEmpty) {
        return maps.first;
      }
      return null;
    }
  }
}
