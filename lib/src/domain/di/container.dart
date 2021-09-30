import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:library/src/data/providers/providers.dart';
import 'package:library/src/data/services/services.dart';
import 'package:library/src/domain/repositories/repositories.dart';
import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class DIContainer {
  Future<void> init() async {
    print('starting services ...');

    // services
    await Get.putAsync<IDatabase>(() async {
      var service = DbService();
      await service.initialize();
      return service;
    }, permanent: true);
    Get.put(
      Logger(
        printer: PrettyPrinter(
          printEmojis: true,
          colors: true,
        ),
      ),
      permanent: true,
    );

    // providers
    Get.put<ICalibreProvider>(CalibreProvider(), permanent: true);

    // repositories
    Get.put<IDbRepository>(CalibreRepository(), permanent: true);

    print('All services started...');
  }
}
