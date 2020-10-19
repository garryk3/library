part of 'authors_bloc.dart';

abstract class AuthorsState extends Equatable {
  const AuthorsState();

  @override
  List<Object> get props => [];
}

class AuthorsInitial extends AuthorsState {}

class AuthorsStateLoaded extends AuthorsState {
  final List<AuthorModel> authors;

  const AuthorsStateLoaded(this.authors);

  factory AuthorsStateLoaded.fromMap(List<Map<String, dynamic>> data) {
    final parsedAuthors = data.map((authorData) => AuthorModel.fromMap(authorData));
    return AuthorsStateLoaded(parsedAuthors);
  }
}
