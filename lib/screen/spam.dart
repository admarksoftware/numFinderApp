import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/premium_page.dart';


class Spam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(bottom: TabBar(
          tabs: [
            Tab(child: Text("Spam List")),
            Tab(child: Text("Spam Ekle")),
          ],
        )),
        body: TabBarView(children: [
          Column(children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPage()));
                    },
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://w7.pngwing.com/pngs/220/215/png-transparent-diamond-illustration-gemstone-diamond-icon-diamond-blue-angle-ring.png"),
                        radius: 25,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.blue),
                    title: Text(
                      "Premium'a yükseltin",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Tüm özellikleri aç. Ücretsiz Dene!",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(
                              "Türkcell Müşteri Hizmetleri",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "442 0 532",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ]),
          Column(children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPage()));
                    },
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://w7.pngwing.com/pngs/220/215/png-transparent-diamond-illustration-gemstone-diamond-icon-diamond-blue-angle-ring.png"),
                        radius: 25,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.blue),
                    title: Text(
                      "Premium'a yükseltin",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Tüm özellikleri aç. Ücretsiz Dene!",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIcon:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'TR',
                                    showFlagDialog: true,
                                    comparator: (a, b) => b.name.compareTo(a.name),
                                    onInit: (code) =>
                                        print("on init ${code.name} ${code.dialCode} ${code.name}"),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                    onTap: (){},
                                    child: Icon(Icons.add)),
                                labelText: 'Numara',
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Theme.of(context).primaryColor))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(
                              "Türkcell Müşteri Hizmetleri",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "442 0 532",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ]),
        ],)
      ),
    );
  }
}
