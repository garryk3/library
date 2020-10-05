part of '../book-info.dart';

class BookInfoModel extends BookModel {
  BookInfoModel.fromMap(Map<String, dynamic> bookData): super.fromMap(bookData);

  @override
  List<Object> get props => [...super.props];
}
