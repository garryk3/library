part of 'sql.dart';

// // inserts and updates

// const String insertCalibrePath = '''
//   INSERT into $tableAppSettings(key, value) VALUES(?, ?)
// ''';

const String insertFavoriteBook = '''
  INSERT INTO $tableAppBooks(id, favorites) VALUES(?, ?)
    ON CONFLICT(id) DO UPDATE SET 
      favorites = excluded.favorites
''';

const String insertReadBook = '''
  INSERT INTO $tableAppBooks(id, read) VALUES(?, ?)
    ON CONFLICT(id) DO UPDATE SET 
      read = excluded.read
''';
