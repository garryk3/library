import 'package:equatable/equatable.dart';

import 'package:library/src/infrastructure/models/author.dart';

class AuthorsModel extends Equatable {
  final List<MapEntry<String, List<AuthorModel>>> authorsGroupedByLetterList;

  const AuthorsModel(this.authorsGroupedByLetterList);

  factory AuthorsModel.groupedFromMap(List<Map<String, Object?>> data) {
    var groupedByLetterMap = <String, List<AuthorModel>>{};

    data.forEach((authorData) {
      var firstLetterOfName = (authorData['sort'] as String).substring(0, 1).toLowerCase();
      if (!groupedByLetterMap.containsKey(firstLetterOfName)) {
        groupedByLetterMap[firstLetterOfName] = [];
      }
      groupedByLetterMap[firstLetterOfName]?.add(AuthorModel.fromMap(authorData));
    });
    groupedByLetterMap.forEach((key, value) {
      value.sort((a, b) => a.name.compareTo(b.name));
    });
    var groupedByLetterList = groupedByLetterMap.entries.toList();
    groupedByLetterList.sort((a, b) => a.key.compareTo(b.key));

    return AuthorsModel(groupedByLetterList);
  }

  @override
  List<Object?> get props => [authorsGroupedByLetterList];
}
