import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/tablerow.dart';

class Notifications extends StatefulWidget {
  Notifications(this.nolistdata);

  final nolistdata;

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Widget> rows = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.nolistdata.length; i++) {
      rows.add(TableRow1(widget.nolistdata[i]['col1'],
          widget.nolistdata[i]['col2'], widget.nolistdata[i]['col3']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification no',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 17.0,
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Priority',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          ),
          Expanded(
            child: ListView(
              children: rows,
            ),
          ),
        ],
      ),
    );
  }
}
