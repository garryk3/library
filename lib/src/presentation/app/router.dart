import 'package:get/get.dart';

import 'package:library/src/presentation/screens/get-path/get-path.dart';
import 'package:library/src/presentation/screens/home/index.dart';
import 'package:library/src/presentation/screens/library/library.dart';
import 'package:library/src/presentation/screens/book-info/book-info.dart';
import 'package:library/src/presentation/screens/ratings/ratings.dart';
import 'package:library/src/presentation/screens/authors/authors.dart';
import 'package:library/src/presentation/screens/author/author.dart';

enum RoutesNames {
  home,
  ratings,
  getPath,
  library,
  bookInfo,
  authors,
  author,
}

final pages = [
  GetPage(name: RoutesNames.home.toString(), page: () => Home()),
  GetPage(name: RoutesNames.ratings.toString(), page: () => Ratings()),
  GetPage(name: RoutesNames.getPath.toString(), page: () => GetPath()),
  GetPage(name: RoutesNames.library.toString(), page: () => Library()),
  GetPage(name: RoutesNames.bookInfo.toString(), page: () => BookInfo()),
  GetPage(name: RoutesNames.author.toString(), page: () => Author()),
  GetPage(name: RoutesNames.authors.toString(), page: () => Authors()),
];

class _AppRouter {
  Future<dynamic>? routeToNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  Future<dynamic>? routeToHome() {
    return routeToNamed(RoutesNames.home.toString());
  }

  Future<dynamic>? routeToRatings() {
    return routeToNamed(RoutesNames.ratings.toString());
  }

  Future<dynamic>? routeToGetPath() {
    return routeToNamed(RoutesNames.getPath.toString());
  }

  Future<dynamic>? routeToLibrary() {
    return routeToNamed(RoutesNames.library.toString());
  }

  Future<dynamic>? routeToBookInfo() {
    return routeToNamed(RoutesNames.bookInfo.toString());
  }

  Future<dynamic>? routeToAuthor() {
    return routeToNamed(RoutesNames.author.toString());
  }

  Future<dynamic>? routeToAuthors() {
    return routeToNamed(RoutesNames.authors.toString());
  }

  void goBack() {
    return Get.back();
  }
}

final router = _AppRouter();
