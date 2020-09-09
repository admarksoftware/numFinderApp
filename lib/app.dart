import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/auth_bloc.dart';
import 'blocs/user_notifier.dart';
import 'routes.dart';
import 'screen/my_home_page.dart';
import 'screen/on_boarding.dart';
import 'services/firestore_service.dart';
import 'services/search_json.dart';

final authBloc = AuthBloc();
final firestoreService = FirestoreService();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => authBloc),
      ChangeNotifierProvider(create:  (context) => UserNotifier()),
      FutureProvider<bool>(create: (context) => authBloc.isLoggedIn()),
    ], child: PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = Provider.of<bool>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: (isLoggedIn == null)
            ? loadingScreen(true)
            : (isLoggedIn == true) ? MyHomePage() : OnBoardingPage(),
        onGenerateRoute: Routes.cupertinoRoutes);
  }

  Widget loadingScreen(bool isIOS) {
    return (isIOS)
        ? CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
