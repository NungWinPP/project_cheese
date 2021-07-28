import 'discover.dart';
import 'myCheese.dart';
import 'myFavorite.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

import 'maz_search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    Discover(),
    Search(),
    MyCheese(),
    MyFavorite(),
    Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Discover();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Transform.scale(
          scale: 1.3,
          child: FloatingActionButton(
            backgroundColor: Color(0xFFFF6E37),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Image.asset(
                'images/cheese.png',
                fit: BoxFit.contain,
              ),
            ),
            onPressed: () {
              setState(() {
                currentScreen = MyCheese();
                currentTab = 5;
              });
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Color(0xFFFEF391),
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.1,
                        onPressed: () {
                          setState(() {
                            currentScreen = Discover();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(currentTab == 0
                                ? Icons.explore
                                : Icons.explore_outlined),
                            Text("Discover")
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.1,
                        onPressed: () {
                          setState(() {
                            currentScreen = Search();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(currentTab == 1
                                ? Icons.search
                                : Icons.search_outlined),
                            Text("Search")
                          ],
                        ),
                      ),
                    ],
                  ),

                  //right side

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.1,
                        onPressed: () {
                          setState(() {
                            currentScreen = MyFavorite();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(currentTab == 2
                                ? Icons.favorite
                                : Icons.favorite_border),
                            Text("My Favorite")
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.1,
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(currentTab == 3
                                ? Icons.person
                                : Icons.person_outline),
                            Text("Profile")
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
