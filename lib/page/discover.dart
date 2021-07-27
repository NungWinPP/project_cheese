import 'package:csc234_project_cheese/components/fav_box.dart';
import 'package:csc234_project_cheese/models/cheese.dart';
import 'package:csc234_project_cheese/provider/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
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

  List<Cheese> allCheeseList;
  Future<void> getCheeseList() async {
    print('getCheeseList has been called');
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        setState(() {
          this._userId = event.uid;
        });
        List<Cheese> cheeselist =
            await DatabaseService(uid: event.uid).allCheese;
        setState(() {
          allCheeseList = cheeselist;
        });
        print('Here iss ');
        allCheeseList.forEach((cheese) {
          print('title : ${cheese.title} author : ${cheese.author}');
        });
      });
    });
    print('_userId $_userId');
  }

  @override
  void initState() {
    getCheeseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUserId();
    return StreamProvider<List<Cheese>>.value(
        initialData: null,
        value: DatabaseService(uid: _userId).myCheese,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Discover"),
              backgroundColor: Color(0xFFFFC66C),
            ),
            // body: Center(
            //     child: Container(
            //   margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            //   color: Colors.red,
            // )),
            body: allCheeseList == null
                ? Center(
                    child: Image.asset(
                      'images/cheese3.gif',
                      width: 150,
                      height: 150,
                    ),
                  )
                : GridView(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    children: allCheeseList
                        .map((catData) => FavBox(
                              author: catData.author,
                              favList: catData.fav,
                              id: catData.id,
                              title: catData.title,
                              url: catData.url,
                            ))
                        .toList(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                  ),
          );
        });
  }
}
