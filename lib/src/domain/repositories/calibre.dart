import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class CalibreRepository extends GetxService implements IDbRepository {
  final _provider = Get.find<ICalibreProvider>();

  @override
  RxBool isCalibreConnected = false.obs;

  @override
  RxString directoryPath = ''.obs;

  @override
  Future<void> attachCalibreDb(String path) async {
    try {
      var dbFileName = await _provider.attachCalibreDb(path);

      if (dbFileName != null) {
        directoryPath.value = path;
        isCalibreConnected.value = true;

        // test
        var response = await _provider.loadAuthors();
        print(response);
      }
    } catch (error) {
      Get.find<Logger>().e(error);
    }
  }
}
