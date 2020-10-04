part of 'sql.dart';

const String createTables = '''
  CREATE TABLE IF NOT EXISTS `$tableAppSettings` (
    name varchar(30) NOT NULL PRIMARY KEY UNIQUE,   
    path varchar(100)
  )
''';

const String attachDb = '''
  ATTACH DATABASE ? AS $calibreDbName;
''';

const String detachDb = '''
  DETACH DATABASE $calibreDbName;
''';