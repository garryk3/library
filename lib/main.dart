import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sentry/sentry.dart';

import 'package:library/src/components/app/app.dart';
import 'package:library/src/services/service-locator.dart';
import 'package:library/src/configs/configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices(configs);

  final sentry = SentryClient(dsn: configs['sentry']['key']);

  runZonedGuarded(
    () => runApp(LibraryApp()),
    (error, stackTrace) async {
      await sentry.captureException(
        exception: error,
        stackTrace: stackTrace,
      );
    },
  );
}
