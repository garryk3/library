import 'package:get/get.dart';

import 'package:library/src/presentation/screens/get-path/get-path.dart';
import 'package:library/src/presentation/screens/home/index.dart';
import 'package:library/src/presentation/screens/library/library.dart';
import 'package:library/src/presentation/screens/book-info/book-info.dart';
import 'package:library/src/presentation/screens/ratings/ratings.dart';
import 'package:library/src/presentation/screens/authors/authors.dart';
import 'package:library/src/presentation/screens/author/author.dart';

import 'package:library/src/presentation/app/route.dart';

final pages = [
  GetPage(
      name: '/home',
      page: () => AppRoute(
            child: Home(),
          )),
  GetPage(name: '/ratings', page: () => Ratings()),
  GetPage(name: '/get-path', page: () => GetPath()),
  GetPage(name: '/library', page: () => Library()),
  GetPage(name: '/book-info', page: () => BookInfo()),
  GetPage(name: '/author', page: () => Author()),
  GetPage(name: '/authors', page: () => Authors()),
];

class _AppRouter {
  Future<dynamic>? routeToNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  Future<dynamic>? routeToHome() {
    return routeToNamed('/home');
  }

  Future<dynamic>? routeToRatings() {
    return routeToNamed('/ratings');
  }

  Future<dynamic>? routeToGetPath() {
    return routeToNamed('/get-path');
  }

  Future<dynamic>? routeToLibrary() {
    return routeToNamed('/library');
  }

  Future<dynamic>? routeToBookInfo() {
    return routeToNamed('/book-info');
  }

  Future<dynamic>? routeToAuthor() {
    return routeToNamed('/author');
  }

  Future<dynamic>? routeToAuthors() {
    return routeToNamed('/authors');
  }

  void goBack() {
    return Get.back();
  }
}

final router = _AppRouter();
