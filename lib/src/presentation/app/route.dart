import 'package:flutter/material.dart';

import 'package:library/src/presentation/widgets/menu/menu.dart';
import 'package:library/src/presentation/widgets/app-bar/app-bar.dart';
import 'package:library/src/presentation/widgets/settings-panel/settings-panel.dart';

class AppRoute extends StatelessWidget {
  final Widget child;

  AppRoute({Key? key, required Widget child}) : child = child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TopAppBar(),
        drawer: Drawer(
          child: Menu(),
        ),
        endDrawer: Drawer(
          child: SettingsPanel(),
        ),
        body: child,
      ),
    );
  }
}
