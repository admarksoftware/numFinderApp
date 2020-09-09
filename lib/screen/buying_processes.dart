import 'package:flutter/material.dart';

class BuyingProcessesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Satın alma geçmişi",style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,color: Colors.black))),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hiç alışverişiniz yok",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 60),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/unlem.png"),
                      radius: 65),
                    SizedBox(height: 40),
                    Text("Pro Sürüme yükseltin ve tüm özellikleri kullanın",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                    SizedBox(height: 70),
                    RaisedButton(color: Colors.blue,child: Text("PRO'YA YÜKSELTİN",style: TextStyle(color: Colors.white),),onPressed: (){}),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
