part of 'authors_bloc.dart';

abstract class AuthorsState extends Equatable {
  const AuthorsState();

  @override
  List<Object> get props => [];
}

class AuthorsInitial extends AuthorsState {}

class AuthorsStateLoaded extends AuthorsState {
  final List<MapEntry<String, List<AuthorModel>>> authorsGroupedByLetterList;

  const AuthorsStateLoaded(this.authorsGroupedByLetterList);

  factory AuthorsStateLoaded.groupedFromMap(List<Map<String, dynamic>> data) {
    var groupedByLetterList = <String, List<AuthorModel>>{};

    data.forEach((authorData) {
      var firstLetterOfName = (authorData['sort'] as String).substring(0, 1).toLowerCase();
      if (!groupedByLetterList.containsKey(firstLetterOfName)) {
        groupedByLetterList[firstLetterOfName] = [];
      }
      groupedByLetterList[firstLetterOfName].add(AuthorModel.fromMap(authorData));

      return AuthorModel.fromMap(authorData);
    });
    groupedByLetterList.forEach((key, value) {
      value.sort((a, b) => a.name.compareTo(b.name));
    });

    return AuthorsStateLoaded(groupedByLetterList.entries.toList());
  }
}
