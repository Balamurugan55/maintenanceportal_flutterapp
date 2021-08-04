import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_portal/screens/workorder_create.dart';
import 'network_helper.dart';
import 'work_orders.dart';

class WorkDashboard extends StatefulWidget {
  const WorkDashboard({Key? key}) : super(key: key);

  @override
  _WorkDashboardState createState() => _WorkDashboardState();
}

class _WorkDashboardState extends State<WorkDashboard> {
  var wolistdata;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var body = {'plangroup': '010', 'planplant': 'SA02'};
    var res = await NetworkHelper.getWoget(body);
    print(res);
    wolistdata = res;
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
          body: TabBarView(
            children: [
              Tab(
                child: WorkOrders(wolistdata),
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
