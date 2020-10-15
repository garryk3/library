import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  AuthorsBloc() : super(AuthorsInitial());

  @override
  Stream<AuthorsState> mapEventToState(
    AuthorsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
