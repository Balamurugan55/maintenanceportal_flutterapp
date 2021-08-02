import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/network_helper.dart';
import 'package:maintenance_portal/components/tablerow.dart';

class WorkOrders extends StatefulWidget {
  const WorkOrders({Key? key}) : super(key: key);

  @override
  _WorkOrdersState createState() => _WorkOrdersState();
}

class _WorkOrdersState extends State<WorkOrders> {
  var wolistdata;
  @override
  void initState() {
    super.initState();
    var body = {'plangroup': '010', 'planplant': 'SA02'};
    var res = NetworkHelper.getWolist(body);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'WO No',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Equipment',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Func loc',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Created by',
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
              children: [
                TableRow1('bala', 'bala', 'bala', 'bala', 'bala'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
