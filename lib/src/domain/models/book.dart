import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String coverFileName = 'cover.jpg';
  final int bookId;
  final int authorId;
  final String title;
  final String path; // путь к обложке
  final int hasCover; // 1 or 0
  final String author;
  final String lang;
  final String tags;
  final int rating;

  BookModel.fromMap(Map<String, dynamic> bookData)
      : tags = bookData['tags'] as String,
        lang = bookData['lang'] as String,
        authorId = bookData['authorId'] as int,
        bookId = bookData['bookId'] as int,
        title = bookData['title'] as String,
        path = bookData['path'] as String,
        hasCover = bookData['hasCover'] as int,
        author = bookData['author'] as String,
        rating = bookData['rating'] as int;

  @override
  List<Object> get props => [title, path, hasCover, author, tags, lang, authorId, bookId, coverFileName];
}
