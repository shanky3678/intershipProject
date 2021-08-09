import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/screens/ProductDetailScreen.dart';

class NewDealDisplay extends StatelessWidget {
  String title;
  String discription;

  NewDealDisplay({
    Key key,
    @required this.title,
    @required this.discription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(title,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto-Light.ttf',
                              fontSize: 20)),
                    ),
                    Container(
                      child: Text(discription,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Roboto-Light.ttf',
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
