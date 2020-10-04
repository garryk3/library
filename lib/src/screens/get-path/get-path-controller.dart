import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import 'package:library/src/components/error/index.dart';
import 'package:library/src/components/app/bloc/app_bloc.dart';
import 'package:library/src/services/service-locator.dart';

class GetPathController {
  final DbProvider _dbProvider = getService<DbProvider>();

  void openFileSystem(BuildContext context) async {
    try {
      final path = await FilePicker.platform.getDirectoryPath();
      if (path == null) {
        return;
      }
      await _savePath(path, context);
      BlocProvider.of<AppBloc>(context).add(AppEventChangeState(
        path: path,
        isCalibreExist: _dbProvider.isCalibreExist,
      ));
    } catch (error) {
      BlocProvider.of<ErrorBloc>(context).add(ErrorEventShow(error.message));
    }
  }

  Future<void> _savePath(String path, BuildContext context) async {
    var hasConnected = BlocProvider.of<AppBloc>(context).state.isCalibreExist;
    await _dbProvider.writePathToCalibreFolder(path);
    await _dbProvider.reattachCalibre(hasConnected);
  }
}
