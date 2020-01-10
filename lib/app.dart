import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';
import 'package:vendor/screen/splashScreen.dart';
import 'package:vendor/screen/login.dart';
import 'package:vendor/screen/register.dart';
import 'package:vendor/screen/resetPassword.dart';
import 'package:vendor/screen/home.dart';
import 'package:vendor/service/authService.dart';
import 'package:vendor/service/productService.dart';
import 'package:vendor/screen/addProductPage.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<ProductService>(
          create: (_) => ProductService(),
        )
      ],
      child: MaterialApp(
        home: Home(),
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/reset': (context) => ResetPassword(),
          '/home': (context) => Home(),
          '/add': (context) => AddProductPage()
        },
        theme: mSellerTheme,
      ),
    );
  }
}

final ThemeData mSellerTheme = _buildSellerTheme();

ThemeData _buildSellerTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: mVendor,
    primaryColor: mSeller100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: mVendor,
      textTheme: ButtonTextTheme.normal,
      padding: EdgeInsets.only(
          left: 125.0,
          right: 125.0,
          top: 12.0,
          bottom: 12.0
      ),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)
      )
    ),
    scaffoldBackgroundColor: mSellerBackgroundWhite,
    textSelectionColor: mSeller100,
    errorColor: mSellerErrorRed,

    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w900,
      fontFamily: 'Poppin',
      color: mSeller900,
      fontSize: 25.0
    ),
    title: base.title.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Raleway',
      color: mSellerBackgroundWhite
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w200,
      fontSize: 17.0,
      fontFamily: 'Poppin',
      color: mSeller900,
    ),
  );
}

