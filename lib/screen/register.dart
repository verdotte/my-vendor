import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vendor/validator/validation.dart';
import 'package:vendor/component/colors.dart';
import 'package:provider/provider.dart';
import 'package:vendor/service/authService.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _registerKey = GlobalKey();
  bool _valid = false;
  Map<String, String> user = {};

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
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
                    'Sign up to myVendor',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        labelStyle: Theme.of(context).textTheme.caption
                      ),
                      validator: Validation.usernameValidate,
                      onSaved: (username) => user['username'] = username),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: Validation.phoneValidate,
                      onSaved: (phone) => user['phone'] = phone),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validation.emailValidate,
                      onSaved: (email) => user['email'] = email),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: Theme.of(context).textTheme.caption,
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: Validation.passwordValidate,
                      onSaved: (pass) => user['pass'] = pass),
                  SizedBox(height: 20.0),
                  authService.loading ? progressIndicator
                      : RaisedButton(
                          onPressed: () async {
                            checkField();
                            await authService.userRegistration(user)
                            .then((e) => {
                              e != null ? Navigator.pushReplacementNamed(context, '/home') : ''
                            });
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context).textTheme.title,
                          ),
                          shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                          padding: EdgeInsets.only(
                              left: 110.0,
                              right: 110.0,
                              top: 12.0,
                              bottom: 12.0),
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

  checkField() async {
    if (!_registerKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
    } else {
      _registerKey.currentState.save();
    }
  }
}
