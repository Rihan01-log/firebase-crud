import 'dart:developer';

import 'package:firebasecrud/model.dart';
import 'package:firebasecrud/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Studentprovider extends ChangeNotifier {
  StudentService service = StudentService();
  List<Model> student = [];

  Future<void> getAll() async {
    try {
      student = await service.getDetails();
      notifyListeners();
    } catch (e) {
      log('error in provider:$e');
    }
  }

  Future<void> addStudent(Model newstudent) async {
    try {
      await service.addStudent(newstudent);
      student.add(newstudent);
      notifyListeners();
      getAll();
    } catch (e) {
      log('error in adding:$e');
    }
  }

  Future<void> upadate(String id, Model data) async {
    try {
      await service.updatData(id, data);
      getAll();
      notifyListeners();
    } catch (e) {
      log('Error in edit:$e');
    }
  }

  Future<void> deleteS(String id) async {
    try {
      await service.deleteData(id);
      getAll();
      notifyListeners();
    } catch (e) {
      log('delete error in provider:$e');
    }
  }
}
