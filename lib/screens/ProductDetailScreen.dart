import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/AppBarWidget.dart';
import 'package:pink_flamingo_app/common_widget/loadingOrder.dart';
import 'package:pink_flamingo_app/screens/HomeScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  String name;
  String discription;
  String imageUrl;
  String price;

  ProductDetailScreen(
      {Key key,
      @required this.name,
      this.discription,
      @required this.imageUrl,
      @required this.price})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isBusy = false;

  void setBusy(bool busy) {
    isBusy = busy;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfafafa),
        appBar: appBarWidget(context),
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
                    RaisedButton(
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          side: BorderSide(color: Color(0xFFff665e))),
                      onPressed: () async {
                        setBusy(true);
                        setState(() {});
                        await Future.delayed(Duration(seconds: 5));
                        // Navigator.popUntil(context, (route) => false);

                        setBusy(false);
                        setState(() {});
                      },
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 15, bottom: 15),
                        child: Text("available at shops".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

class BottomNavBar extends StatefulWidget {
  bool isbusy = false;
  BottomNavBar(this.isbusy);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            elevation: 0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                side: BorderSide(color: Color(0xFFff665e))),
            onPressed: () async {
              widget.isbusy = true;
              setState(() {});
              await Future.delayed(Duration(seconds: 5));
              // Navigator.popUntil(context, (route) => false);

              widget.isbusy = true;
              setState(() {});
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            color: Colors.pinkAccent,
            textColor: Colors.white,
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
              child: Text("available at shops".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
