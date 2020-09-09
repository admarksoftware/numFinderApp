import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> addUser(User user) async {
    return _db.collection('users').document(user.userId).setData(user.toMap());
  }

  Future<User> fetchUser(String userId) {
    return _db
        .collection('users')
        .document(userId)
        .get()
        .then((snapshot) => User.fromFirestore(snapshot.data));
  }

  Stream<List<User>> fetchUserId(String userId) {
    return _db
        .collection('users')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((query) => query.documents)
        .map((snapshot) => snapshot
        .map((document) => User.fromFirestore(document.data))
        .toList());
  }

  Future<QuerySnapshot> fetchContact() {
    return  _db.collection('contact').getDocuments();
  }

  Stream<List<User>> fetchProfileByVendorId(String contactUserName) {
    return _db
        .collection('contact')
        .where('contactUserName', isEqualTo: contactUserName)
        .snapshots()
        .map((query) => query.documents)
        .map((snapshot) => snapshot
        .map((document) => User.fromFirestore(document.data))
        .toList());
  }

  Future<void> setProfile(User user) {
    return _db
        .collection('users')
        .document(user.userId)
        .setData(user.toMap());
  }

  Future<void> setNumber(User user) {
    return _db
        .collection('users')
        .document(user.userId)
        .setData(user.toMap());
  }

  Stream<List<User>> fetchUserName(String name) {
    return _db
        .collection('users')
        .where('name', isEqualTo: name)
        .snapshots()
        .map((query) => query.documents)
        .map((snapshot) => snapshot
        .map((document) => User.fromFirestore(document.data))
        .toList());
  }
}
