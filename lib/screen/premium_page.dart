import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/styles/base.dart';
import 'package:flutter_app/styles/buttons.dart';
import 'package:flutter_app/widgets%20/button.dart';

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container())
,          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pro Olun",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("30 gün boyunca ücretsiz olarak deneyin")],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: ButtonStyles.buttonHeight,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.circular(BaseStyles.borderRadius),
                            boxShadow: BaseStyles.boxShadow),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Premium",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              child: Icon(
                            Icons.person,
                          )),
                          SizedBox(height: 5),
                          Text("Özellik 1")
                        ],
                      ),
                    )),
                    Flexible(
                        child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              child: Icon(
                            Icons.person,
                          )),
                          SizedBox(height: 5),
                          Text("Özellik 2")
                        ],
                      ),
                    )),
                    FeatureWidgets(
                      name: "Özellik 3 ",
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                          child: Container(
                        height: 100,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              Icons.person,
                            )),
                            SizedBox(height: 5),
                            Text("Özellik 4")
                          ],
                        ),
                      )),
                      Flexible(
                          child: Container(
                        height: 100,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              Icons.person,
                            )),
                            SizedBox(height: 5),
                            Text("Özellik 5")
                          ],
                        ),
                      )),
                      Flexible(
                          child: Container(
                        height: 100,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              Icons.person,
                            )),
                            SizedBox(height: 5),
                            Text("Özellik 6")
                          ],
                        ),
                      )),
                    ]),
                SizedBox(height: 10),
                Flexible(
                  child: Container(
                    height: 100,
                    child: CarouselSlider(
                      options: CarouselOptions(height: 100, autoPlay: true),
                      items: [
                        Container(
                          child: Text("Yorum"),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      onPressed: ()=> Navigator.pushNamedAndRemoveUntil(context, "/premiumHome", (route) => false),
                        buttonText: "Devam Et", buttonType: ButtonType.Google),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "30 günlük ücretsiz denemeye başlayın\nsonrasında aylık 15.00 TL",
                                textAlign: TextAlign.center)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class FeatureWidgets extends StatelessWidget {

  final Color color;
  final String name;
  final String png;

  const FeatureWidgets({this.color, this.name, this.png});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          height: 100,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  child: Icon(
                    Icons.person,
                  )),
              SizedBox(height: 5),
              Text(name)
            ],
          ),
        ));
  }
}
