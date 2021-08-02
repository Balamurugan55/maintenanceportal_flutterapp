import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/loginerrors.dart';

class WorkorderCreate extends StatefulWidget {
  const WorkorderCreate({Key? key}) : super(key: key);

  @override
  _WorkorderCreateState createState() => _WorkorderCreateState();
}

class _WorkorderCreateState extends State<WorkorderCreate> {
  bool isProgress = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Work order creation'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Notification no',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Notification type',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Work order type',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Priority',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Operational description',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Equipment no',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //var body = {'empid': userid, 'password': password};
                    //var res = await NetworkHelper.getAuth(body);
                    //print(res['name'])
                    setState(() {
                      isProgress = true;
                    });

                    //var res = await NetworkHelper.getAuth(body);

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
