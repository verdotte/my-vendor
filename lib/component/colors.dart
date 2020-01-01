import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const mSellerPink50 = const Color(0xFFFEEAE6);
const mSeller100 = const Color(0xFFFEDBD0);
const mSeller300 = const Color(0xFFFBB8AC);
const mSeller400 = const Color(0xFFEAA4A4);

const mSeller900 = const Color(0xFF442B2D);

const mSellerErrorRed = const Color(0xFFC5032B);

const mSellerSurfaceWhite = const Color(0xFFFFFBFA);
const mSellerBackgroundWhite = Colors.white;

const linkStyle = TextStyle(
  color: mSeller400,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  fontFamily: 'Poppin',
  fontSize: 17.0,
);

const progressIndicator = CircularProgressIndicator(
  backgroundColor: mSeller400,
  strokeWidth: 3.0,
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


