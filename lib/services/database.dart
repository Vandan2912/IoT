import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iot/model/component.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference component =
      FirebaseFirestore.instance.collection('components');
  final firebase_storage.FirebaseStorage firebaseStorageRef =
      firebase_storage.FirebaseStorage.instance;

  List<Component> _ItemCardListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print("doc form stream: ${doc}");
      print("doc form stream: ${doc.data()}");
      Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
      Component cp = Component.fromJson(map);
      return cp;
    }).toList();
  }

  Stream<List<Component>> get componentlist {
    return component.snapshots().map(_ItemCardListFromSnapshot);
  }

  Future<void> addItemToDataBase(Component data) {
    return component.add(data.toJson()).then((value) => print("value add to database: $value"));
  }

  Future<String> uploadImage(PickedFile img) {
    String filePath = img.path;
    File file = File(filePath);
    firebase_storage.Reference ref = firebaseStorageRef.ref().child("image"+DateTime.now().toString());
    firebase_storage.UploadTask uploadTask = ref.putFile(file);
    Future<String> url = uploadTask.then((p0) => p0.ref.getDownloadURL());
    return url;
  }
}
