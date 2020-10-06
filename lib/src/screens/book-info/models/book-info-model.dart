part of '../book-info.dart';

class BookInfoModel extends BookModel {
  final String identType;
  final String identVal;
  final String description;
  final String format;
  final String seriesName;
  final int seriesId;
  final List<BookInfoModel> seriesBooks;

  BookInfoModel.fromMap(Map<String, dynamic> bookData)
      : identType = bookData['identType'],
        identVal = bookData['identVal'],
        description = bookData['description'],
        format = bookData['format'],
        seriesName = bookData['seriesName'],
        seriesId = bookData['seriesId'],
        seriesBooks = bookData['seriesBooks'],
        super.fromMap(bookData);

  @override
  List<Object> get props => [...super.props];
}
