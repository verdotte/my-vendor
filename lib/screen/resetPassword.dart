import 'package:flutter/material.dart';
import 'package:vendor/validator/validation.dart';
import 'package:vendor/component/colors.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  GlobalKey<FormState> _resetKey = GlobalKey();
  bool _valid = false;

  @override
  Widget build(BuildContext context) {
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
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validation.emailValidate
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    onPressed: () {
                      checkField();
                    },
                    child: Text(
                      'Send',
                      style: Theme.of(context).textTheme.title,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    padding: EdgeInsets.only(
                        left: 120.0, right: 120.0, top: 12.0, bottom: 12.0),
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
    }
  }
}
