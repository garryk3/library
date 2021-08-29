import 'package:flutter/material.dart';
import 'package:library/src/presentation/app/router.dart';

class _MenuItem {
  final String title;
  final String to;
  const _MenuItem(this.title, this.to);
}

List<_MenuItem> _menuData = const [
  _MenuItem('Последние книги', '/home'),
  _MenuItem('Библиотека', '/library'),
  _MenuItem('Авторы', '/authors'),
  _MenuItem('Оценки', '/ratings'),
  _MenuItem('Избранное', '/favorites'),
  _MenuItem('Серии', '/series'),
  _MenuItem('Теги', '/tags'),
  _MenuItem('Жанры', '/genres'),
];

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 80.0),
            children: <Widget>[
              SizedBox(
                height: 80.0,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Меню',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.menu_book,
                        color: Colors.white.withOpacity(0.4),
                        size: 36.0,
                      )
                    ],
                  ),
                ),
              ),
              for (_MenuItem item in _menuData)
                ListTile(
                  title: Text(item.title),
                  onTap: () => router.routeToNamed(item.to.toString()),
                ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 24.0,
            child: TextButton.icon(
              label: Text('Login to GoodReads'),
              icon: Icon(Icons.login),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
