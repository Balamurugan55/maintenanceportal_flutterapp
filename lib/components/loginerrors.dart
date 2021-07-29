import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginErrors extends StatefulWidget {
  const LoginErrors({Key? key}) : super(key: key);

  @override
  _LoginErrorsState createState() => _LoginErrorsState();
}

class _LoginErrorsState extends State<LoginErrors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            children: [
              Text(
                'Invalid userid or password',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  //Navigator.pushNamed(context, '/dashboard');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 30.0, right: 30.0),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
