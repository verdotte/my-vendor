import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor/validator/error.dart';


class AuthService with ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  bool loading = false;
  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;

  AuthService() {
    user = Observable(_auth.onAuthStateChanged);
    profile = user.switchMap((FirebaseUser u) {
      if(u != null){
        return _db.collection('Users').document(u.uid).snapshots().map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> userRegistration (Map<String, String> userData) async{
    FirebaseUser user;
    try {
      loading = true;
      notifyListeners();
      user = (await _auth.createUserWithEmailAndPassword(email: userData['email'], password: userData['pass'])).user;
      DocumentReference ref = _db.collection('users').document(user.uid);
      ref.setData({
        'username': userData['username'],
        'phone': userData['phone'],
        'email': userData['email'],
        'password': userData['pass']
      }, merge: true);
      loading = false;
      notifyListeners();
    } catch (e) {
      Error.authError(e.code);
    }
    return user;
  }

}