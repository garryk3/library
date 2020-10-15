part of 'authors_bloc.dart';

abstract class AuthorsState extends Equatable {
  const AuthorsState();
  
  @override
  List<Object> get props => [];
}

class AuthorsInitial extends AuthorsState {}
