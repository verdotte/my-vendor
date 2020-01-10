import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService with ChangeNotifier{

  final Firestore _db = Firestore.instance;
  final StorageReference _storage = FirebaseStorage.instance.ref();
  StorageUploadTask uploadTask;

  bool loading = false;

  Future<void> addProduct (File _image, Map<String, dynamic>product) async{
    String filePath = 'images/${DateTime.now()}';
    DocumentReference documentReference = _db.collection('products').document(product['uid']);

    try{
      loading = true;
      notifyListeners();
      uploadTask = _storage.child(filePath).putFile(_image);
      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      documentReference.setData({
        'prodImage' : imageUrl,
        'prodPrice' : product['prodPrice'],
        'prodName' : product['prodName']
      }, merge: true);

      loading = false;
      notifyListeners();
    } catch (err) {
      print("error is ${err.message}");
    }
  }

}