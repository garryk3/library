import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

import 'package:library/src/infrastructure/models/book-info.dart';
import 'package:library/src/presentation/widgets/typography/heading.dart';

part 'widgets/action-buttons.dart';
part 'widgets/slider.dart';
part 'widgets/top-part.dart';

class BookInfo extends StatelessWidget {
  BookInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      // child: BlocBuilder<BookinfoBloc, BookinfoState>(
      //   builder: (context, state) {
      //     if (state is BookinfoStateLoadedEmpty) {
      //       return Text('Ошибка, отсутствует информация о книге!');
      //     }
      //     if (state is BookinfoStateLoadedFull) {
      //       return Column(
      //         children: [
      //           Heading(title: state.model.title),
      //           Expanded(
      //             child: ListView(
      //               children: buildContentList(context, state.model),
      //             ),
      //           )
      //         ],
      //       );
      //     }
      //     return Text('loading...');
      //   },
      // ),
      child: Column(
        children: [
          Heading(title: 'title'), // test
          Expanded(
            child: ListView(
              children: buildContentList(context, BookInfoModel.fromMap({})), // test
            ),
          )
        ],
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
    final tags = _model.tags;

    return [
      BookinfoTopPart(_model),
      Container(
        width: screenWidth / 2 - 30.0,
        child: OutlinedButton(
          onPressed: () {
            print('press read');
          },
          child: Text('Читать'),
        ),
      ),
      buildTextLine(_model.author ?? ''),
      if (tags != null) buildTextLine(tags),
      buildTextLine(_model.description, maxLines: 5),
      if (_model.seriesName != null) buildTextLine('Серия: ${_model.seriesName}'),
      if (_model.seriesName != null && _model.seriesBooks == null)
        buildTextLine('Другие книги серии в библиотеке не найдены'),
      if (_model.seriesBooks != null) BookInfoSlider(_model.seriesBooks)
    ];
  }
}
