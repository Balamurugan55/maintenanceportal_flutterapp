import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/screens/workorder_create.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'network_helper.dart';
import 'work_orders.dart';

class WorkDashboard extends StatefulWidget {
  const WorkDashboard({Key? key}) : super(key: key);

  @override
  _WorkDashboardState createState() => _WorkDashboardState();
}

class _WorkDashboardState extends State<WorkDashboard> {
  var wocreated;
  var wocompleted;
  var woreleased;
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
    var res = await NetworkHelper.getWoget(body);
    print(res);
    setState(() {
      wocreated = res['WO_CREATED'];
      wocompleted = res['WO_COMPLETED'];
      woreleased = res['WO_RELEASED'];
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
                Navigator.pushNamed(context, '/workordercreate');
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
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 30.0, right: 16.0),
            child: TabBarView(
              children: [
                Tab(
                  child: wocreated == null
                      ? CircularProgressIndicator()
                      : wocreated.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : WorkOrders(wocreated),
                ),
                Tab(
                  child: wocompleted == null
                      ? CircularProgressIndicator()
                      : wocompleted.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : WorkOrders(wocompleted),
                ),
                Tab(
                  child: woreleased == null
                      ? CircularProgressIndicator()
                      : woreleased.length == 0
                          ? Text(
                              'No details found',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.0,
                              ),
                            )
                          : WorkOrders(woreleased),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
