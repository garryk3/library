import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  const Heading({Key key, @required this.title, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.headline3;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.center,
          style: style.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
