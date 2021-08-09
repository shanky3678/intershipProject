import 'package:flutter/material.dart';

class LoadingOrder extends StatefulWidget {
  @override
  _LoadingOrderState createState() => _LoadingOrderState();
}

class _LoadingOrderState extends State<LoadingOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(), Text("Ordering....")],
        ),
      ),
    );
  }
}
