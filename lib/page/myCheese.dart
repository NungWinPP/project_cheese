import 'package:flutter/material.dart';

class MyCheese extends StatefulWidget {
  @override
  _MyCheeseState createState() => _MyCheeseState();
}

class _MyCheeseState extends State<MyCheese> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cheese"),
      ),
      body: Center(
        child: Text(
          "My Cheese Page",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
