import 'package:flutter/material.dart';
import 'package:socialapp/models/users_model.dart';

class UserProvider extends ChangeNotifier {
  users_model? _loggedInUser;

  users_model? get loggedInUser => _loggedInUser;

  void setLoggedInUser(users_model user) {
    _loggedInUser = user;
    notifyListeners();
  }
}