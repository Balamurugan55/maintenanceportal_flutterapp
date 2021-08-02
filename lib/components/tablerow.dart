import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/data_provider.dart';
import 'package:provider/provider.dart';

class TableRow1 extends StatelessWidget {
  TableRow1(this.col1, this.col2, this.col3, this.col4, this.col5);
  final col1;
  final col2;
  final col3;
  final col4;
  final col5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<TaskData>(context, listen: false).isNotification) {
          Provider.of<TaskData>(context, listen: false).updateNotNo(col1);
          Navigator.pushNamed(context, '/notupdate');
        }
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(col1),
            Text(col2),
            Text(col3),
            Text(col4),
            Text(col5),
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
