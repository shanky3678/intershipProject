import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pink_flamingo_app/common_widget/CircularProgress.dart';
import 'package:pink_flamingo_app/locator.dart';
import 'package:pink_flamingo_app/models/OrderModel.dart';
import 'package:pink_flamingo_app/models/userData.dart';
import 'package:pink_flamingo_app/utils/Urls.dart';

List<OrderModel> orderList = [];

class OrderView extends StatelessWidget {
  final UserDetails _userDetails = locator<UserDetails>();
  String slug;
  String name;

  OrderView({
    Key key,
    @required this.slug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffEF7C8E),
      appBar: AppBar(
        title: Text("View Orders"),
      ),
      body: FutureBuilder(
        future: getOrderList(slug, _userDetails.userId),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgress();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return createListView(
                  context,
                  snapshot,
                );
          }
        },
      ),
    );
  }

  Widget createListView(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    List<OrderModel> values = snapshot.data;
    return SingleChildScrollView(
      child: Column(
        children: List<Widget>.generate(values.length, (index) {
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.white,
                  color: Color(0xffEF7C8E),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(values[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Arriving soon...", style: TextStyle(fontSize: 18))
                  ]),
            ),
          );
        }),
      ),
    );
  }

  Future<List<OrderModel>> getOrderList(String slug, int userId) async {
    Response response;
    print(Urls.ROOT_URL + slug + "/$userId");
    response = await get(Urls.ROOT_URL + slug + "/$userId");
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    print(body);
    if (statusCode == 200) {
      orderList = (body as List).map((e) => OrderModel.formJson(e)).toList();
      return orderList;
    } else {
      return orderList = [];
    }
  }
}
