import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';
import 'package:vendor/screen/splashScreen.dart';
import 'package:vendor/screen/login.dart';
import 'package:vendor/screen/register.dart';
import 'package:vendor/screen/resetPassword.dart';
import 'package:vendor/screen/home.dart';
import 'package:vendor/service/authService.dart';

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
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/reset': (context) => ResetPassword(),
          '/home': (context) => Home()
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
      fontWeight: FontWeight.w900,
      fontFamily: 'Poppin',
      color: mSeller400,
      fontSize: 25.0
    ),
    title: base.title.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Raleway',
      color: mSeller900
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w200,
      fontSize: 17.0,
      fontFamily: 'Poppin',
      color: mSeller900,
    ),
  );
}
