import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/SearchWidget.dart';
import 'package:pink_flamingo_app/components/AppSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    title: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Pink Flamingo\n",
            style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w800)),
        TextSpan(
            text: "Clothing",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w800)),
      ]),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchWidget()),
          );
        },
        icon: Icon(
          FontAwesomeIcons.search,
          color: Colors.black54,
        ),
        color: Color(0xFF323232),
      ),
    ],
  );
}
