import 'package:equatable/equatable.dart';

import 'package:library/src/infrastructure/models/author.dart';

class AuthorsModel extends Equatable {
  // final List<MapEntry<String, List<AuthorModel>>> authorsGroupedByLetterList;
  final List<AuthorModel> authorsList;
  // final Map<int, AuthorModel> authorsGroupedById;

  const AuthorsModel._init({
    required this.authorsList,
  });

  factory AuthorsModel.empty() {
    return AuthorsModel._init(authorsList: []);
  }

  factory AuthorsModel.fromMap(List<Map<String, Object?>> data) {
    return AuthorsModel._init(authorsList: makeModifiableResults(data));
  }

  AuthorModel getAuthorById(int id) {
    return authorsList.firstWhere((element) => element.id == id);
  }

  List<MapEntry<String, List<AuthorModel>>> getSortedByFirstLetterAuthorsList() {
    var groupedByLetterMap = <String, List<AuthorModel>>{};

    authorsList.forEach((authorModel) {
      var firstLetterOfName = authorModel.sort.substring(0, 1).toLowerCase();
      if (!groupedByLetterMap.containsKey(firstLetterOfName)) {
        groupedByLetterMap[firstLetterOfName] = [];
      }
      groupedByLetterMap[firstLetterOfName]?.add(authorModel);
    });
    groupedByLetterMap.forEach((key, value) {
      value.sort((a, b) => a.name.compareTo(b.name));
    });
    var groupedByLetterList = groupedByLetterMap.entries.toList();
    groupedByLetterList.sort((a, b) => a.key.compareTo(b.key));
    return groupedByLetterList;
  }

  static List<AuthorModel> makeModifiableResults(List<Map<String, dynamic>> results) {
    return List<AuthorModel>.generate(
      results.length,
      (index) => AuthorModel.fromMap(results[index]),
      growable: true,
    );
  }

  @override
  List<Object?> get props => [authorsList];
}
