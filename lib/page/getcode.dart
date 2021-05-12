import 'package:flutter/material.dart';
import 'getnewpass.dart';

void main() {
  runApp(GetCodePage());
}

class GetCodePage extends StatefulWidget {
  GetCodePage({Key key}) : super(key: key);

  @override
  _GetCodePageState createState() => _GetCodePageState();
}

class _GetCodePageState extends State<GetCodePage> {
  @override
  Widget build(BuildContext context) {
    final TextField _txtEnterCode = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter Code',
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
              ("Forgot Password?"),
              style: TextStyle(
                color: Color(0xffffc66c),
                fontSize: 18,
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(
              top: 10,
            ),
            child: new Text(
              ("We will send code on your mail. Plase check your mail."),
              style: TextStyle(
                color: Color(0xffFFC727),
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 20, left: 30, right: 30),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: _txtEnterCode,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don't get code? "),
            new InkWell(
              child: new Text(
                "Resend Code.",
                style: TextStyle(
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => {},
            )
          ]),
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetNewPassPage()));
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
