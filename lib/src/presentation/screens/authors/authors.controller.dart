import 'package:get/get.dart';

import 'package:library/src/infrastructure/models/author.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class AuthorsController extends GetxController {
  final _dbRepository = Get.find<IDbRepository>();
  List<MapEntry<String, List<AuthorModel>>> get groupedAuthors =>
      _dbRepository.authors.value.getSortedByFirstLetterAuthorsList();

  @override
  void onInit() {
    if (groupedAuthors.isEmpty) {
      _dbRepository.loadAuthors();
    }
    super.onInit();
  }
}
