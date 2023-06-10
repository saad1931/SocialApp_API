import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:socialapp/models/users_model.dart';

getUsers() async {
  List<users_model> userlist = [];
  String url = "https://jsonplaceholder.typicode.com/users";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());

  // print("Response: $response"); 
  // print("Data: $data"); 

  for (var i in data) {
    userlist.add(users_model.fromJson(i));
  }
  return userlist;
}
