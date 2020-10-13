part of 'bookinfo_bloc.dart';

@immutable
abstract class BookinfoState extends Equatable {
  const BookinfoState();

  @override
  List<Object> get props => [];
}

class BookinfoInitial extends BookinfoState {}

class BookinfoStateLoading extends BookinfoState {}

class BookinfoStateLoadedFull extends BookinfoState {
  final BookInfoModel model;
  const BookinfoStateLoadedFull({this.model});

  @override
  List<Object> get props => [model];
}

class BookinfoStateLoadedEmpty extends BookinfoState {}
