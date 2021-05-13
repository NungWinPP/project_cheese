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
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    width: 100,
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.white,
                      radius: 50.0,
                    ),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Color(0xffffc66c),
                        width: 7.0,
                      ),
                    ),
                  ),
                  /*Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),*/
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    color: Color(0xFFC4C4C4),
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 22),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Like",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "1.2K",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFC4C4C4),
                              border: Border.all(color: Color(0xFFC4C4C4))),
                          child: Row(children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Name: ${user.displayName}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(children: [
                                        Expanded(
                                          child: Text(
                                            "          Mail: ${user.email}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ]))),
                ]))));
  }
}
