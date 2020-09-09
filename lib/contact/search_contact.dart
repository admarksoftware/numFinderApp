import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/number_search.dart';
import 'package:flutter_app/screen/premium_page.dart';
import 'package:flutter_app/services/search_json.dart';
import 'package:flutter_app/styles/text.dart';
import 'package:http/http.dart' as http;

class SearchContact extends StatefulWidget {
  @override
  _SearchContactState createState() => _SearchContactState();
}
class _SearchContactState extends State<SearchContact> {
 final controller = TextEditingController();

  Future<UserNumber> _futureAlbum;
  String text = "905392462904";
  //905392462904
  getNumbers()  async {
    final searchAPI =
        "https://numbersearch.herokuapp.com/api/home/retrieveNumber?telephone=${text}";
    final http.Response response =
    await http.get(searchAPI, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization':
      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBhaW1laTM1MjRAZ21haWwuY29tIiwibmFtZSI6IllpZ2l0IFRhbmRvxJ9hbiIsInRlbGVwaG9uZSI6bnVsbCwiaW1hZ2VVcmwiOm51bGwsImlhdCI6MTU5OTU3NDc5OX0.-ovDjO95q62GXdjk1d1z7UP5vz9GL1iloSpw-owAJiM'
    });
    if (response.statusCode == 200) {
      print(response.body);
      return UserNumber.fromJson(json.decode(response.body));
    } else {
      debugPrint(response.body.toString());
      throw Exception(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("App Name", style: TextStyles.head)]),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberSearch()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          child: TextFormField(
                            controller:controller,
                            onChanged: (value){
                              setState(() {
                                value = controller.text;
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "1 milyar insan ara",
                                hintStyle: TextStyle(color: Colors.white54),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                suffixIcon:
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            text = controller.text;
                                            getNumbers();
                                          });
                                        },
                                        child: Icon(Icons.search, color: Colors.white))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => PremiumPage()));
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
                  Divider(color: Colors.black),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Son Aramalar",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
