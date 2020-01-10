import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';
import 'package:vendor/service/productService.dart';
import 'package:vendor/service/authService.dart';
import 'package:vendor/validator/validation.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  File _imageFile;
  GlobalKey<FormState> _productKey = GlobalKey();
  bool _valid = false;
  Map<String, dynamic>product = {};

  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var productService = Provider.of<ProductService>(context);
    var authService = Provider.of<AuthService>(context);
    product['uid'] = authService.user.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mVendor,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          icon: Icon(Icons.arrow_back, color:  mSellerBackgroundWhite),
        ),
        title: Text('Add Product', style: Theme.of(context).textTheme.title),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 45.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mSeller900,
                    width: 2,
                  ),
                ),
                child: _imageFile != null ? Image.file(_imageFile, fit: BoxFit.fill) :
                Text(
                  'Product image',
                  style: Theme.of(context).textTheme.headline,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 120.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: mSellerBackgroundWhite,
                  border: Border.all(
                    color: mSeller900,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    IconButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      icon: Icon(
                          Icons.photo_camera,
                          color:  mSeller900,
                          size: 50.0
                      ),
                    ),
                    SizedBox(height: 30.0),
                    IconButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      icon: Icon(
                          Icons.photo_library,
                          color:  mVendor,
                          size: 50.0
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          Form(
            key: _productKey,
            autovalidate: _valid,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption
                    ),
//                  validator: Validation.passwordValidate,
                  onSaved: (name) => product['prodName'] = name,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Price",
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption
                    ),
                    keyboardType: TextInputType.number,
//                  validator: Validation.passwordValidate,
                  onSaved: (price) => product['prodPrice'] = price,
                  ),
                  SizedBox(height: 20.0),
                  productService.loading ? progressIndicator :
                  RaisedButton(
                    onPressed: () async{
                      checkField();
                      await productService.addProduct(_imageFile, product)
                      .then((e) => Navigator.pushReplacementNamed(context, '/home'));
                    },
                    child: Text('Add', style: Theme.of(context).textTheme.title)
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  checkField() {
    if (!_productKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
    } else {
      _productKey.currentState.save();
    }
  }
}

