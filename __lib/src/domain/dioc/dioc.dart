import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:library/src/domain/providers/providers.dart';

void initializeProviders() async {
  await Get.putAsync(() => DbProvider().initialize());
}

void initializeRepositories() {}

void initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.put(Logger());
  await initializeProviders();
  initializeRepositories();
  print('All services started...');
}
