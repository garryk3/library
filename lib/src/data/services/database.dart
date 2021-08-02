import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class DbService extends GetxService implements IDatabase {
  final String _dbFileName = 'metadata.db';
  late String _dbFolderPath;

  Database? _db;

  bool get isOpened => _db != null;

  Future<bool> checkDatabase(String path) {
    return databaseExists(path);
  }

  @override
  Future<void> open({required String forderPath}) async {
    _dbFolderPath = forderPath;
    final path = join(_dbFolderPath, _dbFileName);
    final isExist = await checkDatabase(path);

    if (!isExist) {
      throw Exception('open database failed');
    }
    _db = await openDatabase(path);
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

  void dispose() async {
    await close();
  }
}
