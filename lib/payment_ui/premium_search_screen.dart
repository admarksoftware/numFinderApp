import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/contact/search_contact.dart';
import 'package:flutter_app/screen/number_search.dart';
import 'package:flutter_app/screen/premium_page.dart';
import 'package:flutter_app/styles/text.dart';

class PremiumSearch extends StatefulWidget {
  @override
  _PremiumSearchState createState() => _PremiumSearchState();
}

class _PremiumSearchState extends State<PremiumSearch> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // getUser(userNotifer);
    // _updateContact();
    searchController.addListener(() {
      filterContacts();
    });
  }
/*
  getUser(UserNotifier userNotifier) async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("users")
        .where("contact")
        .getDocuments();
    List<User> _userList = [];
    querySnapshot.documents.forEach((document) {
      User user = User.fromFirestore(document.data);
      _userList.add(user);
    });
    userNotifier.userList = _userList;
  }
  */

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }
/*
  "_updateContact() async {
    var contacts = (await ContactsService.getContacts()).toList();
    List<MyContact> myContacts = List<MyContact>();
    contacts.forEach((contact) {
      List<Phone> phones = List<Phone>();
      contact.phones.forEach((phone) {
        phones.add(Phone(phone: phone.value));
      });
      myContacts.add(MyContact(
          userName: contact.displayName, phone: contact.phones.first.value));
    });

    Map<String, dynamic> map = {
      'contact': myContacts.map((myContact) => myContact.toJson()).toList()
    };
    await Firestore.instance
        .collection("contact")
        .document(authBloc.userId)
        .updateData(map);
  }*/

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }
        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });

      setState(() {
        contactsFiltered = _contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("App Name", style: TextStyles.head)]),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberSearch()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            textAlign: TextAlign.center,
                            controller: searchController,
                            decoration: InputDecoration(
                                hintText: "1 milyar insan ara",
                                hintStyle: TextStyle(color: Colors.white54),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                suffixIcon:
                                Icon(Icons.search, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Premium Hesap",style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Son Aramalar",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return ListTile(
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blue[600],
                                child: Text("TH",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                foregroundColor: Colors.blue),
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
            ),
          ],
        ),
      ),
    );
  }
}
