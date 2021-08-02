import 'package:library/src/services/service-locator.dart';

class AppDbRepository {
  static final _instance = AppDbRepository._private();
  final DbProvider _dbProvider = getService<DbProvider>();

  AppDbRepository._private();

  factory AppDbRepository() {
    return _instance;
  }

  Future<Map<String, dynamic>> initializeDbAndLoadStartValues() async {
    await _dbProvider.initialize();

    return {
      'isCalibreExist': _dbProvider.isCalibreExist,
      'path': _dbProvider.calibreFolderPath,
    };
  }

  Future<void> saveFavoritesBook(int id, bool value) async {
    await _dbProvider.commands.saveFavoriteBook(id, value);
  }

  Future<void> saveReadBook(int id, bool value) async {
    await _dbProvider.commands.saveReadBook(id, value);
  }

  Future<Map<String, dynamic>> loadBookSavedInfoById(int id) async {
    var data = await _dbProvider.commands.loadBookSavedInfo(id);

    print('loaded data test ${await _dbProvider.rawQuery("select * from BooksInfo")}');

    if (data != null) {
      return data;
    }
    return {};
  }

  Future<void> dropAppTables() => _dbProvider.commands.dropTables();
}
