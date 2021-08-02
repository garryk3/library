part of 'author_bloc.dart';

abstract class AuthorState extends Equatable {
  const AuthorState();
  
  @override
  List<Object> get props => [];
}

class AuthorInitial extends AuthorState {}
