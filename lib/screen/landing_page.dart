import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/auth_bloc.dart';
import 'package:flutter_app/styles/textfields.dart';
import 'package:flutter_app/widgets%20/button.dart';
import 'package:provider/provider.dart';

class Landing extends StatelessWidget {

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return pageBody(
      authBloc,
      context,
    );
  }

  Widget pageBody(
    AuthBloc authBloc,
    BuildContext context,
  ) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
              stream: authBloc.number,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    height: 50,
                    child: CupertinoTextField(
                      placeholder: "Number",
                      textAlign: TextAlign.center,
                      placeholderStyle: TextFieldStyles.placeholder,
                      decoration: TextFieldStyles.cupertinoDecoration,
                      controller: _controller,
                      onChanged: (value) {
                        value = _controller.text;
                      },
                    ),
                  ),
                );
              }),
          StreamBuilder<bool>(
              stream: null,
              builder: (context, snapshot) {
                return AppButton(
                    buttonText: 'save number',
                    onPressed: () async {
                      /*
                      Firestore _db = Firestore.instance;
                      await _db
                          .collection("users")
                          .document(authBloc.userId)
                          .updateData({
                        "number": _controller.text,
                      });
                      Navigator.pushNamed(context,"/home");

                       */
                    });
              }),
        ],
      ),
    );
  }
}
