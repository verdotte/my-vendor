import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    splashMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 150.0),
              Image.asset('asset/images/supplier.png'),
              SizedBox(height: 230.0),
              Text('myVendor', style: Theme.of(context).textTheme.headline),
              SizedBox(height: 10.0),
              Text('powered by', style: Theme.of(context).textTheme.caption),
              SizedBox(height: 10.0),
              Text('Ignoto', style: Theme.of(context).textTheme.title),
            ],
          ),
        ),
      ),
    );
  }

  Future<Timer>splashMethod() async{
    return new Timer(Duration(seconds: 2), () => Navigator.pushReplacementNamed(context, '/home'));
  }
}

