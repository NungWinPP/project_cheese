import 'package:flutter/material.dart';
import 'add_image.dart';

class MyCheeseAdd extends StatefulWidget {
  @override
  _MyCheeseAddState createState() => _MyCheeseAddState();
}

class _MyCheeseAddState extends State<MyCheeseAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add New Cheese"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => print(context),
                            child: Container(
                              height: 250,
                              width: 167,
                              child: Text("Default"),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFC66C),
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: Color(0xFFFF6E37), width: 9)),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddImage()),
                            ),
                            child: Container(
                              height: 250,
                              width: 167,
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    border: Border.all(color: Color(0xFFC4C4C4))),
              ))
        ],
      ),
    );
  }
}
