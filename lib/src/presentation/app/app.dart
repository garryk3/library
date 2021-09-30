import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:library/src/domain/di/container.dart';
import 'package:library/src/presentation/app/app.router.dart';
import 'package:library/src/infrastructure/theme/theme.dart';
import 'package:library/src/infrastructure/constants/constants.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';

export 'app.router.dart';
export 'app.route.dart';

class App extends StatelessWidget {
  final _calibreDirectoryPath = GetStorage().read<String?>(DB_PATH_KEY);

  Future<bool> _initializeApp() async {
    await DIContainer().init();
    Get.changeTheme(AppTheme);
    await GetStorage.init();

    if (_calibreDirectoryPath != null) {
      var dbRepository = Get.find<IDbRepository>();
      await dbRepository.attachCalibreDb(_calibreDirectoryPath as String);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: _initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data != true) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: pages,
          initialRoute: _calibreDirectoryPath != null ? '/home' : '/get-path',
          routingCallback: router.onChangeRoute,
        );
      },
    );
  }
}
