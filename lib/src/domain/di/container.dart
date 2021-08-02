import 'package:get/get.dart';

import 'package:library/src/data/services/services.dart';

class DIContainer {
  void init() {
    print('starting services ...');

    Get.put(DbService(), permanent: true);
    print('All services started...');
  }
}
