import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets%20/sync.dart';

import 'premium_page.dart';

class MatchUp extends StatefulWidget {
  @override
  _MatchUpState createState() => _MatchUpState();
}

class _MatchUpState extends State<MatchUp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPage()));
                },
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://w7.pngwing.com/pngs/220/215/png-transparent-diamond-illustration-gemstone-diamond-icon-diamond-blue-angle-ring.png"),
                    radius: 25,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.blue),
                title: Text(
                  "Premium'a yükseltin",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Tüm özellikleri aç. Ücretsiz Dene!",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("Eşleştirmek için dokunun",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 50),
                      Text(
                          "Kişilerinizi son profil fotoğrafları ve bigileriyle güncelleyin",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SyncPage())),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.sync, color: Colors.blue, size: 100),
                        ),
                      ),
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
