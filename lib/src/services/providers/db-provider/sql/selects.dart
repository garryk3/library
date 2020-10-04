part of 'sql.dart';

const String selectDbPath = '''
  SELECT name, path FROM $tableAppSettings WHERE name='$calibreColumnName'
''';

const String selectCalibreBooks = '''
  SELECT 
	group_concat($tableCalibreTags.name) as tags, 
	$tableCalibreLang.lang_code as lang, 
	$tableCalibreAuthors.id as authorId, 
	title, 
	$tableCalibreBooks.id as bookId, 
	author_sort as author, 
	path, 
	has_cover as hasCover,
  $tableCalibreRatings.rating
	FROM $tableCalibreBooks
		LEFT JOIN $tableCalibreAuthors ON $tableCalibreAuthors.sort = $tableCalibreBooks.author_sort
		LEFT JOIN $tableCalibreBooksLangLinks ON $tableCalibreBooksLangLinks.book = $tableCalibreBooks.id 
		LEFT JOIN $tableCalibreLang ON $tableCalibreLang.id = $tableCalibreBooksLangLinks.lang_code
		LEFT JOIN $tableCalibreBooksTagsLink ON $tableCalibreBooksTagsLink.book = $tableCalibreBooks.id
		LEFT JOIN tags ON $tableCalibreBooksTagsLink.tag = $tableCalibreTags.id
    LEFT JOIN $tableCalibreBooksRatingsLink ON $tableCalibreBooks.id = $tableCalibreBooksRatingsLink.book
	  LEFT JOIN $tableCalibreRatings ON $tableCalibreBooksRatingsLink.rating = $tableCalibreRatings.id
		
	GROUP BY $tableCalibreBooks.title
  ORDER by $tableCalibreRatings.rating DESC
''';

const String selectRaitings = '''
SELECT title, ratings.rating from $tableCalibreBooks 
	JOIN $tableCalibreBooksRatingsLink ON $tableCalibreBooks.id = $tableCalibreBooksRatingsLink.book
	JOIN $tableCalibreRatings ON $tableCalibreBooksRatingsLink.rating = $tableCalibreRatings.id
''';

const String selectCalibreBookInfo = '''
  SELECT 
	group_concat($tableCalibreTags.name) as tags, 
	$tableCalibreLang.lang_code as lang, 
	$tableCalibreAuthors.id as authorId, 
	title, 
	$tableCalibreBooks.id as bookId, 
	author_sort as author, 
	path, 
	has_cover as hasCover,
  $tableCalibreRatings.rating
	FROM $tableCalibreBooks
		LEFT JOIN $tableCalibreAuthors ON $tableCalibreAuthors.sort = $tableCalibreBooks.author_sort
		LEFT JOIN $tableCalibreBooksLangLinks ON $tableCalibreBooksLangLinks.book = $tableCalibreBooks.id 
		LEFT JOIN $tableCalibreLang ON $tableCalibreLang.id = $tableCalibreBooksLangLinks.lang_code
		LEFT JOIN $tableCalibreBooksTagsLink ON $tableCalibreBooksTagsLink.book = $tableCalibreBooks.id
		LEFT JOIN tags ON $tableCalibreBooksTagsLink.tag = $tableCalibreTags.id
    LEFT JOIN $tableCalibreBooksRatingsLink ON $tableCalibreBooks.id = $tableCalibreBooksRatingsLink.book
	  LEFT JOIN $tableCalibreRatings ON $tableCalibreBooksRatingsLink.rating = $tableCalibreRatings.id
		
	WHERE $tableCalibreBooks.id = ?
''';
