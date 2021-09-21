import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class CalibreRepository extends IDbRepository {
  final IDatabase _dbController = Get.find();

  @override
  RxBool isDbExist = false.obs;

  @override
  RxString directoryPath = ''.obs;

  @override
  Future<void> openDb(String path) async {
    await _dbController.open(folderPath: path);
    isDbExist.value = await _dbController.checkDatabase();
    directoryPath.value = path;
  }
}
