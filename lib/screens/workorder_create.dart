import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/loginerrors.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/status.dart';

class WorkorderCreate extends StatefulWidget {
  const WorkorderCreate({Key? key}) : super(key: key);

  @override
  _WorkorderCreateState createState() => _WorkorderCreateState();
}

class _WorkorderCreateState extends State<WorkorderCreate> {
  bool isProgress = false;
  @override
  Widget build(BuildContext context) {
    var notno;
    var nottype;
    var wotype;
    var priority;
    var description;
    var op_desc;
    var equipno;
    var quantity;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Work order creation'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: ListView(
              children: [
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
                    labelText: 'Work order type',
                  ),
                  onChanged: (value) {
                    wotype = value;
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
                    labelText: 'Equipment no',
                  ),
                  onChanged: (value) {
                    equipno = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                  onChanged: (value) {
                    quantity = value;
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var body = {
                      'notno': notno,
                      'nottype': nottype,
                      'wotype': wotype,
                      'priority': priority,
                      'description': description,
                      'op_desc': op_desc,
                      'equipid': equipno,
                      'quantity': quantity
                    };

                    /*setState(() {
                      isProgress = true;
                    });*/

                    var res = await NetworkHelper.getWocr(body);
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

                    if ('E' == 'S') {
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
