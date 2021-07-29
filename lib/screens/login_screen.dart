import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:maintenance_portal/components/loginerrors.dart';
import 'package:maintenance_portal/components/network_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isProgress = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var userid;
    var password;

    return Material(
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Image(
                      height: 100.0,
                      width: 100.0,
                      image: AssetImage('images/kaarlogo.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    'Login page',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the user id',
                      ),
                      onChanged: (value) {
                        userid = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: 'Enter the password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              print('hi');
                              obscureText = !obscureText;
                              print(obscureText);
                            });
                          },
                          child: Icon(obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Hero(
                    tag: 'login',
                    child: ElevatedButton(
                      onPressed: () async {
                        var body = {'empid': userid, 'password': password};
                        //var res = await NetworkHelper.getAuth(body);
                        //print(res['name'])
                        setState(() {
                          isProgress = true;
                        });

                        var res = await NetworkHelper.getAuth(body);

                        if (res['type'] == 'S') {
                          Navigator.pushNamed(context, '/dashboard');
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => LoginErrors());
                        }
                        //await Future.delayed(Duration(seconds: 3));
                        //print(isProgress);
                        setState(() {
                          isProgress = false;
                        });

                        //Navigator.pushNamed(context, '/dashboard');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 30.0, right: 30.0),
                        child: Text('Log in'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
