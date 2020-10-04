part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  final String pathToCalibre;
  final bool isCalibreExist;
  const AppState({this.pathToCalibre, this.isCalibreExist});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '${super.toString()} with params: { pathToCalibre: $pathToCalibre, isCalibreExist: $isCalibreExist }';
  }
}

class AppInitial extends AppState {
  const AppInitial() : super(pathToCalibre: null, isCalibreExist: false);

  @override
  List<Object> get props => [pathToCalibre, isCalibreExist];
}

class AppStateWithPath extends AppState {
  const AppStateWithPath(pathToCalibre, isCalibreExist) : super(pathToCalibre: pathToCalibre, isCalibreExist: isCalibreExist);

  @override
  List<Object> get props => [pathToCalibre, isCalibreExist];
}
