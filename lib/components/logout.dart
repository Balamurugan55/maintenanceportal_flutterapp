import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Are you sure to logout?',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          //Navigator.pushNamed(context, '/dashboard');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 30.0, right: 30.0),
                          child: Text('Yes'),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          //Navigator.pushNamed(context, '/dashboard');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 30.0, right: 30.0),
                          child: Text('No'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
