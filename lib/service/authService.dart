import 'dart:core';
import 'dart:core' as prefix0;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor/validator/error.dart';

class AuthService with ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  bool loading = false;
  FirebaseUser _user;
  Stream<Map<String, dynamic>> _profile;
  FirebaseUser get user => _user;
  Stream<Map<String, dynamic>> get profile => _profile;

  AuthService() {
    _auth.onAuthStateChanged.listen((u){
      if(u != null){
        _user = u;
        _profile = _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data);
      }
      notifyListeners();
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
      loading = false;
      notifyListeners();
      Error.authError(e.code);
    }
    return user;
  }

  Future<FirebaseUser> userLogin(String email, String password) async{
    FirebaseUser user;
    try{
      loading = true;
      notifyListeners();
      user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      Error.authError(e.code);
    }
    return user;
  }

  Future<bool> resetPassword(String email) async{
    try {
      loading = true;
      notifyListeners();
      await _auth.sendPasswordResetEmail(email: email);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      Error.authError(e.code);
    }
    return true;
  }

  Future<void> logout() async{
    _auth.signOut();
    notifyListeners();
  }

}