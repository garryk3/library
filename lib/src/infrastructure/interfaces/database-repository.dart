import 'package:get/get.dart';

abstract class IDbRepository {
  late RxBool isCalibreConnected;
  late RxString directoryPath;

  Future<void> attachCalibreDb(String path);
}
