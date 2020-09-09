class User {
  final String userId;
  final String email;
  final String name;
  final String number;
  final String contactUserName;
  final String contactUserPhone;
  final String photo;
  final List contact;

  User(
      {this.number,
      this.contactUserName,
      this.contactUserPhone,
      this.name,
      this.email,
      this.userId,
      this.photo,
      this.contact});

  @override
  String toString() {
    return 'User{userId: $userId, email: $email, name: $name, number: $number, contactUserName: $contactUserName, contactUserPhone: $contactUserPhone, photo: $photo, contact: $contact}';
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'number': number,
      'name': name,
      "photoUrl": photo,
      "contact": contact,
    };
  }

  User.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'],
        contactUserName = firestore['contactUserName'],
        contactUserPhone = firestore['contactUserPhone'],
        name = firestore['name'],
        contact = firestore['contact'],
        photo = firestore['photoUrl'],
        number = firestore['number'];
}
