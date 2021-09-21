import 'package:get/get.dart';

import 'package:library/src/presentation/screens/get-path/get-path.dart';
import 'package:library/src/presentation/screens/home/index.dart';
import 'package:library/src/presentation/screens/library/library.dart';
import 'package:library/src/presentation/screens/book-info/book-info.dart';
import 'package:library/src/presentation/screens/ratings/ratings.dart';
import 'package:library/src/presentation/screens/authors/authors.dart';
import 'package:library/src/presentation/screens/author/author.dart';

import 'package:library/src/presentation/app/app.route.dart';

final pages = [
  GetPage(name: '/', page: () => AppRoute(child: GetPathScreen())),
  GetPage(name: '/home', page: () => AppRoute(child: HomeScreen())),
  GetPage(name: '/ratings', page: () => AppRoute(child: Ratings())),
  GetPage(name: '/library', page: () => AppRoute(child: Library())),
  GetPage(name: '/book-info', page: () => AppRoute(child: BookInfo())),
  GetPage(name: '/author', page: () => AppRoute(child: Author())),
  GetPage(name: '/authors', page: () => AppRoute(child: Authors())),
];

class _AppRouter {
  Future<dynamic>? routeToNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  Future<dynamic>? routeToHome() {
    return routeToNamed('/home');
  }

  Future<dynamic>? routeOffToHome() {
    return Get.offNamed('/home');
  }

  Future<dynamic>? routeToRatings() {
    return routeToNamed('/ratings');
  }

  Future<dynamic>? routeToGetPath() {
    return routeToNamed('/');
  }

  Future<dynamic>? routeOffToGetPath() {
    return Get.offNamed('/');
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

  void onChangeRoute(Routing? routing) {
    if (routing?.current == '/') {}
    print('change $routing');
  }
}

final router = _AppRouter();
