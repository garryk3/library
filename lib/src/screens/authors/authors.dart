import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:library/src/ui/heading/heading.dart';

export 'bloc/authors_bloc.dart';

part 'models/author-model.dart';

class Authors extends StatelessWidget {
  const Authors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Heading(title: 'Авторы'),
        ],
      ),
    );
  }
}
