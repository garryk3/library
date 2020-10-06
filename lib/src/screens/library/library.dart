import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:library/src/ui/heading/heading.dart';
import 'package:library/src/services/service-locator.dart';

import 'bloc/library_bloc.dart';

part 'widgets/book.dart';
part 'models/book-model.dart';

class Library extends StatelessWidget {
  const Library({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Heading(
            title: 'Библиотека',
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 40.0,
            child: Text('filters'),
          ),
          Expanded(child: BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              if (state is LibraryStateDataLoaded) {
                final bloc = BlocProvider.of<LibraryBloc>(context);

                return GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.total,
                    itemBuilder: (BuildContext context, int index) {
                      final model = state.books[index];
                      return GestureDetector(
                        onTap: () {
                          bloc.goToBookInfo(context, model.bookId);
                        },
                        child: Book(model),
                      );
                    });
              }
              return Text('loading...');
            },
          ))
        ],
      ),
    );
  }
}
