import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user.dart';

class UserNotifier with ChangeNotifier {
  List<User> _userList = [];
  User _currentUser;

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  User get currentUser => _currentUser;

  set userList(List<User> userList){
    _userList = userList;
    notifyListeners();
  }
  set currentUser(User user){
    _userList = user as List<User>;
    notifyListeners();
  }
}