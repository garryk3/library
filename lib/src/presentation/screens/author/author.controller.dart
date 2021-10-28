import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/models/author.dart';

class AuthorController extends GetxController {
  final _dbRepository = Get.find<IDbRepository>();
  final id = Get.parameters['id'] as String;

  AuthorModel? get author => _dbRepository.authors.value.getAuthorById(int.parse(id));
}
