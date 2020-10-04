import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:logger/logger.dart';

import 'package:library/src/services/providers/db-provider/sql/sql.dart';
export 'package:library/src/services/providers/db-provider/sql/sql.dart';

part 'db-provider/db-commands.dart';
part 'db-provider/db-provider.dart';
part 'i-provider.dart';
part 'good-reads-provider.dart';
part 'rest-provider.dart';

void initProviders(Set<dynamic> container, Map<String, dynamic> networkConfig, Logger logger) {
  container.addAll([
    DbProvider(logger),
    RestProvider(),
    GoodReadsProvider(networkConfig['goodReads']),
  ]);
}
