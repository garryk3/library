part of 'sql.dart';

// inserts and updates

const String insertCalibrePath = '''
  INSERT into $tableAppSettings(name, path) VALUES(?, ?)
''';
