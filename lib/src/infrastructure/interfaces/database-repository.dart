import 'package:get/get.dart';

abstract class IDbRepository {
  RxBool get isCalibreConnected;
  late RxString directoryPath;

  Future<void> attachCalibreDb(String path);
  Future<void> reattachCalibreDb();
}
