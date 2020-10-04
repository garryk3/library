part of '../library.dart';

class BookModel extends Equatable {
  final int bookId;
  final int authorId;
  final String title;
  final String path; // путь к обложке
  final int hasCover; // 1 or 0
  final String author;
  final String lang;
  final String tags;
  final int rating;

  const BookModel({
    @required this.bookId,
    @required this.authorId,
    @required this.title,
    @required this.path,
    @required this.hasCover,
    @required this.author,
    @required this.tags,
    @required this.lang,
    @required this.rating,
  });

  factory BookModel.fromMap(Map<String, dynamic> bookData) {
    return BookModel(
        tags: bookData['tags'],
        lang: bookData['lang'],
        authorId: bookData['authorId'],
        bookId: bookData['bookId'],
        title: bookData['title'],
        path: bookData['path'],
        hasCover: bookData['hasCover'],
        author: bookData['author'],
        rating: bookData['rating']);
  }

  @override
  List<Object> get props => [title, path, hasCover, author, tags, lang, authorId, bookId];
}

// {
//   id: 1,
//   title: Beginning C# 7 Programming With Visual Studio 2017,
//   sort: Beginning C# 7 Programming With Visual Studio 2017,
//   timestamp: 2020-01-03 10:11:42.040000+00:00,
//   pubdate: 2018-03-20 00:00:00+00:00,
//   series_index: 1.0,
//   author_sort: Perkins, Benjamin,
//   isbn: ,
//   lccn: ,
//   path: Benjamin Perkins/Beginning C# 7 Programming With Visu (1),
//   flags: 1,
//   uuid: 41b3c0b0-252f-4a14-982f-45b1a30aeb3d,
//   has_cover: 1,
//   last_modified: 2020-01-12 11:14:19.747000+00:00
// }
