import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor/screen/home.dart';
import 'package:vendor/validator/validation.dart';
import 'package:vendor/component/colors.dart';
import 'package:provider/provider.dart';
import 'package:vendor/service/authService.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginKey = GlobalKey();
  bool _valid = false;
  String txtEmail;
  String txtPass;

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Form(
              key: _loginKey,
              autovalidate: _valid,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Text(
                    'Welcome to myVendor',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Sign in to continue',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 80.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validation.emailValidate,
                    onSaved: (email) => txtEmail = email,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: Validation.passwordValidate,
                    onSaved: (pass) => txtPass = pass,
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0),
                    child: InkWell(
                      child: Text(
                        'Password Forgot ?',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.end,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/reset');
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  authService.loading ? progressIndicator :
                  RaisedButton(
                    onPressed: () async{
                      checkField();
                      await authService.userLogin(txtEmail, txtPass)
                      .then((e) => {
                        e != null ? Navigator.pushReplacementNamed(context, '/home') : ''
                      });
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.title,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    padding: EdgeInsets.only(
                        left: 120.0, right: 120.0, top: 12.0, bottom: 12.0),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    child: Text(
                      'Create an Account',
                      style: linkStyle,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkField() {
    if (!_loginKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
    } else {
      _loginKey.currentState.save();
    }
  }
}
