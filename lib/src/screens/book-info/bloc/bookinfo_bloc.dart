import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bookinfo_event.dart';
part 'bookinfo_state.dart';

class BookinfoBloc extends Bloc<BookinfoEvent, BookinfoState> {
  BookinfoBloc() : super(BookinfoInitial());

  @override
  Stream<BookinfoState> mapEventToState(
    BookinfoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
