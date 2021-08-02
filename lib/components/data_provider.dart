import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier {
  bool isNotification = true;
  var NotNoUpdate;
  changeNotValue(value) {
    if (value == 'Not') {
      isNotification = true;
    } else {
      isNotification = false;
    }
    notifyListeners();
  }

  updateNotNo(value) {
    NotNoUpdate = value;
    notifyListeners();
  }
}
