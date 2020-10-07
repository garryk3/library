part of 'sql.dart';

const String createTableSettings = '''
  CREATE TABLE IF NOT EXISTS $tableAppSettings (
    key varchar(30) NOT NULL PRIMARY KEY UNIQUE,   
    value varchar(100)
  )
''';

const String createTableBooks = '''
  CREATE TABLE IF NOT EXISTS $tableAppBooks (
    id NOT NULL PRIMARY KEY UNIQUE,   
    read int,   
    favorites int
  )
''';

const String attachDb = '''
  ATTACH DATABASE ? AS $calibreDbName;
''';

const String detachDb = '''
  DETACH DATABASE $calibreDbName;
''';

const String dropTableSettings = '''
  DROP TABLE IF EXISTS $tableAppSettings
''';

const String dropTableBooks = '''
  DROP TABLE IF EXISTS $tableAppBooks
''';
