// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Function/data_add_firebase.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/services/color_theme.dart';
import 'package:todoapp/services/text_theme.dart';
import 'package:todoapp/utils/navigate.dart';
import 'package:todoapp/utils/space.dart';
import 'package:todoapp/view/screens/update.dart';
import 'package:todoapp/widgets/dilogbox/small_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  // List<SwipeItem> _items = <SwipeItem>[];
  // MatchEngine? _matchEngine;
  // List<String> _data = ["himanshu", "sachin", "ajju"];

  int clr = 0;

  int container = 0;
  int containerclr = 0;

  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    await FirebaseDataAdd().getFirebaseData(context);
    setState(() {});

    var provider =
        Provider.of<Allcontroller>(context, listen: false).get_user_model;
    // for (var i = 0; i < provider.length; i++) {
    //   _items.add(SwipeItem(content: provider[i]));

    //   _matchEngine = MatchEngine(swipeItems: _items);
    // }
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<Allcontroller>(context);
    setState(() {});

    List<Color> listclrs = [Clr.orang, Clr.white, Colors.green];

    // var listclr =
    //     List.generate(provider.get_user_model., (index) => listclrs);
    // print(listclr);

    List<String> txt = ["NOTES", "IMPORTANT"];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Clr.black,
          leading: Icon(
            Icons.notes_rounded,
            size: 25.sp,
          ),
          title: Text.rich(TextSpan(children: [
            TextSpan(text: "Todo ", style: MyStyle.fs20Regular),
            TextSpan(
              text: "App",
              style: MyStyle.fs20SemiBold,
            )
          ]))),
      backgroundColor: Clr.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      bottomLeft: Radius.circular(35.r),
                      bottomRight: Radius.circular(35.r),
                      topRight: Radius.circular(10.r)),
                  child: Image.asset(
                    "assets/images/emoji.jpg",
                    fit: BoxFit.cover,
                    height: Space.getHeight(context) * 0.10,
                    width: Space.getWidth(context) * 0.2,
                  ),
                ),
                Space.addwidth(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, Good Morning",
                        style: MyStyle.fs18Light
                            .copyWith(color: Clr.white.withOpacity(0.8))),
                    Space.addheight(13),
                    Text("Himanshu",
                        style: MyStyle.fs22Regular.copyWith(color: Clr.white))
                  ],
                ),
              ],
            ),
            // Space.addheight(30),
            Container(
              height: 45.h,
              width: 250.w,
              decoration: BoxDecoration(
                  color: Clr.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     margin: EdgeInsets.all(5),
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: Clr.white),
                  //         color: Clr.white.withOpacity(0.4),
                  //         borderRadius: BorderRadius.circular(20.r)),
                  //     child: Center(
                  //         child: Text("NOTES",
                  //             style: MyStyle.fs14SemiBold
                  //                 .copyWith(color: Clr.white))),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     margin: EdgeInsets.all(5),
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: Clr.white),
                  //         color: Clr.white.withOpacity(0.4),
                  //         borderRadius: BorderRadius.circular(20.r)),
                  //     child: Center(
                  //         child: Text("IMPORTANT",
                  //             style: MyStyle.fs14SemiBold
                  //                 .copyWith(color: Clr.white))),
                  //   ),
                  // ),
                  ...List.generate(
                    txt.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            clr = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: clr == index ? Clr.white : Clr.noclr),
                              color: clr == index
                                  ? Clr.white.withOpacity(0.4)
                                  : Clr.noclr,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                              child: Text(txt[index],
                                  style: MyStyle.fs14SemiBold
                                      .copyWith(color: Clr.white))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Space.addheight(30),
            AspectRatio(
              aspectRatio: 0.0016.sh,
              child: ListView.builder(
                  itemCount: provider.get_user_model.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child:
                            //  Transform.rotate(
                            // angle: container != index ? 0.1 : 0.0,
                            // child:

                            Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: Clr.orang
                              //  listclr[index][index]
                              ),
                          height: Space.getHeight(context) * 0.50,
                          width: Space.getWidth(context) * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.purple,
                                        border: Border.all(
                                            color: Clr.black, width: 5),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.r)),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigate.push(
                                                context,
                                                Update(
                                                  notes: provider
                                                      .get_user_model[index],
                                                ));
                                          },
                                          icon: Icon(Icons.edit)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                            color: Clr.black, width: 5),
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(CupertinoIcons.heart_fill,
                                              color: Clr.white)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.purple,
                                        border: Border.all(
                                            color: Clr.black, width: 5),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40.r)),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            // FirebaseDataAdd()
                                            //     .store
                                            //     .collection("notes")
                                            //     .doc(provider
                                            //         .get_user_model[index].id)
                                            //     .delete();
                                            // }

                                            // );
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    Small_dialog(
                                                      text:
                                                          "Are you sure you want to\ndelete?",
                                                      textStyle: MyStyle
                                                          .fs20Regular
                                                          .copyWith(
                                                              color: Clr.white),
                                                      leftbtntxt: "Cancel",
                                                      rightbtntxt: "Ok",
                                                      rightbtnnav: () {
                                                        setState(() {
                                                          FirebaseDataAdd()
                                                              .store
                                                              .collection(
                                                                  "notes")
                                                              .doc(provider
                                                                  .get_user_model[
                                                                      index]
                                                                  .id)
                                                              .delete();
                                                        });
                                                        Navigate.back(context);
                                                      },
                                                    ));
                                          },
                                          icon: Icon(Icons.delete)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.get_user_model[index].tittle!
                                          .toUpperCase(),
                                      // FirebaseDataAdd().datasec.toString(),
                                      style: MyStyle.fs20SemiBold
                                          .copyWith(color: Clr.black),
                                    ),
                                    Space.addheight(10),
                                    Text(
                                      provider
                                          .get_user_model[index].description!,
                                      style: MyStyle.fs14SemiBold
                                          .copyWith(color: Clr.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),

            Space.addheight(40)
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   ...List.generate(
            //     provider.get_user_model.length,
            //     (i) => Container(
            //         margin: EdgeInsets.only(right: 10),
            //         height: 7.h,
            //         width: 10.w,
            //         decoration: BoxDecoration(
            //             color: i == containerclr
            //                 ? Clr.white
            //                 : const Color.fromARGB(255, 75, 75, 75),
            //             borderRadius: BorderRadius.circular(100.r))),
            //   ),
            // ]),
            // Space.addheight(50),

            // AspectRatio(
            //   aspectRatio: 2,
            //   child: SwipeCards(
            //       // leftSwipeAllowed: true
            //       matchEngine: _matchEngine!,

            //       onStackFinished: () {},
            //       itemBuilder: (context, index) => Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20.r),
            //               color: Colors.greenAccent,
            //             ),
            //             height: Space.getHeight(context) * 0.4,
            //             width: Space.getWidth(context) * 0.5,
            //             // height: 200,
            //             // width: 200,
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Column(
            //                 children: [
            //                   Text(provider.get_user_model[index].tittle),
            //                   Text(provider.get_user_model[index].description),
            //                 ],
            //               ),
            //             ),
            //           )),
            // )
          ],
        ),
      ),
    );
  }
}
