import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets%20/sync.dart';
import 'payment_ui/premium_home_screen.dart';
import 'screen/landing_page.dart';
import 'screen/login.dart';
import 'screen/my_home_page.dart';
import 'widgets /contact_list.dart';

abstract class Routes {

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return CupertinoPageRoute(builder: (context) => Landing());
      case "/profile":
        return CupertinoPageRoute(builder: (context) => ContactList());
      case "/login":
        return CupertinoPageRoute(builder: (context) => Login());
      case "/premiumHome":
        return CupertinoPageRoute(builder: (context) => PremiumHome());
      case "/sync":
        return CupertinoPageRoute(builder: (context) => SyncPage());
      case "/home":
        return CupertinoPageRoute(builder: (context) => MyHomePage());
      default:
        return CupertinoPageRoute(builder: (context) => Login());
    }
  }
}
