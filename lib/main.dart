import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/domain/di/container.dart';
import 'package:library/src/presentation/app/router.dart';
import 'package:library/src/presentation/app/route.dart';
import 'package:library/src/presentation/screens/home/home.dart';
import 'package:library/src/infrastructure/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DIContainer().init();
  Get.changeTheme(AppTheme);

  runApp(GetMaterialApp(
    // initialRoute: '/',
    getPages: pages,
    home: AppRoute(
      child: Home(),
    ),
  ));
}
