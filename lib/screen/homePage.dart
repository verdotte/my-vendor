import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mSellerSurfaceWhite,
      body: Container(
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
