part of 'loader_bloc.dart';

@immutable
abstract class LoaderState extends Equatable {
  const LoaderState();

  @override
  List<Object> get props => [];
}

class LoaderStateShow extends LoaderState {
  const LoaderStateShow();
}

class LoaderStateHide extends LoaderState {
  const LoaderStateHide();
}
