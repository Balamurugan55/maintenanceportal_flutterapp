import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';
import 'package:maintenance_portal/components/update_status.dart';
import 'package:provider/provider.dart';

class NotUpdate extends StatefulWidget {
  @override
  _NotUpdateState createState() => _NotUpdateState();
}

class _NotUpdateState extends State<NotUpdate> {
  bool isProgress = false;
  var equipid;
  var func_loc;
  var malfunc_date;
  var malfunc_time;
  var description;
  var req_sdate;
  var req_edate;
  var reported_by;
  var notno;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Notification update'),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: taskdata.NotNoUpdate,
                    decoration: InputDecoration(
                      labelText: 'Notification no',
                    ),
                    onChanged: (value) {
                      notno = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Equipment id',
                    ),
                    onChanged: (value) {
                      equipid = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Functional location',
                    ),
                    onChanged: (value) {
                      func_loc = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Malfunction date',
                    ),
                    onChanged: (value) {
                      malfunc_date = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Malfunction time',
                    ),
                    onChanged: (value) {
                      malfunc_time = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Reported by',
                    ),
                    onChanged: (value) {
                      reported_by = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Request start date',
                    ),
                    onChanged: (value) {
                      req_sdate = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Request end date',
                    ),
                    onChanged: (value) {
                      req_edate = value;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var body = {
                        'notno': notno,
                        'equipid': equipid,
                        'func_loc': func_loc,
                        'malfunc_date': malfunc_date,
                        'malfunc_time': malfunc_time,
                        'description': description,
                        'reported_by': reported_by,
                        'req_sdate': req_sdate,
                        'req_edate': req_edate
                      };
                      //var res = await NetworkHelper.getAuth(body);
                      //print(res['name'])
                      setState(() {
                        isProgress = true;
                      });

                      var res = await NetworkHelper.getNoup(body);
                      print(res);

                      if ('S' == 'S') {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Status('Successfully created', Colors.green),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Status('Error occured', Colors.red),
                        );
                      }
                      //await Future.delayed(Duration(seconds: 3));
                      //print(isProgress);

                      setState(() {
                        isProgress = false;
                      });

                      if ('E' == 'S') {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Status('Successfully updated', Colors.green),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Status('Error occured', Colors.red),
                        );
                      }

                      //Navigator.pushNamed(context, '/dashboard');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 30.0, right: 30.0),
                      child: Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
