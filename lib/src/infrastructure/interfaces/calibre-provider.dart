abstract class ICalibreProvider {
  Future<void> attachCalibreDb(String calibreFolderPath);

  Future<void>? dettachCalibreDb();

  Future<List<Map<String, Object?>>>? getDatabasesNames();

  Future<List<Map<String, Object?>>>? loadBooks();

  Future<List<Map<String, Object?>>>? loadBookInfo(int id);

  Future<List<Map<String, Object?>>>? loadAuthors();

  Future<List<Map<String, Object?>>>? loadSeriesBooks(int seriesId, int excludedBookId);

  Future<void> saveFavoriteBook(int id, bool value);

  Future<void> saveReadBook(int id, bool value);

  Future<Map<String, dynamic>?> loadBookSavedInfo(int id);

  Future<List<Map<String, Object?>>>? loadAuthorBooksInfo(int id);
}
