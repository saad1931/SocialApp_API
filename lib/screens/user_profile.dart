// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialapp/provider/user_provider.dart';


import '../models/users_model.dart';


class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    users_model? loggedInUser = userProvider.loggedInUser;

    return Scaffold(
    
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Name:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                Text('${loggedInUser?.name}',style: const TextStyle(fontSize: 20),),
              ],
            ),
          ),
          const Divider(height: 1,color: Colors.black,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Username:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                Text('${loggedInUser?.username}',style: const TextStyle(fontSize: 20),),
              ],
            ),
          ),
          const Divider(height: 1,color: Colors.black,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Address:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                Text('${loggedInUser?.address?.street}',style: const TextStyle(fontSize: 20),),
              ],
            ),
          ),
           const Divider(height: 1,color: Colors.black,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Zip Code:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                Text('${loggedInUser?.address?.zipcode}',style: const TextStyle(fontSize: 20),),
              ],
            ),
          ),
          const Divider(height: 1,color: Colors.black,),
          // Text('Name: ${loggedInUser?.name}'),
          // Text('Email: ${loggedInUser?.email}'),
          // Display other user data as needed
        ],
      ),
    );
  }
}
