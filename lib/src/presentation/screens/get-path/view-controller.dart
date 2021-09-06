import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_storage/get_storage.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/constants/constants.dart';
import 'package:library/src/presentation/app/state-controller.dart';

class GetPathViewController {
  final IDatabase _db = Get.find();

  Future<void> openFileSystem() async {
    try {
      final path = await FilePicker.platform.getDirectoryPath();
      if (path == null) {
        return;
      }
      final isDbExist = await _db.checkDatabase(path);

      appStateController.update((state) {
        state!.dbPath = path;
        state.isDbExist = isDbExist;
      });
      if (isDbExist) {
        await GetStorage().write(DB_PATH_KEY, path);
      }
    } catch (error) {
      // await Get.defaultDialog(title: error.message);
    }
  }
}
