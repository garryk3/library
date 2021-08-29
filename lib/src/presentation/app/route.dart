import 'package:flutter/material.dart';

import 'package:library/src/presentation/widgets/app-bar/app-bar.dart';

class AppRoute extends StatelessWidget {
  final Widget child;

  AppRoute({Key? key, required Widget child}) : child = child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: child,
    );
  }
}
