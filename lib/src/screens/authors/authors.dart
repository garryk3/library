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
          Expanded(
            child: BlocBuilder<AuthorsBloc, AuthorsState>(
              builder: (context, state) {
                var bloc = BlocProvider.of<AuthorsBloc>(context);

                if (state is AuthorsStateLoaded) {
                  return ListView.builder(
                    itemCount: state.authorsGroupedByLetterList.length,
                    itemBuilder: (context, index) {
                      var groupedData = state.authorsGroupedByLetterList[index];
                      var letter = groupedData.key;
                      var list = groupedData.value;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              letter.toUpperCase(),
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ),
                          for (var author in list)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: InkWell(
                                onTap: bloc.loadAuthorInfo(context),
                                child: Text(
                                  author.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                }
                return Text('loading');
              },
            ),
          )
        ],
      ),
    );
  }
}
