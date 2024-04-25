import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/user_model.dart';

class FirebaseDataAdd {
  // Firebase FireStore
  final store = FirebaseFirestore.instance;

  //  Set Data Firebase
  setDataFirebase(Map<String, dynamic> data, BuildContext context) async {
    var provider = Provider.of<Allcontroller>(context, listen: false);
    try {
      await store.collection("notes").add(data).then((value) {
        provider.add_user_model(User_model.fromuser(data, value.id));
      });
    } catch (e) {
      print(e.toString());
    }
  }
  //  Get Data Firebase

  getFirebaseData(BuildContext context) async {
    try {
      var provider = Provider.of<Allcontroller>(context, listen: false);

      await store.collection("notes").get().then((value) {
        List<User_model> allDAta =
            value.docs.map((e) => User_model.fromuser(e.data(), e.id)).toList();
        provider.set_user_model(allDAta);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future deletedata(BuildContext context, User_model model) async {
    try {
      await FirebaseDataAdd().store.collection("notes").doc(model.id).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future updatedata(BuildContext context, User_model model) async {
    try {
      await FirebaseDataAdd()
          .store
          .collection("notes")
          .doc(model.id)
          .update(model.tomap());
    } catch (e) {
      print(e.toString());
    }
  }
}
