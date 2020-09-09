import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/search_json.dart';
import 'package:http/http.dart' as http;





typedef KeyboardTapCallback = void Function(String text);

class NumberSearch extends StatefulWidget {

  @override
  _NumberSearchState createState() => _NumberSearchState();
}

class _NumberSearchState extends State<NumberSearch> {
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Dünya çapında 1 milyardan fazla kişi arama",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CountryCodePicker(
                                        onChanged: print,
                                        textStyle: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        initialSelection: 'TR',
                                        showFlagDialog: true,
                                        comparator: (a, b) =>
                                            b.name.compareTo(a.name),
                                        onInit: (code) => print(
                                            "on init ${code.name} ${code.dialCode} ${code.name}")),
                                    SizedBox(height: 22),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  maxLengthEnforced: true,
                                  maxLength: 11,
                                  maxLines: 1,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: text ,
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                  ),
                ),
                NumericKeyboard(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onKeyboardTap: _onKeyboardTap,
                  textColor: Colors.blue,
                  rightButtonFn: () {
                    setState(() {
                      text = text.substring(0, text.length - 1);
                    });
                  },
                  rightIcon: Icon(
                    Icons.backspace,
                    color: Colors.red,
                  ),
                  leftButtonFn: () {
                  getNumbers();
                  },
                  leftIcon: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}

class NumericKeyboard extends StatefulWidget {
  final Color textColor;
  final Icon rightIcon;
  final Function() rightButtonFn;
  final Icon leftIcon;
  final Function() leftButtonFn;
  final KeyboardTapCallback onKeyboardTap;
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key key,
      @required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.leftButtonFn,
                    child: Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          child: widget.leftIcon),
                    )),
              ),
              _calcButton('0'),
              Flexible(
                child: InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.rightButtonFn,
                    child: Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          child: widget.rightIcon),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return Flexible(
      child: InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          height: 70,
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ),
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
