import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pink_flamingo_app/utils/Urls.dart';

class Api {
  bool ok;
  dynamic data;
  Api(this.ok, this.data);
}

Future<Api> createUser(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "${Urls.ROOT_URL}$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}

Future<Api> createOrder(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "${Urls.ROOT_URL}$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}

Future<Api> login(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "${Urls.ROOT_URL}$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}
