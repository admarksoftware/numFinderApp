import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/auth_bloc.dart';
import 'package:flutter_app/styles/base.dart';
import 'package:flutter_app/styles/buttons.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:flutter_app/styles/text.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StreamSubscription _userSubscription;

  @override
  void initState() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);

    _userSubscription = authBloc.user.listen((user) {
      if (user != null) Navigator.pushReplacementNamed(context, '/home');
    });

    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return Scaffold(
      body: pageBody(context, authBloc),
    );
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
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
                    child: Text("NumFinder", style: TextStyles.loginHead),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: ButtonStyles.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.google,
                    borderRadius:
                    BorderRadius.circular(BaseStyles.borderRadius),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png")),
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Text("Sign in with Google",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            onTap: authBloc.signInWithGoogle),
          SizedBox(height: 10),
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: ButtonStyles.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.facebook,
                    borderRadius:
                    BorderRadius.circular(BaseStyles.borderRadius),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://i.pinimg.com/originals/41/b0/ed/41b0edd10bd1fcca1833c2e651fcfdaa.png")),
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.facebook),
                      ),
                      SizedBox(width: 50),
                      Text("Sign in with Facebook",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              onTap: authBloc.signInWithFacebook,
          ),
        ],
      ),
    );
  }
}
