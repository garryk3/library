import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/models/authors.dart';

class CalibreRepository extends GetxService implements IDbRepository {
  final _provider = Get.find<ICalibreProvider>();
  final _notification = Get.find<INotification>();

  @override
  RxString directoryPath = ''.obs;
  @override
  Rx<AuthorsModel> authors = AuthorsModel.empty().obs;

  @override
  RxBool get isCalibreConnected => (directoryPath.value.isNotEmpty).obs;

  @override
  Future<void> attachCalibreDb(String path) async {
    try {
      await _provider.attachCalibreDb(path);
      directoryPath.value = path;
    } catch (error) {
      Get.find<Logger>().e(error);
      if (directoryPath.value.isNotEmpty) {
        directoryPath.value = '';
      }
      _notification.showError('Не удалось загрузить базу данных!');
    }
  }

  @override
  Future<void> reattachCalibreDb() async {
    if (!isCalibreConnected.value) {
      return;
    }
    try {
      await _provider.dettachCalibreDb();
      await _provider.attachCalibreDb(directoryPath.value);
      _notification.showInfo('База данных обновлена!');
    } catch (error) {
      _notification.showError('Во время обновления произошла ошибка!');
    }
  }

  @override
  Future<void> loadAuthors() async {
    try {
      if (authors.value.authorsList.isNotEmpty) {
        return;
      }
      var authorsList = await _provider.loadAuthors();
      if (authorsList != null) {
        authors(AuthorsModel.groupedFromMap(authorsList));
      }
    } catch (error) {
      _notification.showError(error.toString());
    }
  }
}
