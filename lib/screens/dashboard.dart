import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_portal/components/sidenav.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Maintenance portal'),
        ),
        drawer: SideNav(),
      ),
    );
  }
}
