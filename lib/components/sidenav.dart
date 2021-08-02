import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_provider.dart';
import 'logout.dart';

class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            ListTile(
              hoverColor: Colors.yellow,
              focusColor: Colors.yellow,
              leading: Icon(Icons.favorite),
              title: Text('Notifications'),
              onTap: () => {
                Provider.of<TaskData>(context, listen: false)
                    .changeNotValue('Not'),
                Navigator.of(context).pop()
              },
            ),
            ListTile(
              hoverColor: Colors.yellow,
              focusColor: Colors.yellow,
              leading: Icon(Icons.favorite),
              title: Text('Workorders'),
              onTap: () => {
                Provider.of<TaskData>(context, listen: false)
                    .changeNotValue('Work'),
                Navigator.of(context).pop()
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {
                Navigator.of(context).pop(),
                showDialog(context: context, builder: (context) => LogOut())
              },
            ),
          ],
        ),
      ),
    );
  }
}
