import 'package:get/get.dart';

import 'package:library/src/infrastructure/models/authors.dart';

abstract class IDbRepository {
  RxBool get isCalibreConnected;
  late RxString directoryPath;
  Rx<AuthorsModel?>? authors;
  Future<void> attachCalibreDb(String path);
  Future<void> reattachCalibreDb();
  Future<void> loadAuthors();
}
