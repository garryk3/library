import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderStateHide());

  @override
  Stream<LoaderState> mapEventToState(
    LoaderEvent event,
  ) async* {
    if (event is LoaderEventShow) {
      yield LoaderStateShow();
    }
    if (event is LoaderEventHide) {
      yield LoaderStateHide();
    }
  }
}
