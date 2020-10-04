part of 'bookinfo_bloc.dart';

@immutable
abstract class BookinfoEvent extends Equatable {
  const BookinfoEvent();

  @override
  List<Object> get props => [];
}

class BookinfoEventLoadInfo extends BookinfoEvent {
  final int id;

  const BookinfoEventLoadInfo(this.id);

  @override
  List<Object> get props => [id];
}
