// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoapp/services/color_theme.dart';
import 'package:todoapp/services/text_theme.dart';
import 'package:todoapp/utils/navigate.dart';

class Small_dialog extends StatefulWidget {
  String text;
  String leftbtntxt;
  String rightbtntxt;
  TextStyle? stylesubtitle;
  TextStyle? textStyle;
  Function? rightbtnnav;
  Small_dialog(
      {super.key,
      this.stylesubtitle,
      this.textStyle,
      required this.text,
      required this.leftbtntxt,
      this.rightbtnnav,
      required this.rightbtntxt});

  @override
  State<Small_dialog> createState() => Small_dialogState();
}

class Small_dialogState extends State<Small_dialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Clr.white)),
      backgroundColor: Clr.black,
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: widget.textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigate.back(context);
                    },
                    child: Text(widget.leftbtntxt,
                        style:
                            MyStyle.fs18SemiBold.copyWith(color: Clr.white))),
                TextButton(
                    onPressed: () => widget.rightbtnnav == null
                        ? Navigate.back(context)
                        : widget.rightbtnnav!(),
                    child: Text(widget.rightbtntxt,
                        style: MyStyle.fs18SemiBold.copyWith(color: Clr.white)))
              ],
            )
          ]),
    );
  }
}
