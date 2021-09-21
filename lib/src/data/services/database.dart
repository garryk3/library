import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class DbService extends GetxService implements IDatabase {
  final String _dbFileName = 'metadata.db';

  Database? _db;

  bool get isOpened => _db != null;

  @override
  Future<bool> checkDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbFileName);

    return databaseExists(path);
  }

  @override
  Future<void> open({required String folderPath}) async {
    var dbFilePath = join(await getDatabasesPath(), _dbFileName);
    final pathToLoadedDbFile = join(folderPath, _dbFileName);
    final isExist = await checkDatabase();
    var status = await Permission.storage.request();

    if (!isExist && status == PermissionStatus.granted) {
      try {
        await Directory(dirname(pathToLoadedDbFile)).create(recursive: true);

        var data = await File(join(folderPath, _dbFileName)).readAsBytes();
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(dbFilePath).writeAsBytes(bytes, flush: true);

        _db = await openDatabase(dbFilePath);
      } catch (error) {
        print('error $status ${error.toString()}');
      }
    }
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
