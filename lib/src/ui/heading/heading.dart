import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.headline3;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: style.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
