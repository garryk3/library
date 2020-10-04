part of '../providers.dart';

/// провайдер для работы с базой данной калибре;
/// копирование оригинальной базы в приложение;
/// изменение копии;
/// обновление оригинальной базы копией;
class DbProvider implements IProvider {
  DbProvider._private();

  factory DbProvider(logger) {
    _instance._logger = logger;
    _instance.commands = DbCommands(_instance);
    return _instance;
  }

  static final DbProvider _instance = DbProvider._private();

  final String _calibreDbFileName = 'metadata.db';
  final String _appDbFileName = 'app.db';

  DbCommands commands;
  Logger _logger;
  String _pathToCalibreFolder;
  Database _db;
  bool _isCalibreDbExist;

  String get calibreFolderPath => _pathToCalibreFolder;
  String get calibreFileName => _calibreDbFileName;
  bool get isCalibreExist => _isCalibreDbExist;

  Future<String> _getPath() async {
    var databasesPath = await getDatabasesPath();
    return join(databasesPath, _appDbFileName);
  }

  Future<void> _open() async {
    if (_db != null && _db.isOpen) {
      await execute(detachDb);
      await _db.close();
    }
    var path = await _getPath();
    _db = await openDatabase(path);
  }

  Future<bool> isCalibreExistByCurrentPath() {
    return databaseExists(join(_pathToCalibreFolder, _calibreDbFileName));
  }

  Future<void> initialize() async {
    await _open();
    _pathToCalibreFolder = await readCalibrePath();
    if (_db != null) {
      try {
        await commands.createMainTables();
        if (_pathToCalibreFolder != null) {
          _isCalibreDbExist = await isCalibreExistByCurrentPath();
          if (!_isCalibreDbExist) {
            return;
          }

          await commands.attachCalibreDb();
        }
      } catch (error) {
        _logger.e(error);
      }
    }
  }

  Future<void> reattachCalibre(bool hasConnected) async {
    if (hasConnected) {
      await commands.dettachCalibreDb();
    }
    if (await isCalibreExistByCurrentPath()) {
      await commands.attachCalibreDb();
    }
  }

  Future<String> readCalibrePath() => commands.readCalibrePath();

  Future<void> writePathToCalibreFolder(String path) async {
    if (path == _pathToCalibreFolder) {
      return;
    }
    _pathToCalibreFolder = path;
    _isCalibreDbExist = await isCalibreExistByCurrentPath();
    var lastSavedPath = await commands.readCalibrePath();

    if (lastSavedPath != null) {
      await commands.deleteCalibreDbPath();
    }

    await rawInsert(insertCalibrePath, [calibreColumnName, path]);
  }

  Future<Database> getInstance() async {
    if (_db == null) {
      await initialize();
    }
    return _db;
  }

  Future<void> execute(String raw, [List<dynamic> values]) async {
    var db = await getInstance();
    return db.execute(raw, values);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String raw, [List<dynamic> values]) async {
    var db = await getInstance();
    return db.rawQuery(raw, values);
  }

  Future<int> rawInsert(String raw, [List<dynamic> values]) async {
    var db = await getInstance();
    return db.rawInsert(raw, values);
  }

  Future<int> rawUpdate(String raw, [List<dynamic> values]) async {
    var db = await getInstance();
    return db.rawUpdate(raw, values);
  }

  Future<int> rawDelete(String raw, [List<dynamic> values]) async {
    var db = await getInstance();
    return db.rawDelete(raw, values);
  }

  void dispose() async {
    if (_db == null) {
      return;
    }
    await commands.dettachCalibreDb();
    await _db.close();
  }
}
