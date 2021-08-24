import 'package:flutter/material.dart';

import 'package:library/src/presentation/widgets/menu/menu.dart';
import 'package:library/src/presentation/widgets/app-bar/app-bar.dart';
import 'package:library/src/presentation/widgets/settings-panel/settings-panel.dart';

class AppRoute extends StatelessWidget {
  final Widget child;
  const AppRoute({Key? key, required this.child}) : super(key: key);

  Widget? _buildDevBtnClear(BuildContext context) {
    const isProduction = bool.fromEnvironment('dart.vm.product');
    if (isProduction) {
      return null;
    }

    return FloatingActionButton(
      onPressed: () {
        // RepositoryProvider.of<AppDbRepository>(context).dropAppTables();
      },
      child: Icon(Icons.delete),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (true) {
      // change to validation db path
      return child;
    }
    // return GetPath();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _buildDevBtnClear(context),
        appBar: const TopAppBar(),
        drawer: Drawer(
          child: Menu(),
        ),
        endDrawer: Drawer(
          child: SettingsPanel(),
        ),
        body: _buildContent(context),
      ),
    );
  }
}
