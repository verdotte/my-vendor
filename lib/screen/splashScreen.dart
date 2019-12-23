import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Hello World',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 50.0),
                RaisedButton(
                  onPressed: (){
                  },
                  child: Text(
                    'Save Data',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
