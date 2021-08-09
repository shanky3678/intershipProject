import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/SearchWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget appBarWidget(context,
    {String title, Color color, List<Widget> actions}) {
  return AppBar(
    actions: actions,
    toolbarHeight: 80.0,
    elevation: 0.0,
    backgroundColor: color == null ? Colors.white : color,
    title: RichText(
      text: TextSpan(children: [
        title == null
            ? TextSpan(
                text: "Pink Flamingo\n",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800))
            : TextSpan(
                text: title,
                style: TextStyle(
                    color: color == null ? Colors.black : Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800)),
        title == null
            ? TextSpan(
                text: "Clothing",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800))
            : TextSpan(
                text: "",
              ),
      ]),
    ),
  );
}
