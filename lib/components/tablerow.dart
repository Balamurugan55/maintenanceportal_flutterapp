import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:provider/provider.dart';

import 'network_helper.dart';

class TableRow1 extends StatelessWidget {
  TableRow1(this.col1, this.col2, this.col3);
  final col1;
  final col2;
  final col3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (Provider.of<TaskData>(context, listen: false).isNotification) {
          Provider.of<TaskData>(context, listen: false).updateNotNo(col1);
          Provider.of<TaskData>(context, listen: false).updateNotPriority(col3);
          Provider.of<TaskData>(context, listen: false)
              .changeNotProgressValue(true);

          var body = {'notno': col1};
          var res = await NetworkHelper.getNodet(body);
          Provider.of<TaskData>(context, listen: false)
              .changeNotProgressValue(false);
          Provider.of<TaskData>(context, listen: false).updateNotDet(res);
          Navigator.pushNamed(context, '/notupdate');
        } else {
          var body = {'wono': col1};
          Provider.of<TaskData>(context, listen: false).updateWOPriority(col3);
          Provider.of<TaskData>(context, listen: false)
              .changeWOProgressValue(true);
          var res = await NetworkHelper.getWodet(body);
          Provider.of<TaskData>(context, listen: false).updateWODet(res);
          Provider.of<TaskData>(context, listen: false)
              .changeWOProgressValue(false);
          Navigator.pushNamed(context, '/woupdate');
        }
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(col1),
            SizedBox(
              width: 5.0,
            ),
            Expanded(child: Text(col2)),
            Text(col3),
          ],
        ),
      ),
    );
  }
}

/*
class TableRow extends StatefulWidget {
  TableRow({this.col1, this.col2, this.col3, this.col4, this.col5});
  final col1;
  final col2;
  final col3;
  final col4;
  final col5;
  @override
  _TableRowState createState() => _TableRowState();
}

class _TableRowState extends State<TableRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.col1),
          Text(widget.col2),
          Text(widget.col3),
          Text(widget.col4),
          Text(widget.col5),
        ],
      ),
    );
  }
}
*/
