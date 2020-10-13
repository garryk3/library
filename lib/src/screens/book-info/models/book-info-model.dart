part of '../book-info.dart';

class BookInfoModel extends BookModel {
  final String identType;
  final String identVal;
  final String description;
  final String format;
  final String seriesName;
  final int seriesId;
  final String langCode;
  final List<BookInfoModel> seriesBooks;
  final bool favorites;
  final bool read;

  static bool convertIntToBool(int value) {
    if (value == null) {
      return false;
    }
    if (value == 1) {
      return true;
    }
    return false;
  }

  BookInfoModel.fromMap(Map<String, dynamic> bookData)
      : identType = bookData['identType'],
        identVal = bookData['identVal'],
        description = bookData['description'],
        format = bookData['format'],
        seriesName = bookData['seriesName'],
        seriesId = bookData['seriesId'],
        seriesBooks = bookData['seriesBooks'],
        langCode = bookData['langCode'],
        favorites = convertIntToBool(bookData['favorites']),
        read = convertIntToBool(bookData['read']),
        super.fromMap(bookData);

  @override
  List<Object> get props => [
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
