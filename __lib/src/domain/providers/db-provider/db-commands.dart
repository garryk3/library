part of '../providers.dart';

class DbCommands {
  final DbProvider _db;
  final Logger _logger;

  const DbCommands(this._db, this._logger);

  Future<void> createMainTables() async {
    await _db.execute(createTableSettings);
    await _db.execute(createTableBooks);
  }

  Future<void> attachCalibreDb() => _db.execute(attachDb, [join(_db.calibreFolderPath, _db.calibreFileName)]);

  Future<void> dettachCalibreDb() => _db.execute(detachDb);

  Future<void> dropTables() async {
    await _db.execute(dropTableBooks);
    await _db.execute(dropTableSettings);
  }

  Future<void> deleteCalibreDbPath() => _db.rawDelete(deleteCalibrePath);

  Future<String> readCalibrePath() async {
    String path;
    try {
      var dbCalibreSettings = await _db.rawQuery(selectDbPath);
      if (dbCalibreSettings.isNotEmpty) {
        path = dbCalibreSettings.single['value'];
      }
    } catch (error) {
      _logger.e(error);
    }

    return path;
  }

  Future<List<Map<String, dynamic>>> loadBooks() => _db.rawQuery(selectCalibreBooks);

  Future<List<Map<String, dynamic>>> loadBookInfo(int id) => _db.rawQuery(selectCalibreBookInfo, [id]);

  Future<List<Map<String, dynamic>>> loadAuthors() => _db.rawQuery(selectAuthors, []);

  Future<List<Map<String, dynamic>>> loadSeriesBooks(int seriesId, int excludedBookId) =>
      _db.rawQuery(selectSeriesBooks, [seriesId, excludedBookId]);

  Future<void> saveFavoriteBook(int id, bool value) async {
    var val = value ? 1 : 0;
    await _db.execute(insertFavoriteBook, [id, val]);
  }

  Future<void> saveReadBook(int id, bool value) async {
    var val = value ? 1 : 0;
    await _db.execute(insertReadBook, [id, val]);
  }

  Future<Map<String, dynamic>> loadBookSavedInfo(int id) async {
    var data = await _db.rawQuery(selectBookSavedInfo, [id]);
    if (data.isNotEmpty) {
      return data.single;
    }
    return null;
  }
}
