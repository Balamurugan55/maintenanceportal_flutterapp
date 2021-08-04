import 'package:flutter/material.dart';

class UpdateStatus extends StatefulWidget {
  UpdateStatus(this.text, this.color);
  final text;
  final color;
  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
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
                widget.text,
                style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () {
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
