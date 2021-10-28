import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/presentation/widgets/typography/heading.dart';
import 'package:library/src/presentation/screens/authors/authors.controller.dart';
import 'package:library/src/presentation/app/app.dart';

class Authors extends GetView<AuthorsController> {
  Authors({Key? key}) : super(key: key);

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
            child: Obx(() {
              var groupedAuthors = controller.groupedAuthors;
              if (groupedAuthors.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: groupedAuthors.length,
                itemBuilder: (context, index) {
                  var groupedData = groupedAuthors[index];
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
                            onTap: () {
                              router.routeToAuthor(author.id);
                            },
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
            }),
          )
        ],
      ),
    );
  }
}
