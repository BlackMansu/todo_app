// ignore_for_file: unused_local_variable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Function/data_add_firebase.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/services/color_theme.dart';
import 'package:todoapp/services/text_theme.dart';
import 'package:todoapp/utils/navigate.dart';
import 'package:todoapp/utils/space.dart';
import 'package:todoapp/view/Bottom_nav_bar.dart';
import 'package:todoapp/widgets/btn_widget/txtbtn.dart';

class Add extends StatefulWidget {
  Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _title = TextEditingController();

  final _description = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _mydata = [];

  // Future<void> saveForm() async {
  //   Map<String, dynamic> _form = {
  //     "tittle": _title.text,
  //     "description": _description.text
  //   };

  //   await _firestore.collection("users").add(_form).then((value) {
  //     final doc_id = value.id;
  //     print(doc_id);

  //     _form.addAll({"doc_id": doc_id});

  //     _mydata.add(_form);

  //     setState(() {});
  //   });
  // }

  Future<void> getData() async {
    await _firestore.collection("notes").get().then((value) {
      List<Map<String, dynamic>> snapshot = [];
      final dataList = value.docs;
      for (var d in dataList) {
        snapshot.add({
          "doc_id": d.id,
          "tittle": d.data()['tittle'],
          "description": d.data()['description'],
        });
      }
      _mydata = snapshot;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Allcontroller>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.black,
        title: Text.rich(TextSpan(children: [
          TextSpan(text: "Add ", style: MyStyle.fs20Regular),
          TextSpan(
            text: "Note",
            style: MyStyle.fs20SemiBold,
          )
        ])),
      ),
      backgroundColor: Clr.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Clr.white),
                    borderRadius: BorderRadius.circular(20.r)),
                label: Text("Title"),
                fillColor: Clr.white,
              ),
            ),
            Space.addheight(20),
            TextField(
              controller: _description,
              decoration: InputDecoration(
                  filled: true,
                  label: Text("Description"),
                  fillColor: Clr.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Clr.white),
                      borderRadius: BorderRadius.circular(20.r))),
            ),
            Space.addheight(50),
            Txtbtn(
              radiuss: 20,
              width: 200,
              navigator: () {
                // saveForm();
                Map<String, dynamic> data = {
                  "title": _title.text,
                  "description": _description.text
                };
                FirebaseDataAdd().setDataFirebase(data, context);

                Navigate.push(context, Bottom_nav_bar());
              },
              text: "Note Add",
            ),
            // TextButton(
            //     onPressed: () {
            //       FirebaseDataAdd().getFirebaseData;
            //     },
            //     child: Text("Data Get")),
          ],
        ),
      ),
    );
  }
}
