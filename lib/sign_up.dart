import 'package:flutter/material.dart';

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final TextField _txtEnterName = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter Name',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtEnterDateOfBirth = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter Date of birth',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtEnterMail = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter Mail',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtEnterPassword = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter Password',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtConfirmPassword = new TextField(
      decoration: new InputDecoration(
        hintText: 'Confirm Password',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    return Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 100,
            height: 100,
            child: new Image.asset(
              'images/cheese.png',
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 20, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterName,
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterDateOfBirth,
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterMail,
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterPassword,
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtConfirmPassword,
          ),
          new Container(
            margin: EdgeInsets.only(left: 100, right: 100, top: 10),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new RaisedButton(
                  child: new Text("Sign up"),
                  textColor: Colors.black,
                  color: Color(0xffffc66c),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  onPressed: () {},
                ))
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFFEF391),
    );
  }
}
