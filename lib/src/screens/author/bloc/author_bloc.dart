import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  AuthorBloc() : super(AuthorInitial());

  @override
  Stream<AuthorState> mapEventToState(
    AuthorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
