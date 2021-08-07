import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';
import 'package:maintenance_portal/components/update_status.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class WorkOrderUpdate extends StatefulWidget {
  const WorkOrderUpdate({Key? key}) : super(key: key);

  @override
  _WorkOrderUpdateState createState() => _WorkOrderUpdateState();
}

class _WorkOrderUpdateState extends State<WorkOrderUpdate> {
  bool isProgress = false;
  var wono;
  var equipno;
  var wotype;
  var duration;
  var notno;
  var nottype;
  String personno = '';
  var description;
  var op_desc;
  var priority;
  var quantity;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    var res = Provider.of<TaskData>(context, listen: false).WOdetails;
    print(res);
    setState(() {
      notno = res['NOTNO'];
      equipno = res['EQUIPID'];
      duration = '00';
      priority = Provider.of<TaskData>(context, listen: false).WOpriority;
      quantity = '0.0';
      description = res['DESCRIPTION'];
      personno = '0';
      op_desc = res['OP_DESC'];
      nottype = '1';
      wono = res['WONO'];
      wotype = res['WOTYPE'];
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
              title: Text('Workorder update'),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: wono,
                      decoration: InputDecoration(
                        labelText: 'Workorder no',
                      ),
                      onChanged: (value) {
                        wono = value;
                      },
                    ),
                    TextFormField(
                      initialValue: equipno,
                      decoration: InputDecoration(
                        labelText: 'Equipment no',
                      ),
                      onChanged: (value) {
                        equipno = value;
                      },
                    ),
                    TextFormField(
                      initialValue: wotype,
                      decoration: InputDecoration(
                        labelText: 'Workorder type',
                      ),
                      onChanged: (value) {
                        wotype = value;
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
                      initialValue: duration,
                      decoration: InputDecoration(
                        labelText: 'Duration',
                      ),
                      onChanged: (value) {
                        duration = value;
                      },
                    ),
                    TextFormField(
                      initialValue: notno,
                      decoration: InputDecoration(
                        labelText: 'Notification no',
                      ),
                      onChanged: (value) {
                        notno = value;
                      },
                    ),
                    TextFormField(
                      initialValue: nottype,
                      decoration: InputDecoration(
                        labelText: 'Notification type',
                      ),
                      onChanged: (value) {
                        nottype = value;
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
                      initialValue: op_desc,
                      decoration: InputDecoration(
                        labelText: 'Operational description',
                      ),
                      onChanged: (value) {
                        op_desc = value;
                      },
                    ),
                    TextFormField(
                      initialValue: quantity,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                      onChanged: (value) {
                        quantity = value;
                      },
                    ),
                    TextFormField(
                      initialValue: personno,
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
                          'duration': duration,
                          'priority': priority,
                          'quantity': quantity
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

                        if (res['RETURN'] == 'S') {
                          showDialog(
                            context: context,
                            builder: (context) => Status(
                                'Successfully updated with workorder number ${wono}',
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
