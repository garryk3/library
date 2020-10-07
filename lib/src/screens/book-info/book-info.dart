import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:library/src/screens/library/library.dart';
import 'package:library/src/services/service-locator.dart';
import 'package:library/src/ui/heading/heading.dart';
import 'package:library/src/repositories/repositories.dart';

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
            return Column(
              children: [
                Heading(title: state.model.title),
                Expanded(
                  child: ListView(
                    children: buildContentList(context, state.model),
                  ),
                )
              ],
            );
          }
          return Placeholder(
            fallbackHeight: 100,
            fallbackWidth: 100,
          );
        },
      ),
    );
  }

  Widget buildTextLine(String text, {int maxLines = 1}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 12.0),
    );
  }

  List<Widget> buildContentList(BuildContext context, BookInfoModel _model) {
    final screenWidth = MediaQuery.of(context).size.width;

    return [
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
      buildTextLine(_model.author),
      if (_model.tags != null) buildTextLine(_model.tags),
      buildTextLine(_model.description, maxLines: 5),
      if (_model.seriesName != null) buildTextLine('Серия: ${_model.seriesName}'),
      if (_model.seriesName != null && _model.seriesBooks == null)
        buildTextLine('Другие книги серии в библиотеке не найдены'),
      if (_model.seriesBooks != null) BookInfoSlider(_model.seriesBooks)
    ];
  }
}
