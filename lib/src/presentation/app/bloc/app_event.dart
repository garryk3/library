part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppEventChangeState extends AppEvent {
  final String path;
  final bool isCalibreExist;
  const AppEventChangeState({@required this.path, @required this.isCalibreExist});

  @override
  List<Object> get props => [path, isCalibreExist];
}

class AppEventInitialize extends AppEvent {
  const AppEventInitialize();

  @override
  List<Object> get props => [];
}
