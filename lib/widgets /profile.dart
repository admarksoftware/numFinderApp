import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/auth_bloc.dart';
import 'package:flutter_app/models/user.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);

    Widget pageBody(AuthBloc authBloc, BuildContext context, String userId) {
      return StreamBuilder<List<User>>(
          stream: null,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return (Platform.isIOS)
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator();

            return CupertinoPageScaffold(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var users = snapshot.data[index];
                            return GestureDetector();
                          }),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return CupertinoPageScaffold(
        child: pageBody(authBloc, context, authBloc.userId));
  }
}
