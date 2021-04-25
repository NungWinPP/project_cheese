import 'package:flutter/material.dart';
import 'home.dart';
import 'si_su.dart';
import 'uploadimage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var materialApp = MaterialApp(
    home: MyApp(),
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
    return UploadImagePage();
  }
}
