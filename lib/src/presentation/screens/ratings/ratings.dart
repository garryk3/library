import 'package:flutter/material.dart';

import 'package:library/src/presentation/app/router.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          child: ElevatedButton(
              onPressed: () async {
                await router.routeToHome();
              },
              child: Text('ratings')),
        ),
      ),
    );
  }
}
