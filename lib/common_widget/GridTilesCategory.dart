import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/screens/ProductDetailScreen.dart';

class GridTilesCategory extends StatelessWidget {
  String name;
  String imageUrl;
  String discription;
  String price;

  GridTilesCategory({
    Key key,
    @required this.name,
    @required this.imageUrl,
    this.discription,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                  discription: discription,
                  name: name,
                  price: price,
                  imageUrl: imageUrl)),
        );
      },
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto-Light.ttf',
                        fontSize: 12)),
              ],
            ),
          )),
    );
  }
}
