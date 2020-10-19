part of '../authors.dart';

class AuthorModel extends Equatable {
  final int id;
  final String name;

  AuthorModel.fromMap(Map<String, dynamic> authorData)
      : id = authorData['id'],
        name = authorData['name'];

  @override
  List<Object> get props => [id, name];
}
