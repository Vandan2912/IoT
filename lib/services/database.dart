import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iot/model/component.dart';


class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference component =
  FirebaseFirestore.instance.collection('components');


  List<Component> _ItemCardListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Component cp = Component(
          img: doc["image"],
          title: doc["title"],
          available: doc["available"],
          total: doc["total"]
      );
      return cp;
    }).toList();
  }

  Stream<List<Component>> get  componentlist {
    return component.snapshots().map(_ItemCardListFromSnapshot);
  }
}