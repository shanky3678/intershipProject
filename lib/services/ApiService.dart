import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  bool ok;
  dynamic data;
  Api(this.ok, this.data);
}

const PROTOCOL = 'http';
const DOMAIN = "192.168.184.17";

Future<Api> create_user(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "http://192.168.184.17:5000/$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}

Future<Api> create_order(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "http://192.168.184.17:5000/$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}

Future<Api> getUser(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  print(dataStr);
  var url = "http://192.168.184.17:5000/$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return Api(true, jsonDecode(result.body));
}
