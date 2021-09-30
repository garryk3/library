import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/data/sql/sql.dart';

class DbService extends GetxService implements IDatabase {
  final String _dbFileName = 'library.db';

  Database? _db;

  bool get isOpened => _db?.isOpen ?? false;

  @override
  Future<void> initialize() async {
    await open();
  }

  @override
  Future<void> open() async {
    if (isOpened) {
      return;
    }
    var databasesPath = await getDatabasesPath();
    var dbFilePath = join(await getDatabasesPath(), _dbFileName);
    try {
      var status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        await Directory(databasesPath).create(recursive: true);
      }
    } catch (error) {
      print(error);
    }
    _db = await openDatabase(
      dbFilePath,
      onCreate: (db, version) {
        return db.execute(createAppTables);
      },
      version: 1,
    );
  }

  @override
  Future<List<Map<String, dynamic>>>? query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    return _db?.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<int>? insert(
    String table,
    Map<String, dynamic> values,
  ) {
    return _db?.insert(table, values);
  }

  @override
  Future<int>? update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<dynamic>? whereArgs,
  }) {
    return _db?.update(
      table,
      values,
      whereArgs: whereArgs,
      where: where,
    );
  }

  @override
  Future<void>? execute(String sql, [List<dynamic>? arguments]) {
    return _db?.execute(sql, arguments);
  }

  @override
  Future<int>? delete(String table, {String? where, List<dynamic>? whereArgs}) {
    return _db?.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<List<Map<String, Object?>>>? rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) {
    return _db?.rawQuery(sql);
  }

  @override
  Future<void> close() async {
    await _db?.close();
  }

  @override
  Future<void> onClose() async {
    await close();
  }
}
