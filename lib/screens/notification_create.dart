import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';
import 'package:provider/provider.dart';

class NotCreate extends StatefulWidget {
  const NotCreate({Key? key}) : super(key: key);

  @override
  _NotCreateState createState() => _NotCreateState();
}

class _NotCreateState extends State<NotCreate> {
  bool isProgress = false;
  var equipid;
  var func_loc;
  var malfunc_date;
  var malfunc_time;
  var description;
  var req_sdate;
  var req_edate;
  var reported_by;
  var nottype;
  var priority;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification creation'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: ListView(
              children: [
                TextFormField(
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
                    labelText: 'Notification type',
                  ),
                  onChanged: (value) {
                    nottype = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Priority',
                  ),
                  onChanged: (value) {
                    priority = value;
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
                      'equipid': equipid,
                      'func_loc': func_loc,
                      'malfunc_date': malfunc_date,
                      'malfunc_time': malfunc_time,
                      'description': description,
                      'reported_by': reported_by,
                      'req_sdate': req_sdate,
                      'req_edate': req_edate,
                      'nottype': nottype,
                      'priority': priority,
                      'plangroup': Provider.of<TaskData>(context, listen: false)
                          .plangroup,
                      'planplant': Provider.of<TaskData>(context, listen: false)
                          .planplant
                    };
                    //var res = await NetworkHelper.getAuth(body);
                    //print(res['name'])
                    setState(() {
                      isProgress = true;
                    });

                    var res = await NetworkHelper.getNocr(body);
                    print(res);

                    /*if (res['type'] == 'S') {
                      Navigator.pushNamed(context, '/dashboard');
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => LoginErrors());
                    }*/
                    //await Future.delayed(Duration(seconds: 3));
                    //print(isProgress);
                    setState(() {
                      isProgress = false;
                    });
                    if (res['RETURN'] == 'S') {
                      showDialog(
                        context: context,
                        builder: (context) => Status(
                            'Successfully created with notification number ${res['NOTNO']} ',
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
                    child: Text('Create'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
