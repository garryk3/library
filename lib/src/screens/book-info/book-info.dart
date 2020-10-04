import 'package:flutter/material.dart';

export 'bloc/bookinfo_bloc.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('book info'),
    );
  }
}
