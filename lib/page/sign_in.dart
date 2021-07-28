import 'forgotpass.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import '../controllers/auth.dart';

void main() {
  runApp(SigninPage());
}

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final TextField _txtEnterMail = new TextField(
      onChanged: (val) {
        setState(() => email = val);
      },
      decoration: new InputDecoration(
        hintText: 'Email',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtEnterPassword = new TextField(
      obscureText: true,
      onChanged: (val) {
        setState(() => password = val);
      },
      decoration: new InputDecoration(
        hintText: 'Password',
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
            width: 150,
            height: 150,
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
              margin: EdgeInsets.only(top: 5, right: 40),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                new InkWell(
                  child: new Text("Forgot password"),
                  onTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassPage()))
                  },
                )
              ])),
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
                  child: new Text("Sign in"),
                  textColor: Colors.black,
                  color: Color(0xffffc66c),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  onPressed: () async {
                    await _auth.signInWithEmailAndPassword(email, password);
                  },
                ))
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Do you have an account? "),
            new InkWell(
              child: new Text(
                "Sign up.",
                style: TextStyle(
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignupPage()))
              },
            )
          ]),
        ],
      ),
      backgroundColor: Color(0xFFFEF391),
    );
  }
}
