import 'package:flutter/material.dart';
import 'dart:async';

import 'package:library/src/presentation/app/router.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) {
    Timer(Duration(seconds: 1), () {
      router.routeToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text('splash screen'),
      ),
    );
  }
}
