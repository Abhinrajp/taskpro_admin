import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Appstate extends ChangeNotifier {
  int currentindex = 0;
  int get getcurrentindex => currentindex;
  void setcurrentindex(int index) {
    currentindex = index;
    notifyListeners();
  }

  Future<void> verifyandupdate(String workerid, String status) async {
    await FirebaseFirestore.instance
        .collection('workers')
        .doc(workerid)
        .update({'registerd': status});
    notifyListeners();
  }
}
