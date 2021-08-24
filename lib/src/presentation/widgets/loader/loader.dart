import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  static Future<void> showLoader(BuildContext context) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) {
        return Loader();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
