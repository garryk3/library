import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final List<InlineSpan>? children;
  final TextStyle? style;

  const BaseText({
    required this.text,
    this.children,
    this.style,
  });

  BaseText.warning({
    required this.text,
    this.children,
    TextStyle? style,
  }) : style = (style ?? TextStyle(color: Colors.amber)).copyWith(color: Colors.redAccent);

  BaseText.link({
    required this.text,
    this.children,
    TextStyle? style,
  }) : style = (style ?? TextStyle(color: Colors.amber)).copyWith(color: Colors.lightBlue[900]);

  @override
  Widget build(BuildContext context) {
    var finalStyle = Theme.of(context).textTheme.bodyText1?.merge(style);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: finalStyle,
        children: children,
      ),
    );
  }
}
