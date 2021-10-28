import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/presentation/widgets/typography/heading.dart';
import 'package:library/src/presentation/screens/author/author.controller.dart';

final tabs = [
  'Книги из библиотеки',
  'Все книги',
];

class Author extends GetView<AuthorController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth - 40.0,
                child: Obx(() {
                  return Heading(
                    title: controller.author?.name ?? '',
                    textAlign: TextAlign.left,
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  print('like authir');
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 24.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('рейтинг'),
                      Text('отзывы'),
                      Text('книг в базе'),
                      Text('книг всего'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(
                      'author description author description author description author description author description author description'),
                ),
                DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 48.0,
                        child: AppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.black,
                          bottom: TabBar(
                            indicatorColor: Colors.white,
                            tabs: [
                              for (final tab in tabs) Tab(text: tab),
                            ],
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200.0),
                        child: TabBarView(
                          children: [
                            for (final tab in tabs)
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: ListView(
                                  children: [
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                    Text(tab),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
