import 'package:flutter/material.dart';
import 'home.dart';
import 'si_su.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'forgotpass.dart';
import 'getcode.dart';
import 'uploadimage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'mycheese_add.dart';

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
    debugShowCheckedModeBanner: false,
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
    return Sin_Sout_Page();
  }
}
