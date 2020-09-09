import 'package:flutter/material.dart';
import 'package:flutter_app/styles/text.dart';


class LoginPageIcon extends StatelessWidget {

  final String title;

  const LoginPageIcon({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 300,
        width: 300,
        child: Center(
          child: Container(
            height: 290,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Center(
              child: Text( title ?? "NumFinder", style: TextStyles.loginHead),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}



