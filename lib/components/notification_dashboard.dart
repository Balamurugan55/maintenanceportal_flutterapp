import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/work_orders.dart';

import 'network_helper.dart';
import 'notifications.dart';

class NotDashboard extends StatefulWidget {
  const NotDashboard({Key? key}) : super(key: key);

  @override
  _NotDashboardState createState() => _NotDashboardState();
}

class _NotDashboardState extends State<NotDashboard> {
  var nolistdata;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var body = {'plangroup': '010', 'planplant': 'SA02'};
    var res = await NetworkHelper.getNoget(body);
    print(res);
    nolistdata = res;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/notificationcreate');
              }),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              elevation: 10.0,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                labelPadding: EdgeInsets.only(bottom: 10.0),
                tabs: [
                  Text(
                    'Created',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    'Completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    'Released',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: Notifications(nolistdata),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Released',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
