part of '../providers.dart';

class DbCommands {
  final DbProvider _db;

  const DbCommands(this._db);

  Future<void> createMainTables() => _db.execute(createTables);

  Future<void> attachCalibreDb() => _db.execute(attachDb, [join(_db.calibreFolderPath, _db.calibreFileName)]);

  Future<void> dettachCalibreDb() => _db.execute(detachDb);

  Future<void> deleteCalibreDbPath() => _db.rawDelete(deleteCalibrePath);

  Future<String> readCalibrePath() async {
    var dbCalibreSettings = await _db.rawQuery(selectDbPath);
    String path = dbCalibreSettings?.single['path'];

    return path;
  }

  Future<List<Map<String, dynamic>>> loadBooks() => _db.rawQuery(selectCalibreBooks);

  Future<List<Map<String, dynamic>>> loadBookInfo(int id) => _db.rawQuery(selectCalibreBookInfo, [id]);
}
