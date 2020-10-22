import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:library/src/repositories/repositories.dart';
import 'package:library/src/components/loader/loader.dart';

import '../book-info.dart';

part 'bookinfo_event.dart';
part 'bookinfo_state.dart';

class BookinfoBloc extends Bloc<BookinfoEvent, BookinfoState> {
  final CalibreRepository _calibreRepository;
  final AppDbRepository _appDbRepository;
  final LoaderBloc _loaderBloc;

  BookinfoBloc(this._calibreRepository, this._appDbRepository, this._loaderBloc) : super(BookinfoInitial());

  @override
  Stream<BookinfoState> mapEventToState(
    BookinfoEvent event,
  ) async* {
    if (event is BookinfoEventLoadInfo) {
      _loaderBloc.add(LoaderEventShow());
      yield BookinfoStateLoading();

      var data = await _calibreRepository.loadBookInfo(event.id);
      if (data != null) {
        var bookSavedInfo = await _appDbRepository.loadBookSavedInfoById(event.id);
        if (bookSavedInfo != null) {
          data.addAll(bookSavedInfo);
        }

        yield BookinfoStateLoadedFull(model: BookInfoModel.fromMap(data));
        WidgetsBinding.instance.addPostFrameCallback((_) => _loaderBloc.add(LoaderEventHide()));
      } else {
        // _loaderBloc.add(LoaderEventHide());
        yield BookinfoStateLoadedEmpty();
      }
    }
  }
}
