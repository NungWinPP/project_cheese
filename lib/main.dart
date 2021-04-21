import 'package:flutter/material.dart';
import 'home.dart';
import 'page/discover.dart';
import 'page/myCheese.dart';
import 'page/myFavorite.dart';
import 'page/profile.dart';
import 'page/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheese',
      theme: ThemeData(
        primaryColor: Color(0xFFFFC66C),
      ),
      home: Home(),
    );
  }
}
