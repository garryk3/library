import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:library/src/presentation/widgets/heading/heading.dart';

/// отвечает за отображение списка последних открытыx книг
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var style = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      child: SizedBox.expand(
        child: Column(
          children: [
            Heading(
              title: 'Последние книги',
            ),
            Container(
              height: screenHeight / 2,
              width: double.infinity,
              color: Colors.grey,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Icon(Icons.book_rounded),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: RichText(
                      strutStyle: StrutStyle.disabled,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: style.bodyText1,
                          text:
                              '''bottom many many text bottom many many text bottom many many text bottom many many text,
                              bottom many many text bottom many many text bottom many many text bottom many many text,
                              bottom many many text bottom many many text bottom many many text bottom many many text,
                            '''),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
