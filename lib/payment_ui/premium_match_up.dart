import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets%20/sync.dart';


class PremiumMatchUp extends StatefulWidget {
  @override
  _PremiumMatchUpState createState() => _PremiumMatchUpState();
}

class _PremiumMatchUpState extends State<PremiumMatchUp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
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
