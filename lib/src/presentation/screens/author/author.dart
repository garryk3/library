import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/presentation/widgets/typography/heading.dart';
import 'package:library/src/presentation/widgets/typography/text.dart';
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
                onTap: controller.onTapFavorite,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Obx(() {
                    return Icon(
                      Icons.favorite,
                      color: controller.isFavorite.value ? Colors.blueGrey : Colors.black12,
                    );
                  }),
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
                      Text('книг в базе ${controller.books.length}'),
                      Text('книг всего'),
                    ],
                  ),
                ),
                Obx(() {
                  if (controller.authorDescription.value.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0,
                      ),
                      child: Text(
                        controller.authorDescription.value,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }),
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
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Obx(() {
                                if (controller.books.isNotEmpty) {
                                  return ListView(
                                    children: controller.books.map((e) => BaseText(text: e.title ?? '')).toList(),
                                  );
                                }
                                return BaseText(text: 'Книги не найдены!');
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Obx(() {
                                if (controller.externalBooks.isNotEmpty) {
                                  return ListView(
                                    children: controller.books.map((e) => BaseText(text: e.title ?? '')).toList(),
                                  );
                                }
                                return BaseText(text: 'Книги не найдены!');
                              }),
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
