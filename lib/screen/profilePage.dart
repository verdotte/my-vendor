import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
