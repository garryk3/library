import 'package:flutter/material.dart';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'package:library/src/screens/library/library.dart';
import 'package:library/src/services/service-locator.dart';
import 'package:library/src/ui/heading/heading.dart';

import 'bloc/bookinfo_bloc.dart';
import 'bloc/bookinfo_bloc.dart';

export 'bloc/bookinfo_bloc.dart';

part 'models/book-info-model.dart';

final _pathToCalibreFolder = getService<DbProvider>().calibreFolderPath;

class BookInfo extends StatelessWidget {
  BookInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<BookinfoBloc, BookinfoState>(
        builder: (context, state) {
          if (state is BookinfoStateLoadedEmpty) {
            return Text('Ошибка, отсутствует информация о книге!');
          }
          if (state is BookinfoStateLoadedFull) {
            final _model = state.model;
            final coverFile = File(join(
              _pathToCalibreFolder,
              _model.path,
              _model.coverFileName,
            ));
            final hasCover = _model.hasCover == 1 && coverFile.existsSync();
            return Container(
              child: Column(
                children: [
                  Heading(
                    title: _model.title,
                  ),
                  if (hasCover)
                    Image.file(
                      coverFile,
                      height: 100.0,
                    ),
                  if (!hasCover)
                    Icon(
                      Icons.book_outlined,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  Text('Рейтинг: ${(_model.rating ~/ 2).toString()}/5', style: const TextStyle(color: Colors.white)),
                  Text(
                    _model.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                  if (_model.tags != null)
                    Text(
                      _model.tags,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0),
                    ),
                ],
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
