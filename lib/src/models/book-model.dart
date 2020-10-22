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
      : tags = bookData['tags'],
        lang = bookData['lang'],
        authorId = bookData['authorId'],
        bookId = bookData['bookId'],
        title = bookData['title'],
        path = bookData['path'],
        hasCover = bookData['hasCover'],
        author = bookData['author'],
        rating = bookData['rating'];

  @override
  List<Object> get props => [title, path, hasCover, author, tags, lang, authorId, bookId, coverFileName];
}
