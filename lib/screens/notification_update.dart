import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';
import 'package:maintenance_portal/components/update_status.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  var priority;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    var res = Provider.of<TaskData>(context, listen: false).Notdetails;
    print(res);
    setState(() {
      notno = res['NOTNO'];
      equipid = res['EQUIPID'];
      func_loc = res['FUNC_LOC'];
      malfunc_date = res['MALFUNC_DATE'];
      malfunc_time = res['MALFUNC_TIME'];
      description = res['DESCRIPTION'];
      req_sdate = res['SDATE'];
      req_edate = res['EDATE'];
      reported_by = res['REPORTED_BY'];
      priority = Provider.of<TaskData>(context, listen: false).Notpriority;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isProgress,
      child: Consumer<TaskData>(builder: (context, taskdata, child) {
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
                    TextFormField(
                      initialValue: equipid,
                      decoration: InputDecoration(
                        labelText: 'Equipment id',
                      ),
                      onChanged: (value) {
                        equipid = value;
                      },
                    ),
                    TextFormField(
                      initialValue: func_loc,
                      decoration: InputDecoration(
                        labelText: 'Functional location',
                      ),
                      onChanged: (value) {
                        func_loc = value;
                      },
                    ),
                    TextFormField(
                      initialValue: priority,
                      decoration: InputDecoration(
                        labelText: 'Priority',
                      ),
                      onChanged: (value) {
                        priority = value;
                      },
                    ),
                    TextFormField(
                      initialValue: malfunc_date,
                      decoration: InputDecoration(
                        labelText: 'Malfunction date',
                      ),
                      onChanged: (value) {
                        malfunc_date = value;
                      },
                    ),
                    TextFormField(
                      initialValue: malfunc_time,
                      decoration: InputDecoration(
                        labelText: 'Malfunction time',
                      ),
                      onChanged: (value) {
                        malfunc_time = value;
                      },
                    ),
                    TextFormField(
                      initialValue: description,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    TextFormField(
                      initialValue: reported_by,
                      decoration: InputDecoration(
                        labelText: 'Reported by',
                      ),
                      onChanged: (value) {
                        reported_by = value;
                      },
                    ),
                    TextFormField(
                      initialValue: req_sdate,
                      decoration: InputDecoration(
                        labelText: 'Request start date',
                      ),
                      onChanged: (value) {
                        req_sdate = value;
                      },
                    ),
                    TextFormField(
                      initialValue: req_edate,
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
                          'req_edate': req_edate,
                          'plangroup': taskdata.plangroup,
                          'planplant': taskdata.planplant,
                          'priority': priority
                        };
                        //var res = await NetworkHelper.getAuth(body);
                        //print(res['name'])
                        setState(() {
                          isProgress = true;
                        });

                        var res = await NetworkHelper.getNoup(body);
                        print(res);

                        //await Future.delayed(Duration(seconds: 3));
                        //print(isProgress);

                        setState(() {
                          isProgress = false;
                        });

                        if (res['RETURN'] == 'S') {
                          showDialog(
                            context: context,
                            builder: (context) => Status(
                                'Successfully updated for Notification number ${taskdata.NotNoUpdate}',
                                Colors.green),
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
      }),
    );
  }
}
