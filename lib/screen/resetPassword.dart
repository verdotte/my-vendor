import 'package:flutter/material.dart';
import 'package:vendor/component/colors.dart' as prefix0;
import 'package:vendor/validator/validation.dart';
import 'package:provider/provider.dart';
import 'package:vendor/service/authService.dart';
import 'package:vendor/component/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> _resetKey = GlobalKey();
  bool _valid = false;
  String txtEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Form(
              key: _resetKey,
              autovalidate: _valid,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Text(
                    'Reset Password',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Enter your email to proceed',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 80.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: Theme.of(context).textTheme.caption,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validation.emailValidate,
                    onSaved: (email) => txtEmail = email,
                  ),
                  SizedBox(height: 20.0),
                  authService.loading
                      ? progressIndicator
                      : RaisedButton(
                          onPressed: () async{
                            checkField();
                            authService.resetPassword(txtEmail)
                            .then((e) {
                              toast("check the link we sent in your email");
                              Navigator.pushReplacementNamed(context, '/login');
                            });
                          },
                          child: Text(
                            'Send',
                            style: Theme.of(context).textTheme.title,
                          ),
                          shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                          padding: EdgeInsets.only(
                              left: 120.0,
                              right: 120.0,
                              top: 12.0,
                              bottom: 12.0),
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
    if (!_resetKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
    } else {
      _resetKey.currentState.save();
    }
  }
}
