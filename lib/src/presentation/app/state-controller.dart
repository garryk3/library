import 'package:get/get.dart';

class AppStateController {
  String? dbPath;
  bool isDbExist = false;
}

final appStateController = AppStateController().obs;
