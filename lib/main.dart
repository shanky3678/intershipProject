import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/AppBarWidget.dart';
import 'package:pink_flamingo_app/common_widget/DrawerWidget.dart';
import 'package:pink_flamingo_app/components/AppSignIn.dart';
import 'package:pink_flamingo_app/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
    );
  }
}

int currentIndex = 0;

void navigateToScreens(int index) {
  currentIndex = index;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSignIn(),
    );
  }
}
