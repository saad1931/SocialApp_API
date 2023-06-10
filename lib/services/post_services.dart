import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:socialapp/models/post_model.dart';

getPosts() async {
  List postlist = [];
  String url = "https://jsonplaceholder.typicode.com/posts";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  
  

  for (var i in data) {
    postlist.add(post_model.fromJson(i));
  }
  return postlist;
}