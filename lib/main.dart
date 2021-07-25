import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/si_su.dart';
import 'page/sign_in.dart';
import 'page/sign_up.dart';
import 'page/forgotpass.dart';
import 'page/getcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'page/mycheese_add.dart';
import 'controllers/warpper.dart';
import 'controllers/auth.dart';
import 'package:provider/provider.dart';
import 'controllers/user.dart';

void main() async {
  Map<int, Color> color = {
    50: Color.fromRGBO(255, 198, 108, .1),
    100: Color.fromRGBO(255, 198, 108, .2),
    200: Color.fromRGBO(255, 198, 108, .3),
    300: Color.fromRGBO(255, 198, 108, .4),
    400: Color.fromRGBO(255, 198, 108, .5),
    500: Color.fromRGBO(255, 198, 108, .6),
    600: Color.fromRGBO(255, 198, 108, .7),
    700: Color.fromRGBO(255, 198, 108, .8),
    800: Color.fromRGBO(255, 198, 108, .9),
    900: Color.fromRGBO(255, 198, 108, 1),
  };
  MaterialColor colorCustom = MaterialColor(0xFFFFC66C, color);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var materialApp = MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: colorCustom,
    ),
  );
  runApp(materialApp);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
