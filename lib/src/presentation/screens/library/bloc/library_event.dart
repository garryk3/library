part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

@immutable
class LibraryEventLoadData extends LibraryEvent {}

@immutable
class LibraryEventResetFilters extends LibraryEvent {}

@immutable
class LibraryEventSetFilter extends LibraryEvent {}
