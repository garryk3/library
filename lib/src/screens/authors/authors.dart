import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:library/src/screens/authors/bloc/authors_bloc.dart';

import 'package:library/src/ui/heading/heading.dart';

export 'bloc/authors_bloc.dart';

class Authors extends StatelessWidget {
  const Authors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Heading(title: 'Авторы'),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 40.0,
            child: Text('filters'),
          ),
          BlocBuilder<AuthorsBloc, AuthorsState>(
            builder: (context, state) {
              if (state is AuthorsStateLoaded) {
                return ListView.builder(
                  itemCount: state.authorsGroupedByLetterList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${state.authorsGroupedByLetterList[index]}'),
                    );
                  },
                );
              }
              return Text('loading');
            },
          )
        ],
      ),
    );
  }
}
