import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';
import 'package:maintenance_portal/components/update_status.dart';
import 'package:provider/provider.dart';

class WorkOrderUpdate extends StatefulWidget {
  const WorkOrderUpdate({Key? key}) : super(key: key);

  @override
  _WorkOrderUpdateState createState() => _WorkOrderUpdateState();
}

class _WorkOrderUpdateState extends State<WorkOrderUpdate> {
  bool isProgress = true;
  var wono;
  var equipno;
  var wotype;
  var duration;
  var notno;
  var nottype;
  var personno;
  var description;
  var op_desc;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Workorder update'),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: taskdata.NotNoUpdate,
                    decoration: InputDecoration(
                      labelText: 'Workorder no',
                    ),
                    onChanged: (value) {
                      wono = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Equipment no',
                    ),
                    onChanged: (value) {
                      equipno = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Workorder type',
                    ),
                    onChanged: (value) {
                      wotype = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Duration',
                    ),
                    onChanged: (value) {
                      duration = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Notification no',
                    ),
                    onChanged: (value) {
                      notno = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Notification type',
                    ),
                    onChanged: (value) {
                      nottype = value;
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
                      labelText: 'Operational description',
                    ),
                    onChanged: (value) {
                      op_desc = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Personnel no',
                    ),
                    onChanged: (value) {
                      personno = value;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var body = {
                        'notno': notno,
                        'nottype': nottype,
                        'wotype': wotype,
                        'wono': wono,
                        'description': description,
                        'op_desc': op_desc,
                        'equipid': equipno,
                        'persono': personno,
                        'duration': duration
                      };
                      //var res = await NetworkHelper.getAuth(body);
                      //print(res['name'])
                      setState(() {
                        isProgress = true;
                      });

                      var res = await NetworkHelper.getWoup(body);
                      print(res);

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
