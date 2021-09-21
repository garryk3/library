import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_storage/get_storage.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/constants/constants.dart';

class GetPathController {
  final IDbRepository _dbRepository = Get.find();
  String get directoryPath => _dbRepository.directoryPath.value;
  RxBool get isDbExist => _dbRepository.isDbExist;

  Future<void> _savePathToStore(String path) {
    return GetStorage().write(DB_PATH_KEY, path);
  }

  Future<void> openFileSystem() async {
    try {
      final path = await FilePicker.platform.getDirectoryPath();
      if (path == null) {
        return;
      }
      await _dbRepository.openDb(path);
      await _savePathToStore(path);
    } catch (error) {
      // await Get.defaultDialog(title: error.message);
    }
  }
}
