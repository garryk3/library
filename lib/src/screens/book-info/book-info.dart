import 'package:flutter/material.dart';

import 'package:library/src/screens/library/library.dart';

export 'bloc/bookinfo_bloc.dart';

part 'models/book-info-model.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('book info'),
    );
  }
}
