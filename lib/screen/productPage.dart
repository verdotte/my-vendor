import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'My Product',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
