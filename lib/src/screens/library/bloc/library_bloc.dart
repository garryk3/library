import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library/src/components/app/app.dart';
import 'package:library/src/repositories/repositories.dart';
import 'package:library/src/screens/book-info/book-info.dart';

import '../library.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final CalibreRepository _calibreRepository;
  final BookinfoBloc _bookinfoBloc;

  LibraryBloc(BuildContext context)
      : _calibreRepository = RepositoryProvider.of<CalibreRepository>(context),
        _bookinfoBloc = BlocProvider.of<BookinfoBloc>(context),
        super(LibraryInitial());

  goToBookInfo(BuildContext context) {
    AppRouter.goTo(context, Routes.bookInfo);
  }

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    if (event is LibraryEventLoadData) {
      var books = await _calibreRepository.loadBooks();
      yield LibraryStateDataLoaded.parseDb(books);
    }
  }
}
