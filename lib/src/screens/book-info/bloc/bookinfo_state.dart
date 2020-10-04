part of 'bookinfo_bloc.dart';

@immutable
abstract class BookinfoState extends Equatable {
  const BookinfoState();

  @override
  List<Object> get props => [];
}

class BookinfoInitial extends BookinfoState {}

class BookinfoLoadedFullInfo extends BookinfoState {}

class BookinfoLoadedEmptyInfo extends BookinfoState {
  const BookinfoLoadedEmptyInfo(BookInfoModel model);
}
