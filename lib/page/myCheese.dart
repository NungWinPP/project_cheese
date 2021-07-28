import '../models/cheese.dart';
import '../provider/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../components/cheese_item.dart';
import 'package:provider/provider.dart';
import 'mycheese_add.dart';

class MyCheese extends StatefulWidget {
  @override
  _MyCheeseState createState() => _MyCheeseState();
}

class _MyCheeseState extends State<MyCheese> {
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
        List<Cheese> templist = [];
        print('hello ${cheeselist.length}');
        cheeselist.forEach((cheese) {
          print('hi ${cheeselist.length}');
          if (cheese.uid == event.uid) {
            templist.add(cheese);
          }
          print('uid: ${cheese.uid}, appuid ${event.uid}');
          print('title : ${cheese.title} author : ${cheese.author}');
        });
        print('wow ${cheeselist.length}');
        setState(() {
          allCheeseList = templist;
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
              title: Text("My Cheese"),
              backgroundColor: Color(0xFFFFC66C),
            ),
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
                        .map((catData) => CategoryItem(
                            catData.title,
                            catData.author,
                            catData.url,
                            catData.id,
                            catData.fav))
                        .toList(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                  ),
            floatingActionButton: Transform.scale(
                scale: 1.1,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFFF6E37),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCheeseAdd()),
                    );
                  },
                )),
          );
        });
  }
}
