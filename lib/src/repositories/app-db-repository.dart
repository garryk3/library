import 'package:library/src/services/service-locator.dart';

class AppDbRepository {
  static final _instance = AppDbRepository._private();
  final DbProvider _dbProvider = getService<DbProvider>();

  AppDbRepository._private();

  factory AppDbRepository() {
    return _instance;
  }

  Future<void> saveFavoritesBook(int id, bool value) async {
    print('save favorites $value');
  }

  Future<void> saveReadedBook(int id, bool value) async {
    print('save readed $value');
  }

  Future<void> loadBookSavedInfoById(int id) async {
    print('id $id');
  }

  Future<void> dropAppTables() => _dbProvider.commands.dropTables();
}
