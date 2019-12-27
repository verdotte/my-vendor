import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vendor/validator/validation.dart';
import 'package:vendor/component/colors.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _registerKey = GlobalKey();
  bool _valid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Form(
              key: _registerKey,
              autovalidate: _valid,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Text(
                    'Sign Up to myVendor',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: Validation.usernameValidate),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: Validation.phoneValidate),
                  SizedBox(height: 20.0),
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
                      obscureText: true,
                      validator: Validation.passwordValidate),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    onPressed: () {
                      checkField();
                    },
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.title,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    padding: EdgeInsets.only(
                        left: 110.0, right: 110.0, top: 12.0, bottom: 12.0),
                  ),
                  SizedBox(height: 15.0),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.caption,
                          children: [
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                            text: 'Login',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              })
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkField() {
    if (!_registerKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
    }
  }
}
