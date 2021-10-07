import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class Notification implements INotification {
  const Notification._private();

  static final _instance = Notification._private();

  factory Notification() => _instance;

  void _show(
    String title,
    String message, {
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 3),
      icon: Icon(
        icon,
        size: 16.0,
        color: Colors.white70,
      ),
      colorText: Colors.white70,
      shouldIconPulse: true,
      backgroundColor: Colors.black87,
    );
  }

  @override
  void showError(String message) {
    _show('Ошибка!', message, icon: Icons.error_outline);
  }

  @override
  void showInfo(String message) {
    _show('Успешно!', message, icon: Icons.info_outline);
  }

  @override
  void showWarning(String message) {
    _show('Внимание!', message, icon: Icons.warning_outlined);
  }
}
