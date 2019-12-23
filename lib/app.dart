import 'package:flutter/material.dart';
import 'package:vendor/component/colors.dart';
import 'package:vendor/screen/splashScreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/splash': (context) => SplashScreen(),
      },
      theme: mSellerTheme,
    );
  }
}

final ThemeData mSellerTheme = _buildSellerTheme();

ThemeData _buildSellerTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: mSeller900,
    primaryColor: mSeller100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: mSeller100,
      textTheme: ButtonTextTheme.normal,
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
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Poppin',
    displayColor: mSeller900,
    bodyColor: mSeller900,
  );
}
