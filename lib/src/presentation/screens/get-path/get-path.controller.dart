import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/constants/constants.dart';

class GetPathController {
  final _dbRepository = Get.find<IDbRepository>();
  String get directoryPath => _dbRepository.directoryPath.value;
  RxBool get isCalibreConnected => _dbRepository.isCalibreConnected;

  Future<void> _savePathToStore(String path) {
    return GetStorage().write(DB_PATH_KEY, path);
  }

  Future<String?> _openFileSystem() async {
    try {
      final path = await FilePicker.platform.getDirectoryPath();
      if (path == null) {
        throw Error();
      }
      return path;
    } catch (error) {
      Get.find<Logger>().e(error);
    }
  }

  Future<void> getCalibreFolderPath() async {
    final path = await _openFileSystem();
    if (path == null) {
      return;
    }
    await _dbRepository.attachCalibreDb(path);
    if (_dbRepository.directoryPath.value.isNotEmpty) {
      await _savePathToStore(path);
    }
  }
}
