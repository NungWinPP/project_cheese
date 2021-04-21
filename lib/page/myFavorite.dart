import 'package:flutter/material.dart';

class MyFavorite extends StatefulWidget {
  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite"),
      ),
      body: Center(
        child: Text(
          "My Favorite Page",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
