import 'package:flutter/material.dart';
import 'package:socialapp/screens/posts_screen.dart';
import 'package:socialapp/screens/user_profile.dart';
import 'package:socialapp/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child:const Icon(Icons.add),
          ),
        appBar: AppBar(
          backgroundColor: primarycolor,
          title:const Text("Home Screen"),
           leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {}
          ),
           actions: [
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 30),
                onPressed: () {},
              ),
            ),
          ],
           bottom: const TabBar(
            tabs: [
              Tab(text: 'ALL POSTS'),
              Tab(text: 'PROFILE'),
            ],
          ),
        ),
        body:  TabBarView(
          children:[
            const PostScreen(),
            UserProfileScreen(),
          ] 
          ),
      ),
    );
  }
}