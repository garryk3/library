import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:library/src/components/app/app.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:library/src/repositories/repositories.dart';

import '../book-info.dart';

part 'bookinfo_event.dart';
part 'bookinfo_state.dart';

class BookinfoBloc extends Bloc<BookinfoEvent, BookinfoState> {
  final CalibreRepository _calibreRepository;
  final AppDbRepository _appDbRepository;

  BookinfoBloc(this._calibreRepository, this._appDbRepository) : super(BookinfoInitial());

  @override
  Stream<BookinfoState> mapEventToState(
    BookinfoEvent event,
  ) async* {
    if (event is BookinfoEventLoadInfo) {
      var data = await _calibreRepository.loadBookInfo(event.id);
      if (data != null) {
        var bookSavedInfo = await _appDbRepository.loadBookSavedInfoById(event.id);
        if (bookSavedInfo != null) {
          data.addAll(bookSavedInfo);
        }
        yield BookinfoStateLoadedFull(model: BookInfoModel.fromMap(data));
      } else {
        yield BookinfoStateLoadedEmpty();
      }
    }
  }
}
