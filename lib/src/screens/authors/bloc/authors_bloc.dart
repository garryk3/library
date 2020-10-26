import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library/src/repositories/repositories.dart';
import 'package:library/src/models/author-model.dart';
import 'package:library/src/components/app/app.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final CalibreRepository _calibreRepository;

  AuthorsBloc(BuildContext context)
      : _calibreRepository = RepositoryProvider.of<CalibreRepository>(context),
        super(AuthorsInitial());

  Function loadAuthorInfo(BuildContext context) => () {
        AppRouter.goTo(context, Routes.author);
      };

  @override
  Stream<AuthorsState> mapEventToState(
    AuthorsEvent event,
  ) async* {
    if (event is AuthorsEventStarted) {
      var authors = await _calibreRepository.loadAuthors();
      yield AuthorsStateLoaded.groupedFromMap(authors);
    }
  }
}
