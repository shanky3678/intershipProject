import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/common_widget/NewDealDisplay.dart';
import 'package:pink_flamingo_app/common_widget/CircularProgress.dart';
import 'package:pink_flamingo_app/models/NewDeals.dart';
import 'package:pink_flamingo_app/utils/Urls.dart';
import 'package:http/http.dart';

List<NewDealsModel> newDeals = [];

class NewDealsView extends StatefulWidget {
  String slug;

  NewDealsView({
    Key key,
    this.slug,
  }) : super(key: key);

  @override
  _NewDealsViewState createState() => _NewDealsViewState();
}

class _NewDealsViewState extends State<NewDealsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNewDeals(widget.slug),
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
    );
  }
}

Widget createListView(
  BuildContext context,
  AsyncSnapshot snapshot,
) {
  List<NewDealsModel> values = snapshot.data;
  return SingleChildScrollView(
    child: Column(
      children: List<Widget>.generate(values.length, (index) {
        return NewDealDisplay(
          title: values[index].title,
          discription: values[index].discription,
        );
      }),
    ),
  );
}

//TODO: get list of values here
Future<List<NewDealsModel>> getNewDeals(String slug) async {
  newDeals.clear();
  Response response;
  response = await get(Urls.ROOT_URL + slug);
  print(response.body);
  int statusCode = response.statusCode;
  final body = json.decode(response.body);
  print(body);
  if (statusCode == 200) {
    newDeals = (body as List).map((i) => NewDealsModel.fromJson(i)).toList();
    return newDeals;
  } else {
    return newDeals = [];
  }
}
