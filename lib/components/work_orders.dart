import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/tablerow.dart';

class WorkOrders extends StatefulWidget {
  WorkOrders(this.wolistdata);

  final wolistdata;

  @override
  _WorkOrdersState createState() => _WorkOrdersState();
}

class _WorkOrdersState extends State<WorkOrders> {
  List<Widget> rows = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.wolistdata.length; i++) {
      rows.add(TableRow1(widget.wolistdata[i]['col1'],
          widget.wolistdata[i]['col2'], widget.wolistdata[i]['col4']));
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
                'WO No',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 15.0,
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
