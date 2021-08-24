import './book.dart';

class BookInfoModel extends BookModel {
  final String? identType;
  final String identVal;
  final String description;
  final String? format;
  final String? seriesName;
  final int seriesId;
  final String? langCode;
  final List<BookInfoModel>? seriesBooks;
  final bool favorites;
  final bool read;

  static bool convertIntToBool(int? value) {
    if (value == null) {
      return false;
    }
    if (value == 1) {
      return true;
    }
    return false;
  }

  BookInfoModel.fromMap(Map<String, dynamic> bookData)
      : identType = bookData['identType'] as String,
        identVal = bookData['identVal'] as String,
        description = bookData['description'] as String,
        format = bookData['format'] as String,
        seriesName = bookData['seriesName'] as String,
        seriesId = bookData['seriesId'] as int,
        seriesBooks = bookData['seriesBooks'] as List<BookInfoModel>,
        langCode = bookData['langCode'] as String,
        favorites = convertIntToBool(bookData['favorites'] as int),
        read = convertIntToBool(bookData['read'] as int),
        super.fromMap(bookData);

  @override
  List<Object?> get props => [
        ...super.props,
        identType,
        identVal,
        description,
        format,
        seriesName,
        seriesId,
        langCode,
        seriesBooks,
        favorites,
        read
      ];

  @override
  String toString() {
    return '${super.toString()} : bookId - $bookId, title - $title, read - $read, favorites = $favorites';
  }
}
