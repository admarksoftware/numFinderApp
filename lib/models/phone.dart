class Phone {
  String phone = "";

  Phone({this.phone});

  Map<String, dynamic> toJson() {
    return {
      "contactUserPhone": phone,
    };
  }
}