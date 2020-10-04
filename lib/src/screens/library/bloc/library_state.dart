part of 'library_bloc.dart';

@immutable
abstract class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryStateDataLoaded extends LibraryState {
  final List<BookModel> books;
  final int total;

  const LibraryStateDataLoaded(this.books) : total = books.length;

  factory LibraryStateDataLoaded.parseDb(List<Map<String, dynamic>> dataList) {
    var books = dataList.map((bookData) => BookModel.fromMap(bookData)).toList();

    return LibraryStateDataLoaded(books);
  }

  @override
  List<Object> get props => [books, total];
}
