part of 'sql.dart';

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
		LEFT JOIN $tableCalibreTags ON $tableCalibreBooksTagsLink.tag = $tableCalibreTags.id
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
    $tableCalibreLang.lang_code as langCode,
    $tableCalibreAuthors.id as authorId,
    title,
    $tableCalibreBooks.id as bookId,
    author_sort as author,
    path,
    has_cover as hasCover,
    $tableCalibreRatings.rating,
    $tableCalibreIdentifiers.type as identType,
    $tableCalibreIdentifiers.val as identVal,
    $tableCalibreComments.text as description,
    $tableCalibreData.format,
    $tableCalibreSeries.name as seriesName,
    $tableCalibreBooksSeriesLink.series as seriesId
	FROM $tableCalibreBooks
		LEFT JOIN $tableCalibreAuthors ON $tableCalibreAuthors.sort = $tableCalibreBooks.author_sort
		LEFT JOIN $tableCalibreBooksLangLinks ON $tableCalibreBooksLangLinks.book = $tableCalibreBooks.id
		LEFT JOIN $tableCalibreLang ON $tableCalibreLang.id = $tableCalibreBooksLangLinks.lang_code
		LEFT JOIN $tableCalibreBooksTagsLink ON $tableCalibreBooksTagsLink.book = $tableCalibreBooks.id
		LEFT JOIN $tableCalibreTags ON $tableCalibreBooksTagsLink.tag = $tableCalibreTags.id
    LEFT JOIN $tableCalibreBooksRatingsLink ON $tableCalibreBooks.id = $tableCalibreBooksRatingsLink.book
	  LEFT JOIN $tableCalibreRatings ON $tableCalibreBooksRatingsLink.rating = $tableCalibreRatings.id
		LEFT JOIN $tableCalibreIdentifiers ON $tableCalibreBooks.id = $tableCalibreIdentifiers.book
		LEFT JOIN $tableCalibreData ON $tableCalibreData.book = $tableCalibreBooks.id
		LEFT JOIN $tableCalibreComments ON $tableCalibreComments.book = $tableCalibreBooks.id
		LEFT JOIN $tableCalibreBooksSeriesLink ON $tableCalibreBooksSeriesLink.book = $tableCalibreBooks.id
		LEFT JOIN $tableCalibreSeries ON $tableCalibreSeries.id = $tableCalibreBooksSeriesLink.series
	WHERE $tableCalibreBooks.id = ?
''';

const String selectSeriesBooks = '''
SELECT id as bookId, title, has_cover as hasCover, path
	FROM $tableCalibreBooks
	WHERE $tableCalibreBooks.id in (
		SELECT $tableCalibreBooksSeriesLink.book
			FROM $tableCalibreBooksSeriesLink WHERE series = ? AND $tableCalibreBooksSeriesLink.book != ?
	)
''';

const selectBookSavedInfo = '''
  SELECT read, favorites
    FROM $tableAppBooks
    WHERE id = ?
''';

const selectAuthors = '''
  SELECT * FROM $tableCalibreAuthors
''';

const selectAuthorBooks = '''
  SELECT 
    $tableCalibreBooks.id as bookId, 
    title, 
    isbn, 
    has_cover as hasCover, 
    pubdate, 
    $tableCalibreBooksAuthorsLinks.author as authorId,
    rating
  FROM $tableCalibreBooksAuthorsLinks
    LEFT JOIN $tableCalibreBooks ON $tableCalibreBooksAuthorsLinks.book = $tableCalibreBooks.id
    LEFT JOIN $tableCalibreBooksRatingsLink on $tableCalibreBooksAuthorsLinks.book = $tableCalibreBooksRatingsLink.rating
  WHERE $tableCalibreBooksAuthorsLinks.author=?
  ORDER by $tableCalibreBooks.pubdate
''';
