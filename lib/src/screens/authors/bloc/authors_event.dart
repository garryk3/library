part of 'authors_bloc.dart';

abstract class AuthorsEvent extends Equatable {
  const AuthorsEvent();

  @override
  List<Object> get props => [];
}

class AuthorsEventStarted extends AuthorsEvent {}
