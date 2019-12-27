import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor/validator/validation.dart';
import 'package:vendor/component/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginKey = GlobalKey();
  bool _valid = false;

  @override
  Widget build(BuildContext context) {
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
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validation.emailValidate),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validation.passwordValidate),
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
                  RaisedButton(
                    onPressed: () {
                      checkField();
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
                    onTap: (){
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
    }
  }
}
