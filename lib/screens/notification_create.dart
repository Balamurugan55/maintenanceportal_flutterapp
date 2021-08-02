import 'package:flutter/material.dart';

class NotCreate extends StatefulWidget {
  const NotCreate({Key? key}) : super(key: key);

  @override
  _NotCreateState createState() => _NotCreateState();
}

class _NotCreateState extends State<NotCreate> {
  bool isProgress = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Notification creation'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Equipment id',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Functional location',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Malfunction date',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Malfunction time',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Reported by',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Request start date',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Request end date',
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
