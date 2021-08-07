import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/notification_dashboard.dart';
import 'package:maintenance_portal/components/sidenav.dart';
import 'package:maintenance_portal/components/work_orders.dart';
import 'package:maintenance_portal/components/workorders_dashboard.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ModalProgressHUD(
          inAsyncCall:
              taskdata.WOdetailsavailable || taskdata.Notdetailsavailable,
          child: Material(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                    taskdata.isNotification ? 'Notifications' : 'Workorders'),
              ),
              body: taskdata.isNotification ? NotDashboard() : WorkDashboard(),
              drawer: SideNav(),
            ),
          ),
        );
      },
    );
  }
}
