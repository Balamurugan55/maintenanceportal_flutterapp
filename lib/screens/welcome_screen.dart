import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image(
                height: 400.0,
                width: 400.0,
                image: AssetImage('images/kaarlogo.jpg'),
              ),
            ),
            Text(
              'Maintenance Portal',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Hero(
              tag: 'login',
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 16.0),
                  child: Text('Log in'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
