import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/presentation/app/app.dart';
import 'package:library/src/presentation/screens/get-path/get-path.controller.dart';
import 'package:library/src/presentation/widgets/typography/typography.dart';

class GetPathScreen extends StatelessWidget {
  final _controller = GetPathController();

  GetPathScreen({Key? key}) : super(key: key);

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
              onTap: _controller.getCalibreFolderPath,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Icon(
                      Icons.file_download,
                      size: 50,
                    ),
                  ),
                  Obx(
                    () {
                      final text = _controller.directoryPath != ''
                          ? 'Путь к базе данных: ${_controller.directoryPath}'
                          : 'Укажите путь к базе данных Calibre';
                      return BaseText(text: text);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Obx(
                () {
                  if (_controller.directoryPath == '') {
                    return BaseText.warning(text: '---');
                  }
                  return Column(
                    children: [
                      if (!_controller.isCalibreConnected.value)
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: BaseText.warning(
                            text: 'Файл metadata.db в указанной папке отсутствует!',
                            children: [
                              TextSpan(text: 'Часть функций приложения будет недоступна!'),
                            ],
                          ),
                        ),
                      SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: TextButton(
                          onPressed: router.routeToHome,
                          child: BaseText.link(
                            text: 'Перейти на главную',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
