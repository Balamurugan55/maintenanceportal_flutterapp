import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  Status(this.content, this.contentcolor);

  final content;
  final contentcolor;

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Message',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              widget.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.contentcolor,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, '/dashboard');
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Text('Close'),
            ),
          ),
        ),
      ],
    );
  }
}
