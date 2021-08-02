import 'package:flutter/material.dart';

import 'package:library/src/components/app/app.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () async {
          AppRouter.goTo(context, Routes.home);
        },
        child: Text('ratings'));
  }
}
