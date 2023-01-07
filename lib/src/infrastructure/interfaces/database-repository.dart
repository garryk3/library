import 'package:get/get.dart';

import 'package:library/src/infrastructure/models/authors.dart';
import 'package:library/src/infrastructure/models/book.dart';

abstract class IDbRepository {
  late RxString directoryPath;
  late Rx<AuthorsModel> authors;

  RxBool get isCalibreConnected;

  Future<void> attachCalibreDb(String path);
  Future<void> reattachCalibreDb();
  Future<void> loadAuthors();
  Future<List<BookModel>> loadAuthorBooksInfo(int id);
}
