import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/AppBarWidget.dart';
import 'package:pink_flamingo_app/common_widget/loadingOrder.dart';
import 'package:pink_flamingo_app/locator.dart';
import 'package:pink_flamingo_app/models/userData.dart';
import 'package:pink_flamingo_app/screens/OrderPlaced.dart';

import 'package:pink_flamingo_app/services/ApiService.dart';

class ProductDetailScreen extends StatefulWidget {
  String name;
  String discription;
  String imageUrl;
  String price;
  int productId;

  ProductDetailScreen(
      {Key key,
      @required this.name,
      @required this.productId,
      this.discription,
      @required this.imageUrl,
      @required this.price})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isBusy = false;
  UserDetails _details = locator<UserDetails>();

  void setBusy(bool busy) {
    isBusy = busy;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfafafa),
        appBar: appBarWidget(context,
            title: "Details",
            color: Colors.pinkAccent,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () async {
                    setBusy(true);
                    setState(() {});
                    var result = await createOrder("add-order", {
                      "name": widget.name,
                      "userId": _details.userId,
                      "productId": widget.productId,
                    });
                    if (result.data['status'] == 200) {
                      setBusy(false);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderPlacedPlace()));
                    } else {
                      final snackBar =
                          SnackBar(content: Text("Something went wrong."));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    setBusy(false);
                    setState(() {});
                  },
                  color: Colors.white,
                  textColor: Colors.white,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
                    child: Text("Buy Now".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.pinkAccent)),
                  ),
                ),
              ),
            ]),
        body: isBusy
            ? LoadingOrder()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      color: Color(0xFFFFFFFF),
                      child: Text(widget.name,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.pink)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      color: Color(0xFFFFFFFF),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Price".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF565656))),
                          Text(" ${widget.price}  ".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto-Light.ttf',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      color: Color(0xFFFFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Description",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF565656))),
                          SizedBox(
                            height: 15,
                          ),
                          Text("${widget.discription}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4c4c4c))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ));
  }
}
