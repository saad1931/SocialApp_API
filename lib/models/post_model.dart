// ignore_for_file: camel_case_types, prefer_collection_literals, unnecessary_new, unnecessary_this

class post_model {
  int? userId;
  int? id;
  String? title;
  String? body;

  post_model({this.userId, this.id, this.title, this.body});

  post_model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
