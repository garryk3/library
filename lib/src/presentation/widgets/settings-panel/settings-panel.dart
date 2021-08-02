import 'package:flutter/material.dart';

import 'package:library/src/presentation/app/app.dart';

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({Key? key}) : super(key: key);
  final _mockDbAddress = 'mock address';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 80.0),
            children: <Widget>[
              SizedBox(
                height: 60.0,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Настройки', style: const TextStyle(color: Colors.white)),
                      Icon(
                        Icons.settings,
                        color: Colors.white.withOpacity(0.4),
                        size: 36.0,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: router.routeToGetPath,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Расположение базы данных Calibre: ',
                          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                        Text(_mockDbAddress, style: const TextStyle(fontSize: 12.0))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 24.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  label: Text('Обновить бд Calibre'),
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                ),
                TextButton.icon(
                  label: Text('Сохранить бд приложения'),
                  icon: Icon(Icons.save),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
