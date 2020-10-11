import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'package:library/src/repositories/repositories.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppDbRepository _appDbRepositoty;

  AppBloc(this._appDbRepositoty) : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppEventInitialize) {
      var startValues = await _appDbRepositoty.initializeDbAndLoadStartValues();

      yield AppStateWithPath.fromMap(startValues);
    }
    if (event is AppEventChangeState) {
      yield AppStateWithPath(event.path, event.isCalibreExist);
    }
  }

  @override
  String toString() {
    return 'app/bloc/app_bloc.dart';
  }
}
