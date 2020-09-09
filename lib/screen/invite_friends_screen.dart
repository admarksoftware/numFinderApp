import 'package:flutter/material.dart';

class InvitefriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InviteFirendsScreenText(),
        Expanded(
            child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SocialMediaInviteIcon(iconName: "WhatsApp",image:"assets/whatsapp.png"),
                        SocialMediaInviteIcon(iconName: "Telegram",image: "assets/telegram.png"),
                        SocialMediaInviteIcon(iconName: "Twitter",image: "assets/twitter.png"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        children: [
                          SocialMediaInviteIcon(iconName: "Sms",image: "assets/sms.png"),
                          SocialMediaInviteIcon(iconName: "Diger",image: "assets/more.jpg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            )
          ],
        )),
      ]),
    );
  }
}

class SocialMediaInviteIcon extends StatelessWidget {
  final String iconName;
  final String image;

  const SocialMediaInviteIcon({this.iconName, this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 45,backgroundImage: AssetImage(image),
        ),
        SizedBox(height: 10),
        Text(iconName, style: TextStyle(fontSize: 16)),
      ],
    ));
  }
}


class InviteFirendsScreenText extends StatelessWidget {

  final String promotion;
  final String head;
  final String image;

  const InviteFirendsScreenText({this.promotion, this.head, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5 - 30,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
             head ?? "Ücretsiz Yükseltin",
            style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              promotion ??
              "30 Gün Pro NumFinder katılma davetinizi kabul eden her arkadaşınız için yüseltme",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: AssetImage("assets/phone.png"),
            radius: 55),
        ],
      ),
    );
  }
}
