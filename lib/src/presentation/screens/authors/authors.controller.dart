import 'package:get/get.dart';

import 'package:library/src/infrastructure/models/authors.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class AuthorsController extends GetxService {
  final _dbRepository = Get.find<IDbRepository>();
  Rx<AuthorsModel?>? get authors => _dbRepository.authors;

  @override
  void onInit() {
    _dbRepository.loadAuthors();
    super.onInit();
  }
}
