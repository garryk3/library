import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:library/src/ui/heading/heading.dart';

export 'bloc/author_bloc.dart';

class Author extends StatelessWidget {
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
                child: Heading(
                  title: 'author name author name author name author name author name author name',
                  textAlign: TextAlign.left,
                ),
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
        ],
      ),
    );
  }
}
