import 'package:csc234_project_cheese/controllers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  final User user = FirebaseAuth.instance.currentUser;
  String _userId;
  Future<void> getUserId() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        _userId = event.uid;
        print('uid of this user: $_userId');
        print(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xFFFFC66C),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
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
                  EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xffffc66c),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: Text(
                    "Name: ${user.displayName}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            ButtonBar(
              buttonPadding:
                  EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xffffc66c),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: Text(
                    "Email: ${user.email}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
