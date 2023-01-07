import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';
import 'package:library/src/infrastructure/models/author.dart';
import 'package:library/src/infrastructure/models/book.dart';

class AuthorController extends GetxController {
  final _dbRepository = Get.find<IDbRepository>();
  final id = Get.parameters['id'] as String;
  final List<BookModel> books = <BookModel>[].obs;
  final List<BookModel> externalBooks = <BookModel>[].obs; // test
  RxBool isFavorite = false.obs;
  RxString authorDescription = ''.obs;

  AuthorModel? get author => _dbRepository.authors.value.getAuthorById(int.parse(id));

  Future<void> onTapFavorite() async {
    isFavorite.value = !isFavorite.value;
  }

  @override
  void onInit() async {
    var loadedBooks = await _dbRepository.loadAuthorBooksInfo(int.parse(id));
    if (loadedBooks.isNotEmpty) {
      books.addAll(loadedBooks);
    }
    super.onInit();
  }
}
