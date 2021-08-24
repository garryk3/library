import 'package:equatable/equatable.dart';

class AuthorModel extends Equatable {
  final int id;
  final String name;

  AuthorModel.fromMap(Map<String, dynamic> authorData)
      : id = authorData['id'] as int,
        name = authorData['name'] as String;

  @override
  List<Object> get props => [id, name];
}
