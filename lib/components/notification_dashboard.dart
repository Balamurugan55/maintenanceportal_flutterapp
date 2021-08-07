import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/work_orders.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'data_provider.dart';
import 'network_helper.dart';
import 'notifications.dart';

class NotDashboard extends StatefulWidget {
  const NotDashboard({Key? key}) : super(key: key);

  @override
  _NotDashboardState createState() => _NotDashboardState();
}

class _NotDashboardState extends State<NotDashboard> {
  var notlistdata;
  var notcreated;
  var notcompleted;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var body = {
      'plangroup': Provider.of<TaskData>(context, listen: false).plangroup,
      'planplant': Provider.of<TaskData>(context, listen: false).planplant
    };
    var res = await NetworkHelper.getNoget(body);
    print(res);
    setState(() {
      notcreated = res['NOT_CREATED'];
      notlistdata = res['NOT_OUTSTANDING'];
      notcompleted = res['NOT_COMPLETED'];
    });
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
                    'Outstanding',
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
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
            child: TabBarView(
              children: [
                Tab(
                  child: notcreated == null
                      ? CircularProgressIndicator()
                      : notcreated.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : Notifications(notcreated),
                ),
                Tab(
                  child: notlistdata == null
                      ? CircularProgressIndicator()
                      : notlistdata.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : Notifications(notlistdata),
                ),
                Tab(
                  child: notcompleted == null
                      ? CircularProgressIndicator()
                      : notcompleted.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : Notifications(notcompleted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
