part of 'sql.dart';

const String deleteCalibrePath = '''
  DELETE FROM $tableAppSettings WHERE key = "$calibreColumnName"
''';
