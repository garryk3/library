import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
export 'package:logger/logger.dart';

import 'package:library/src/services/providers/providers.dart';
import 'package:library/src/services/observers/event-observer.dart';

export 'package:library/src/services/providers/providers.dart';

final logger = Logger(
  printer: PrettyPrinter(
    printEmojis: true,
    colors: true,
  ),
);

final Set<dynamic> _container = {logger};

void initServices(networkConfig) {
  Bloc.observer = EventObserver(logger);
  initProviders(_container, networkConfig, logger);
}

void setService(dynamic service) {
  _container.add(service);
}

T getService<T>() {
  var values = _container.whereType<T>();
  if (values.isEmpty) {
    print('Error! Service with type $T not found!');
  }
  return values.single;
}
