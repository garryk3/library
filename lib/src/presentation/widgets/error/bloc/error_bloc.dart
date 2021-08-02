import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorStateEmpty());

  @override
  Stream<ErrorState> mapEventToState(
    ErrorEvent event,
  ) async* {
    if (event is ErrorEventShow) {
      yield ErrorStateActive(event.message);
      await Future.delayed(Duration(seconds: 5));
      yield ErrorStateEmpty();
    } else if (event is ErrorEventHide) {
      yield ErrorStateEmpty();
    }
  }
}
