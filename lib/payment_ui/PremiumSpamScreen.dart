import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PremiumSpamScreen extends StatelessWidget {
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
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
