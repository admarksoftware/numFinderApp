
import 'package:flutter_app/models/phone.dart';

class MyContact {
  String userName = "";
  String phone = "";
  List<Phone> phones = List<Phone>();

  MyContact({this.userName, this.phones,this.phone});

  Map<String, dynamic> toJson() {
    return {
      "contactUserName": userName,
      "contactUserPhone": phone,
    };
  }
}

class DemoContact {
  String userName = "";
  String phone = "";
  List<Phone> phones = List<Phone>();

  DemoContact({this.userName, this.phones,this.phone});

  Map<String, dynamic> toJson() {
    return {
      "contactUserName": userName,
      "contactUserPhone": phone,
    };
  }
}