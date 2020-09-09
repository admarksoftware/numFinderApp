import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  getAllContacts() async {
    await ContactsService.getContacts();
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image(image: NetworkImage("https://image.freepik.com/free-vector/isometric-mobile-phone-with-apps-services_23-2148273358.jpg"),),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height:100),
          Expanded(
            child: IntroductionScreen(
              key: introKey,
              pages: [
                PageViewModel(
                  title: "",
                  body: "Aramaya cevap vermeden önce sizi kimin aradığını bilin",
                  image: _buildImage('phone'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "",
                  body: "Kişilernizi güncel tutun",
                  image: _buildImage('img2'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "",
                  body:
                      "Dünya genelinde herhangi bir numara için araştırma yapın ve arayan bilgilerini edinin",
                  image: _buildImage('img3'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "",
                  body:
                      "İstenmeyen aramaları, pazarlama aramalarını ve dolandırıcıları engelleyin",
                  image: _buildImage('img2'),
                  footer: Container(),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Kişilere izin verin",
                  footer: RaisedButton(
                    onPressed: () {
                      getAllContacts();
                    },
                    child: const Text(
                      'Kabul Et',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  bodyWidget: Container(),
                  image: _buildImage('img1'),
                  decoration: pageDecoration,
                ),
              ],
              onDone: () => _onIntroEnd(context),
              //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
              showSkipButton: true,
              skipFlex: 0,
              nextFlex: 0,
              skip: const Text('Geç'),
              next: const Icon(Icons.arrow_forward),
              done: const Text('Bitti', style: TextStyle(fontWeight: FontWeight.w600)),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Color(0xFFBDBDBD),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
