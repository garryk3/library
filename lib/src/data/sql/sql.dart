part 'tables.dart';
part 'inserts.dart';
part 'selects.dart';
part 'deletes.dart';

/// attached db calibre
const String calibreDbName = 'CalibreDb';

/// tables of app db
const String tableAppSettings = 'AppSettings';
const String tableAppBooks = 'BooksInfo';

/// tables of db Calibre
const String tableCalibreBooks = '$calibreDbName.books';
const String tableCalibreAuthors = '$calibreDbName.authors';
const String tableCalibreBooksLangLinks = '$calibreDbName.books_languages_link';
const String tableCalibreLang = '$calibreDbName.languages';
const String tableCalibreBooksTagsLink = '$calibreDbName.books_tags_link';
const String tableCalibreTags = '$calibreDbName.tags';
const String tableCalibreRatings = '$calibreDbName.ratings';
const String tableCalibreBooksRatingsLink = '$calibreDbName.books_ratings_link';
const String tableCalibreBooksSeriesLink = '$calibreDbName.books_series_link';
const String tableCalibreData = '$calibreDbName.data';
const String tableCalibreComments = '$calibreDbName.comments';
const String tableCalibreIdentifiers = '$calibreDbName.identifiers';
const String tableCalibreSeries = '$calibreDbName.series';

/// columns
const String calibreColumnName = 'calibre';

const String createAppTables = '''
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
