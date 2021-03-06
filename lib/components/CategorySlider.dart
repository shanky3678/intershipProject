import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/models/CategoryModel.dart';
import 'package:pink_flamingo_app/common_widget/CircularProgress.dart';
import 'package:pink_flamingo_app/common_widget/GridTilesCategory.dart';
import 'package:pink_flamingo_app/utils/Urls.dart';
import 'package:http/http.dart';

List<CategoryModel> categories = [];

class CategoryPage extends StatefulWidget {
  String slug;

  CategoryPage({
    Key key,
    this.slug,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryList(widget.slug),
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
  List<CategoryModel> values = snapshot.data;
  return GridView.count(
    crossAxisCount: 2,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 1.125,
    children: List<Widget>.generate(values.length, (index) {
      return Center(
        child: GridTile(
            child: GridTilesCategory(
          productId: values[index].productId,
          name: values[index].name,
          imageUrl: values[index].imageUrl,
          price: values[index].price,
          discription: values[index].discription,
        )),
      );
    }),
  );
}

//TODO: get list of values here
Future<List<CategoryModel>> getCategoryList(String slug) async {
  categories.clear();
  Response response;
  response = await get(Urls.ROOT_URL + slug);
  int statusCode = response.statusCode;
  final body = json.decode(response.body);
  print(body);
  if (statusCode == 200) {
    categories = (body as List).map((i) => CategoryModel.fromJson(i)).toList();
    return categories;
  } else {
    return categories = [];
  }
}
