import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/screens/HomeScreen.dart';

class OrderPlacedPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderPlaced(context),
    );
  }
}

Widget orderPlaced(context) {
  waitTImer(context);
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/success.png'),
        Text(
          "Order Placed successfully.",
          style: TextStyle(fontSize: 24),
        )
      ],
    ),
  );
}

void waitTImer(context) async {
  await Future.delayed(Duration(seconds: 2));
  Navigator.pop(context);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}
