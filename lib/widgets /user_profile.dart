import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {


  final String photoUrl;
  final String userName;
  final String userPhoneNumber;
  final String gender;
  final String surname;

  const UserProfile(
      {
        this.photoUrl,
        this.userName,
        this.userPhoneNumber,
        this.gender,
        this.surname
      });

  @override
  Widget build(BuildContext context) {
    Firestore _db = Firestore.instance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, right: 10, left: 20),
        child: Container(
          child: Column(
            children: [
              FutureBuilder(
                future: _db.collection("users").document(authBloc.userId).get(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 37,
                              backgroundColor: AppColors.google,
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data["photoUrl"] ?? "https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png"),
                                  radius: 35),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data["name"] ?? "Name",
                                    style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data["number"] ?? "",
                              style: TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],);
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
