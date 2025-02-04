import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/model.dart';

class StudentService {
  final CollectionReference storeData =
      FirebaseFirestore.instance.collection('collection');

  Future<List<Model>> getDetails() async {
    try {
      final data = await storeData.get();
      log(data.toString());
      return data.docs
          .map((docs) =>
              Model.frombase(docs.data() as Map<String, dynamic>, docs.id))
          .toList();
    } on FirebaseException catch (e) {
      log(e.code);
    }
    throw Exception('error geting data');
  }

  Future<void> addStudent(Model data) async {
    try {
      await storeData.add(data.toBase());
    } on FirebaseException catch (e) {
      log('error in add:$e');
    }
  }

  Future<void> updatData(String id, Model data) async {
    try {
      await storeData.doc(id).update(data.toBase());
    } on FirebaseException catch (e) {
      log('error in update:$e');
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await storeData.doc(id).delete();
    } on FirebaseException catch (e) {
      log('error in delete:$e');
    }
  }
}
