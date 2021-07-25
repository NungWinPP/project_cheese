import 'package:flutter/material.dart';
import 'sign_in.dart';

void main() {
  runApp(GetNewPassPage());
}

class GetNewPassPage extends StatefulWidget {
  GetNewPassPage({Key key}) : super(key: key);

  @override
  _GetNewPassPageState createState() => _GetNewPassPageState();
}

class _GetNewPassPageState extends State<GetNewPassPage> {
  @override
  Widget build(BuildContext context) {
    final TextField _txtEnterNewPass = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter New Password',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtConfirmNewPass = new TextField(
      decoration: new InputDecoration(
        hintText: 'Confirm New Password',
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
            width: 500,
            height: 400,
            child: new Image.asset(
              'images/forgotpass.png',
            ),
          ),
          new Container(
            child: new Text(
              ("Enter New Password?"),
              style: TextStyle(
                color: Color(0xffffc66c),
                fontSize: 18,
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 20, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterNewPass,
          ),
          new Container(
            margin: new EdgeInsets.only(top: 20, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtConfirmNewPass,
          ),
          new Container(
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
              top: 10,
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new RaisedButton(
                  onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SigninPage()))
                  },
                  child: new Text("Confirm"),
                  textColor: Colors.black,
                  color: Color(0xffffc66c),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
