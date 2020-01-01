import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/service/authService.dart';
import 'package:vendor/screen/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    bool login = authService.user != null;
    if(!login) return Login();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150.0),
                Image.asset('asset/images/supplier.png'),
                SizedBox(height: 30.0),
                Text('hello', style: Theme.of(context).textTheme.headline),
                SizedBox(height: 30.0),
                RaisedButton(
                  onPressed: () async{
                    authService.logout();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.title,
                  ),
                  padding: EdgeInsets.only(
                      left: 120.0, right: 120.0, top: 12.0, bottom: 12.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
