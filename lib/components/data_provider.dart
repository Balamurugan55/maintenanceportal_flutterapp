import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier {
  bool isNotification = true;
  var plangroup = '010';
  var planplant = 'SA02';
  var NotNoUpdate;
  var Notdetails;
  var WOdetails;
  var Notpriority;
  var WOpriority;
  bool WOdetailsavailable = false;
  bool Notdetailsavailable = false;

  changeNotValue(value) {
    if (value == 'Not') {
      isNotification = true;
    } else {
      isNotification = false;
    }
    notifyListeners();
  }

  changeNotProgressValue(value) {
    Notdetailsavailable = value;
    notifyListeners();
  }

  changeWOProgressValue(value) {
    WOdetailsavailable = value;
    notifyListeners();
  }

  updateNotNo(value) {
    NotNoUpdate = value;
    notifyListeners();
  }

  updateNotDet(value) {
    Notdetails = value;
    notifyListeners();
  }

  updateWODet(value) {
    WOdetails = value;
    notifyListeners();
  }

  updateNotPriority(value) {
    Notpriority = value;
    notifyListeners();
  }

  updateWOPriority(value) {
    WOpriority = value;
    notifyListeners();
  }

  updatePlan(value1, value2) {
    plangroup = value1;
    planplant = value2;
    notifyListeners();
  }
}
