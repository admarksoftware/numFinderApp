import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/firestore_service.dart';
import 'package:flutter_app/services/search_json.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';


class AuthBloc {
  final _email = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _photo = BehaviorSubject<String>();
  final _number = BehaviorSubject<String>();
  final _userProfileId = BehaviorSubject<String>();
  final _profileSaved = PublishSubject<bool>();
  final _profile = BehaviorSubject<User>();
  final _user = BehaviorSubject<User>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirestoreService();
  var uuid = Uuid();
  final facebookDB = FacebookLogin();

  //Get Data
  Stream<String> get name => _name.stream;

  Stream<String> get number => _number.stream;

  Stream<String> get photo => _photo.stream;

  Stream<String> get userProfileId => _userProfileId.stream;

  Stream<User> get user => _user.stream;

  String get userId => _user.value.userId;

  Future<User> fetchUser() => db.fetchUser(userId);
  Stream<List<User>> fetchUserNames(String name) => db.fetchUserName(userId);
  Stream<List<User>> profileByVendorId() => db.fetchProfileByVendorId(userId);
  Future fetchContact() => db.fetchContact();

  //Set Data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changeName => _name.sink.add;

  Function(String) get changePhoto => _photo.sink.add;

  Function(String) get changeNumber => _number.sink.add;

  Function(String) get changeProfileId => _userProfileId.sink.add;

  Function(User) get changeProfile => _profile.sink.add;

  dispose() {
    _email.close();
    _name.close();
    _profile.close();
    _number.close();
    _photo.close();
    _profileSaved.close();
    _userProfileId.close();
    _user.close();
  }

  //Functions
  Future<void> saveProfile() async {
    var user = User(
      name: _name.value,
      email: _email.value ?? null,
      userId: (_profile.value != null) ? uuid.v4() : _profile.value.userId,
    );
    return db
        .setProfile(user)
        .then((value) => _profileSaved.sink.add(true))
        .catchError((error) => _profileSaved.sink.add(false));
  }

  Future<bool> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult authResult = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        var user = User(
            userId: authResult.user.uid,
            email: authResult.user.email,
            name: authResult.user.displayName,
            number: authResult.user.phoneNumber,
            photo: authResult.user.photoUrl);
        await db.addUser(user);
        _user.sink.add(user);
      } else {}
    } else {}
  }

  Future<bool> signInWithFacebook() async {
    final _facebookLogin = FacebookLogin();
      FacebookLoginResult _faceResult = await _facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (_faceResult.status) {
      case FacebookLoginStatus.Success:
        if (_faceResult.accessToken != null) {
          AuthResult authResult = await _auth.signInWithCredential(
              FacebookAuthProvider.getCredential(
                  accessToken: _faceResult.accessToken.token));
          var user = User(
              userId: authResult.user.uid,
              email: authResult.user.email,
              name: authResult.user.displayName,
              photo: authResult.user.photoUrl);
          await db.addUser(user);
          _user.sink.add(user);
        } else {}
        break;

      case FacebookLoginStatus.Cancel:
        print("kullanıcı facebook girişi iptal etti");
        break;

      case FacebookLoginStatus.Error:
        print("Hata cıktı :" + _faceResult.error.toString());
        break;
    }

    return null;
  }



  Future<bool> isLoggedIn() async {
    var firebaseUser = await _auth.currentUser();
    if (firebaseUser == null) return false;

    var user = await db.fetchUser(firebaseUser.uid);
    if (user == null) return false;
    _user.sink.add(user);
    return true;
  }

  logout() async {
    final _facebookLogin = FacebookLogin();
    await _facebookLogin.logOut();

    final _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();

    await _auth.signOut();
    _user.sink.add(null);
  }

}