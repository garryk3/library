import 'package:equatable/equatable.dart';

class AuthorModel extends Equatable {
  final int id;
  final String name;
  final String sort;

  AuthorModel.fromMap(Map<String, dynamic> authorData)
      : id = authorData['id'] as int,
        name = authorData['name'] as String,
        sort = authorData['name'] as String;

  @override
  List<Object> get props => [id, name, sort];
}
