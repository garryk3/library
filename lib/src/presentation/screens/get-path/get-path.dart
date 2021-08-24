import 'package:flutter/material.dart';

// import 'package:library/src/components/app/app.dart';
// import 'package:library/src/screens/get-path/get-path-controller.dart';

class GetPath extends StatelessWidget {
  GetPath({Key? key}) : super(key: key);
  // final _controller = GetPathController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
          height: 300,
          width: width * 0.8,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  //  _controller.openFileSystem(context);
                },
                child: Column(
                  children: [
                    Icon(Icons.file_download),
                    // BlocBuilder<AppBloc, AppState>(
                    //   builder: (BuildContext context, state) {
                    //     var headerInfo = state.pathToCalibre == null
                    //         ? 'Укажите путь к папке с библиотекой Calibre'
                    //         : 'Текущий путь к папке с библиотекой Calibre';
                    //     return Text(
                    //       headerInfo,
                    //       textAlign: TextAlign.center,
                    //     );
                    //   },
                    // ),
                    Text(
                      'headerInfo',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                // child: BlocBuilder<AppBloc, AppState>(
                //   builder: (BuildContext context, state) {
                //     var style = const TextStyle(
                //         color: Colors.black54,
                //         fontSize: 13.0,
                //         fontStyle: FontStyle.italic,
                //         decoration: TextDecoration.underline);

                //     if (state.pathToCalibre == null) {
                //       return Text('---', style: style);
                //     }
                //     return Column(
                //       children: [
                //         Text(state.pathToCalibre, style: style),
                //         if (!state.isCalibreExist)
                //           Padding(
                //             padding: EdgeInsets.all(12.0),
                //             child: Text('Файл metadata.db в указанной папке отсутствует!!!', style: style),
                //           ),
                //         SizedBox(
                //           width: double.infinity,
                //           height: 40.0,
                //           child: FlatButton(
                //               color: Colors.blue,
                //               onPressed: () {
                //                 AppRouter.goTo(context, Routes.home);
                //               },
                //               child: Text('Перейти на главную')),
                //         ),
                //       ],
                //     );
                //   },
                // ),
                child: Text('Перейти на главную'),
              ),
            ],
          )),
    );
  }
}
