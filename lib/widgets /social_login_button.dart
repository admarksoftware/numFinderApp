import 'package:flutter/material.dart';
import 'package:flutter_app/styles/base.dart';
import 'package:flutter_app/styles/buttons.dart';
import 'package:flutter_app/styles/colors.dart';
class SocialLoginButton extends StatelessWidget {

  final String image;
  final Color color;
  final String text;
  final Function() onPress;

  const SocialLoginButton({Key key, this.image, this.color, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: color,
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
                                image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png")),
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(width: 50),
              Text( text ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
