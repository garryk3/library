import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:library/src/domain/di/container.dart';
import 'package:library/src/presentation/app/app.router.dart';
import 'package:library/src/infrastructure/theme/theme.dart';

void main() async {
  DIContainer().init();
  Get.changeTheme(AppTheme);
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: '/',
      routingCallback: router.onChangeRoute,
    ),
  );
}
