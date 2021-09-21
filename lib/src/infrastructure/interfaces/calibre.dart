import 'package:get/get.dart';

abstract class IDbRepository {
  late RxBool isDbExist;
  late RxString directoryPath;

  Future<void> openDb(String path);
}
