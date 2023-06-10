// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:socialapp/provider/user_provider.dart';
import 'package:socialapp/utils/colors.dart';

import '../services/post_services.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    int loggedInUserId = userProvider.loggedInUser?.id ?? -1;

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  bool isLoggedUserPost =
                      snapshot.data[index].userId == loggedInUserId;

                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].title.toString(),
                        style: TextStyle(
                          fontWeight: isLoggedUserPost ? FontWeight.bold:null,
                          color: isLoggedUserPost ? primarycolor : null,
                        ),
                      ),
                      subtitle: Text(snapshot.data[index].body.toString()),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
