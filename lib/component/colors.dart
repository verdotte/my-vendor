import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const mSeller100 = const Color(0xFFFEDBD0);
const mSeller300 = const Color(0xFFFBB8AC);

const mSeller900 = const Color(0xFF442B2D);
const mSellerErrorRed = const Color(0xFFC5032B);

const mSellerSurfaceWhite = const Color(0xFFFCFBFA);
const mSellerBackgroundWhite = Colors.white;
Color mVendor = _colorFromHex("#009EFA");

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

const linkStyle = TextStyle(
  color: mSeller900,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  fontFamily: 'Poppin',
  fontSize: 17.0,
);

const menuStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppin',
  fontSize: 16.0,
);

const progressIndicator = CircularProgressIndicator(
  strokeWidth: 5.0,
);

toastError(String txt) => Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 5,
      backgroundColor: mSellerErrorRed,
      textColor: Colors.white,
      fontSize: 16.0,
);

toast(String txt) => Fluttertoast.showToast(
  msg: txt,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP,
  timeInSecForIos: 10,
  backgroundColor: Colors.green,
  textColor: Colors.white,
  fontSize: 16.0,
);


