import 'dart:async';

import 'package:csc234_project_cheese/page/sign_in.dart';
import 'package:csc234_project_cheese/page/sign_up.dart';
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
      padding: EdgeInsets.all(145),
      child: Image.asset(
        'images/cheese3.gif',
        width: 150,
        height: 150,
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
              margin: const EdgeInsets.only(top: 200),
              child: Image.asset(
                'images/cheese.png',
                width: 150,
                height: 150,
              )),
          SizedBox(
            child: Container(
              height: 75,
            ),
          ),
          ButtonBar(
            buttonPadding:
                EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SigninPage()))
                },
                color: Color(0xffffc66c),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              RaisedButton(
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupPage()))
                },
                color: Color(0xffffc66c),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: Text(
                  'Sign Up',
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
