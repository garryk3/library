import 'package:get/get.dart';

import 'package:library/src/data/services/services.dart';
import 'package:library/src/domain/repositories/repositories.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class DIContainer {
  void init() {
    print('starting services ...');

    // services
    Get.put<IDatabase>(DbService(), permanent: true);
    // repositories
    Get.put<IDbRepository>(CalibreRepository(), permanent: true);

    print('All services started...');
  }
}
