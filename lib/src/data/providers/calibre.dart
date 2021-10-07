import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';
import 'dart:io';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/data/sql/sql.dart';

class CalibreProvider extends GetxService implements ICalibreProvider {
  final _dbService = Get.find<IDatabase>();
  final String _attachDbFileName = 'metadata.db';
  bool _isCalibreAttached = false;

  @override
  Future<String?>? attachCalibreDb(String calibreFolderPath) async {
    var dbFilePath = join(calibreFolderPath, _attachDbFileName);

    try {
      var isFileExist = File(dbFilePath).existsSync();
      if (!isFileExist) {
        throw Error();
      }

      if (_isCalibreAttached) {
        await dettachCalibreDb();
      }
      await _dbService.execute(attachDb, [dbFilePath]);
      _isCalibreAttached = true;
      return dbFilePath;
    } catch (error) {
      Get.find<Logger>().e(error);
    }
  }

  @override
  Future<void>? dettachCalibreDb() => _dbService.execute(detachDb);

  @override
  Future<List<Map<String, Object?>>>? getDatabasesNames() => _dbService.rawQuery('PRAGMA database_list');

  @override
  Future<List<Map<String, Object?>>>? loadBooks() => _dbService.rawQuery(selectCalibreBooks);

  @override
  Future<List<Map<String, Object?>>>? loadBookInfo(int id) => _dbService.rawQuery(selectCalibreBookInfo, [id]);

  @override
  Future<List<Map<String, Object?>>>? loadAuthors() => _dbService.rawQuery(selectAuthors, []);

  @override
  Future<List<Map<String, Object?>>>? loadSeriesBooks(int seriesId, int excludedBookId) {
    return _dbService.rawQuery(selectSeriesBooks, [seriesId, excludedBookId]);
  }

  @override
  Future<void> saveFavoriteBook(int id, bool value) async {
    var val = value ? 1 : 0;
    await _dbService.execute(insertFavoriteBook, [id, val]);
  }

  @override
  Future<void> saveReadBook(int id, bool value) async {
    var val = value ? 1 : 0;
    await _dbService.execute(insertReadBook, [id, val]);
  }

  @override
  Future<Map<String, dynamic>?> loadBookSavedInfo(int id) async {
    var data = await _dbService.rawQuery(selectBookSavedInfo, [id]);
    if (data != null && data.isNotEmpty) {
      return data.single;
    }
    return null;
  }
}
