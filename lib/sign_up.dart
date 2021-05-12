import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'auth.dart';

void main() {
  runApp(SignupPage());
}

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';
  String _date = "Your Date of Birth";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextField _txtEnterName = new TextField(
      decoration: new InputDecoration(
        hintText: 'Your Name',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextButton _txtEnterDateOfBirth = new TextButton(
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(1921, 12, 31),
            maxTime: DateTime(2021, 12, 31),
            theme: DatePickerTheme(
                headerColor: Color(0xFFFEF391),
                backgroundColor: Color.fromARGB(255, 240, 240, 240),
                itemStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
                doneStyle: TextStyle(color: Color(0xffffc66c), fontSize: 16)),
            onConfirm: (date) {
          print('confirm $date');
          _date = '${date.year} - ${date.month} - ${date.day}';
          setState(() {});
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        " $_date",
                        style: TextStyle(
                            color: Color(0xFF616161),
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    final TextField _txtEnterMail = new TextField(
      onChanged: (val) {
        setState(() => email = val);
      },
      decoration: new InputDecoration(
        hintText: 'Your Email',
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
        hintText: 'Your Password',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
    );
    final TextField _txtConfirmPassword = new TextField(
      decoration: new InputDecoration(
        hintText: 'Confirm Your Password',
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
            width: 50,
            height: 50,
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
                    child: new Text("Sign Up"),
                    textColor: Colors.black,
                    color: Color(0xffffc66c),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () async {
                      await _auth.registerWithEmailAndPassword(email, password);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFEF391),
    );
  }
}
