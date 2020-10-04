import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:library/src/repositories/repositories.dart';
import 'package:library/src/screens/library/library.dart';

import '../models/book-info-model.dart';

part 'bookinfo_event.dart';
part 'bookinfo_state.dart';

class BookinfoBloc extends Bloc<BookinfoEvent, BookinfoState> {
  final CalibreRepository _calibreRepository;

  BookinfoBloc(this._calibreRepository) : super(BookinfoInitial());

  @override
  Stream<BookinfoState> mapEventToState(
    BookinfoEvent event,
  ) async* {
    if (event is BookinfoEventLoadInfo) {
      var data = await _calibreRepository.loadBookInfo(event.id);
      print('data $data');
      if (data.isNotEmpty) {
        yield BookinfoLoadedFullInfo(data.single);
      } else {
        yield BookinfoLoadedEmptyInfo();
      }
    }
  }
}
