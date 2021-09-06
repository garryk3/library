import 'package:flutter/material.dart';

import 'package:library/src/presentation/widgets/typography/heading.dart';

class Authors extends StatelessWidget {
  const Authors({Key? key}) : super(key: key);

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
            // child: BlocBuilder<AuthorsBloc, AuthorsState>(
            //   builder: (context, state) {
            //     var bloc = BlocProvider.of<AuthorsBloc>(context);

            //     if (state is AuthorsStateLoaded) {
            //       return ListView.builder(
            //         itemCount: state.authorsGroupedByLetterList.length,
            //         itemBuilder: (context, index) {
            //           var groupedData = state.authorsGroupedByLetterList[index];
            //           var letter = groupedData.key;
            //           var list = groupedData.value;
            //           return Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.symmetric(vertical: 8.0),
            //                 child: Text(
            //                   letter.toUpperCase(),
            //                   style: const TextStyle(fontSize: 18.0),
            //                 ),
            //               ),
            //               for (var author in list)
            //                 Padding(
            //                   padding: EdgeInsets.symmetric(vertical: 4.0),
            //                   child: InkWell(
            //                     onTap: bloc.loadAuthorInfo(context),
            //                     child: Text(
            //                       author.name,
            //                       style: const TextStyle(
            //                         fontSize: 16.0,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //             ],
            //           );
            //         },
            //       );
            //     }
            //     return Text('loading');
            //   },
            // ),
            child: ListView.builder(
              // itemCount: state.authorsGroupedByLetterList.length,
              itemCount: 10, // test
              itemBuilder: (context, index) {
                // var groupedData = state.authorsGroupedByLetterList[index];
                // var letter = groupedData.key;
                // var list = groupedData.value;
                // test
                var letter = 'test';
                var list = [
                  {'name': 'testName'}
                ];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        letter.toUpperCase(),
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                    for (var _ in list)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: InkWell(
                          // onTap: bloc.loadAuthorInfo(context),
                          onTap: null,
                          child: Text(
                            // author.name,
                            'name',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
