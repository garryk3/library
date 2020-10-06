import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:library/src/screens/library/library.dart';
import 'package:library/src/services/service-locator.dart';
import 'package:library/src/ui/heading/heading.dart';

import 'bloc/bookinfo_bloc.dart';

export 'bloc/bookinfo_bloc.dart';

part 'models/book-info-model.dart';
part 'widgets/slider.dart';
part 'widgets/top-part.dart';
part 'widgets/action-buttons.dart';

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
            final screenWidth = MediaQuery.of(context).size.width;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(
                    title: _model.title,
                  ),
                  BookinfoTopPart(_model),
                  Container(
                    width: screenWidth / 2 - 30.0,
                    child: OutlineButton(
                      child: Text('Читать'),
                      onPressed: () {
                        print('press read');
                      },
                    ),
                  ),
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
                  Text(
                    _model.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5, // refactor
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  if (_model.seriesName != null)
                    Text(
                      'Серия: ${_model.seriesName}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0),
                    ),
                  if (_model.seriesName != null && _model.seriesBooks == null)
                    Text(
                      'Другие книги серии в библиотеке не найдены',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0),
                    ),
                  if (_model.seriesBooks != null) BookInfoSlider(_model.seriesBooks)
                ],
              ),
            );
          }
          return Text('loading...');
        },
      ),
    );
  }
}
