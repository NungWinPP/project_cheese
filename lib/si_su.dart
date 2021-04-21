import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(Signin_Signup_Page());
}

class Signin_Signup_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Sin_Sout_Page())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(150),
      child: Image.asset(
        'images/cheese3.gif',
        width: 50,
        height: 50,
      ),
      color: Color(0xFFFEF391),
    );
  }
}

class Sin_Sout_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEF391),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 300, bottom: 35),
              child: Image.asset(
                'images/cheese.png',
                width: 100,
                height: 100,
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                color: Color(0xffffc66c),
                child: Text(
                  'sign up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              RaisedButton(
                onPressed: () => {},
                color: Color(0xffffc66c),
                child: Text(
                  'sign in',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
